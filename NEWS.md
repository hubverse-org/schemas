# v1.0.0

* Major breaking change: `categorical` output type renamed to `pmf` for consistency in terminology.
* Target type `"categorical"` also renamed to `"nominal"`.
* Minor bug fixes and consistency improvements.
* Added NEWS.md for recording changes to schema.


# v0.0.1

* First stable version of schema for use with Hubs
* Important properties introduced:
  * `schema_version` (required) to link a given congif file to a specific config file schema.
  * `target_metadata` (required) objects to append metadata about targets to model tasks.
  * `file_format` (required in `admin-schema.json` and optional within `tasks-schema.json` rounds) to specify accepted file formats of model output file submissions.
* Removed `model-schema.json`. Examples of these will live in `hubTemplate` repositories and defined by hub administrators.
