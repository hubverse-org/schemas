# Modeling Hub Schemas
<!--- Badges --->
[![JSON Schema Valid](https://github.com/hubverse-org/schemas/actions/workflows/check-json-schema-valid.yaml/badge.svg)](https://github.com/hubverse-org/schemas/actions/workflows/check-json-schema-valid.yaml)
<!--- Badges-end --->


This repository houses JSON schemas for [the Consortium of Infectious Disease Modeling Hubs](https://github.com/hubverse-org). These schemas define the specifications for the configuration files that are required to be present in a modeling hub. Full documentation about modeling hubs can be found at [the Modeling Hub documentation site](https://hubdocs.readthedocs.io/en/latest/), with some [specific documentation about the schema files](https://hubverse.io/en/latest/user-guide/hub-config.html).

# Versioning

Schemas will be directly versioned, with different versions living in different folders in the root directory of the repo with a name as `vx.x.x` (for example, `v0.0.1`). Any finalized change to any of the three schema files that is added to the main branch will result in the addition of a new set of all schema files. To determine an appropriate version number for the next version, follow [semantic versioning principles](https://snowplow.io/blog/introducing-schemaver-for-semantic-versioning-of-schemas/).

Wen creating new versions and making changes to the schema file, make sure to record important user facing changes in [`NEWS.md`](NEWS.md).

## Schema documentation


The [`HubDocs`](https://hubdocs.readthedocs.io/en/latest/index.html) documentation site is the primary location for documenting schema usage. It is also [versioned by using releases](https://docs.readthedocs.io/en/stable/versions.html) and should track releases in this repository. 


After making a new release to the schema repository, ensure `hubDocs` are also appropriately updated and an associated new release in the `hubDocs` repository also created.

## New schema version development process

- New schema versions should be developed in a separate branch. Name the branch `v{version-number}-branch` to avoid creating release tags which share the same name as a branch later on.
- New version branches should be merged into `main` when ready to released.
- Merging into `main` should be accompanied by creating an associated formal release in the repository.
- Update `HubDocs` site with any additional relevant information associated with the new schema release.
- Create a new release on `hubDocs` using the same version number but without the `v` (e.g. `v0.0.1` would be released as `0.0.1` on `hubDocs`).
- Update the [`hubTemplate`](https://github.com/hubverse-org/hubTemplate) config to reflect the most up to date schema. Create a new release using the same version#
