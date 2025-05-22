# Modeling Hub Schemas
<!--- Badges --->
[![JSON Schema Valid](https://github.com/hubverse-org/schemas/actions/workflows/check-json-schema-valid.yaml/badge.svg)](https://github.com/hubverse-org/schemas/actions/workflows/check-json-schema-valid.yaml)
<!--- Badges-end --->


This repository houses JSON schemas for [the Consortium of Infectious Disease Modeling Hubs](https://github.com/hubverse-org). These schemas define the specifications for the configuration files that are required to be present in a modeling hub. Full documentation about modeling hubs can be found at [the Modeling Hub documentation site](https://docs.hubverse.io/en/latest/), with some [specific documentation about the schema files](https://docs.hubverse.io/en/latest/user-guide/hub-config.html).

# Versioning

Schemas will be directly versioned, with different versions living in different folders in the root directory of the repo with a name as `vx.x.x` (for example, `v0.0.1`). Any finalized change to any of the three schema files that is added to the main branch will result in the addition of a new set of all schema files. To determine an appropriate version number for the next version, follow [semantic versioning principles](https://snowplow.io/blog/introducing-schemaver-for-semantic-versioning-of-schemas/).

Wen creating new versions and making changes to the schema file, make sure to record important user facing changes in [`NEWS.md`](NEWS.md).

## Schema documentation


The [`HubDocs`](https://docs.hubverse.io/en/latest/index.html) documentation site is the primary location for documenting schema usage. It is also [versioned by using releases](https://docs.readthedocs.io/en/stable/versions.html) and should track releases in this repository. 


After making a new release to the schema repository, ensure `hubDocs` are also appropriately updated and an associated new release in the `hubDocs` repository also created.


## New schema version development process

- New schema versions should be developed in a separate branch. Name the branch `br-v{version-number}` to avoid creating release tags which share the same name as a branch later on.
- Test out the implications of the changes across the hubverse. Checking that nothing breaks in `hubAdmin` is the first step but you'll need to think carefully about potential implcations in other areas and explicitly check and test for these implications. The following steps will help you queue up tests for under development schema.
  - Update the development version `hubUtils` with the new under development version of the schema. Follow the instruction provide in the [`hubUtils` CONTRIBUTING guide](https://hubverse-org.github.io/hubUtils/CONTRIBUTING.html#synchronizing-with-hubverse-orgschemas). Once you install this version locally, you can then use it to start testing the implications of the new schema on other aspects of the hubverse locally first. 
  - Firstly, start by re-running all tests in `hubAdmin`. You can set the version and branch used for testing through global options `"hubAdmin.schema_version"` and `"hubAdmin.branch"` and use them in testing by configuring them with [`withr::with_options()`](https://github.com/hubverse-org/hubAdmin/blob/fdd901697f47bbd22a2e89f1e9fa2ca669199ae8/tests/testthat/test-create_task_id.R#L124C3-L128C6). This should advise you of any breaks introduced to our codebase as a result of schema changes. Address any introduced problems.
  - Next you'll want to ensure that any new properties introduced in the new schema are implemented in the associate `create_*()` family of functions that enables programmatic creation of config files. For features that should only be available before, after or for specific schema versions, the [`hubUtils` `version_*()`](https://hubverse-org.github.io/hubUtils/reference/version_equal.html) family of functions can be helpful.
  - If the changes in the schema result in the requirement for dynamic validation of `tasks.json` config files (which are not covered by basic json validation), you'll need to write appropriate testing functions and include them in the [`perform_dynamic_config_validations()`](https://github.com/hubverse-org/hubAdmin/blob/main/R/validate_config.R).
  - Follow a similar proceedure for any other packages/areas of the hubverse which might be affected by the schema changes, i.e. 1) run all tests to make sure nothing breaks and fix anything that does 2) add new functionality and appropriate tests that make use of new schema features.
  - Once you have tested all implcations across the hubverse you are ready to release the schema.
- New version branches should be merged into `main` when ready to released.
- Merging into `main` should be accompanied by creating an associated formal release in the repository.
- Once the new schema version is merged into main is released, update the version in `hubUtils` to use the main branch, open a PR, merge and make a release of `hubUtils`.
- Then you can update any pull requests queued up in other packages and ensure they use the latest released `hubUtils` version as a minimum requirement.
- Update `HubDocs` site with any additional relevant information associated with the new schema release.
- Create a new release on `hubDocs` using the same version number but without the `v` (e.g. `v0.0.1` would be released as `0.0.1` on `hubDocs`).
- Update the [`hubTemplate`](https://github.com/hubverse-org/hubTemplate) config to reflect the most up to date schema. Create a new release using the same version.


## Highlighting changes to schema in PRs

To bring attention to the changes in new schema versions, it's useful to include in any PR, a print out of the diffs in the `tasks-schema.json` and `admin-schema.json` files compared to the previous version. 

### Automated Process (via GitHub)

After you create a new Pull Request, if you create a new comment with `/diff`, GitHub will automatically generate the diffs of the `tasks-schema.json` and `admin-schema.json` and comment on the pull request.

If you need to update the schema after review, you can update the diffs by creating another `/diff` comment.

If this does not work for any reason, you can follow the manual process below.

### Manual Process

To print the diffs in each file you can use the following commands in the terminal:

#### `admin-schema.json`

```bash
diff -u --color=always $(ls -d */ | sort | tail -n 2 | head -n 1)admin-schema.json $(ls -d */ | sort | tail -n 1)admin-schema.json
```
#### `tasks-schema.json`

```bash
diff -u --color=always $(ls -d */ | sort | tail -n 2 | head -n 1)tasks-schema.json $(ls -d */ | sort | tail -n 1)tasks-schema.json
```

> ### :bulb: Tips
> 
> #### Show diff colours in PR
> To show the colour of the diffs in the PR, wrap the output of the commands in a `diff` code block, e.g.
>
> \```diff  
> \- old line   
> \+ new line    
> \```    
> is rendered in the PR renders as:
> 
> ```diff
> - old line
> + new line
> ```
>
> #### Send output directly to clipboard
> Depending on your system (macOS or Linux), you can pipe the output of the above commands directly to the clipboard. See examples below:
> 
> ##### macOS:
> ```bash
> diff $(ls -d */ | sort | tail -n 2 | head -n 1)tasks-schema.json $(ls -d */ | sort | tail -n 1)tasks-schema.json | pbcopy
>```
>
> ##### Linux:
> Make sure `xclip` is installed. You can install it using your package manager, e.g., `sudo apt-get install xclip` on Debian-based systems.
> ```bash
> diff $(ls -d */ | sort | tail -n 2 | head -n 1)tasks-schema.json $(ls -d */ | sort | tail -n 1)tasks-schema.json | xclip -selection clipboard
>```
>
