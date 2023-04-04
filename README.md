# Modeling Hub Schemas

This repository houses JSON schemas for [the Consortium of Infectious Disease Modeling Hubs](https://github.com/Infectious-Disease-Modeling-Hubs). These schemas define the specifications for the configuration files that are required to be present in a modeling hub. Full documentation about modeling hubs can be found at [the Modeling Hub documentation site](https://hubdocs.readthedocs.io/en/latest/), with some [specific documentation about the schema files](https://hubdocs.readthedocs.io/en/latest/format/hub-metadata.html).

# Versioning

Schemas will be directly versioned, with different versions living in different folders in the root directory of the repo with a name as `vx.x.x` (for example, `v0.0.1`). Any finalized change to any of the three schema files that is added to the main branch will result in the addition of a new set of all schema files. To determine an appropriate version number for the next version, follow [semantic versioning principles](https://snowplow.io/blog/introducing-schemaver-for-semantic-versioning-of-schemas/).

## Schema documentation

The [`HubDocs`](https://github.com/Infectious-Disease-Modeling-Hubs/hubDocs/tree/main) documentation site is the primary location for documenting schema usage. It is also [versioned by using releases](https://docs.readthedocs.io/en/stable/versions.html) and should track releases in this repository. 

After making a new release to the schema repository, ensure `hubDocs` are also appropriately updated, especially that URLs to schema files which power the interactive docson widget visualisation of schema in the [`docs/source/format/hub-metadata.md` page](https://github.com/Infectious-Disease-Modeling-Hubs/hubDocs/blob/main/docs/source/format/hub-metadata.md?plain=1) are updated to display the latest versions of `admin.json` and `tasks.json` schema files. Once updated a new release in the `hubDocs` should also be created.

## New schema version development process

- New schema versions should be developed in a separate branch. Name the branch `v{version-number}-branch` to avoid creating release tags which share the same name as a branch later on.
- New version branches should be merged into `main` when ready to released.
- Merging into `main` should be accompanied by creating an associated formal release in the repository.
- Update `HubDocs` site with any additional relevant information associated with the new schema release.
- Create a new release on `hubDocs` using the same version number but without the `v` (e.g. `v0.0.1` would be released as `0.0.1` on `hubDocs`).



