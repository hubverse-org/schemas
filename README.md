# Modeling Hub Schemas
<!--- Badges --->
[![JSON Schema Valid](https://github.com/hubverse-org/schemas/actions/workflows/check-json-schema-valid.yaml/badge.svg)](https://github.com/hubverse-org/schemas/actions/workflows/check-json-schema-valid.yaml)
<!--- Badges-end --->


This repository houses JSON schemas for [the Consortium of Infectious Disease Modeling Hubs](https://github.com/hubverse-org). These schemas define the specifications for the configuration files that are required to be present in a modeling hub. Full documentation about modeling hubs can be found at [the Modeling Hub documentation site](https://hubverse.io/en/latest/), with some [specific documentation about the schema files](https://hubverse.io/en/latest/user-guide/hub-config.html).

# Versioning

Schemas will be directly versioned, with different versions living in different folders in the root directory of the repo with a name as `vx.x.x` (for example, `v0.0.1`). Any finalized change to any of the three schema files that is added to the main branch will result in the addition of a new set of all schema files. To determine an appropriate version number for the next version, follow [semantic versioning principles](https://snowplow.io/blog/introducing-schemaver-for-semantic-versioning-of-schemas/).

Wen creating new versions and making changes to the schema file, make sure to record important user facing changes in [`NEWS.md`](NEWS.md).

## Schema documentation


The [`HubDocs`](https://hubverse.io/en/latest/index.html) documentation site is the primary location for documenting schema usage. It is also [versioned by using releases](https://docs.readthedocs.io/en/stable/versions.html) and should track releases in this repository. 


After making a new release to the schema repository, ensure `hubDocs` are also appropriately updated and an associated new release in the `hubDocs` repository also created.


## New schema version development process

- New schema versions should be developed in a separate branch. Name the branch `br-v{version-number}` to avoid creating release tags which share the same name as a branch later on.
- New version branches should be merged into `main` when ready to released.
- Merging into `main` should be accompanied by creating an associated formal release in the repository.
- Re-run all tests in `hubAdmin`, address any introduced problems and update snapshots to latest schema version.
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
