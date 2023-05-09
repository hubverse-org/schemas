# FUNCTIONS ----
get_latest_version <- function() {

    semver_regex <- "^v(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)(?:-((?:0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$"

    latest_version <- dir(".", pattern = semver_regex) |>
        sort() |>
        tail(1)

}
validate_schema <- function(file = c("admin-schema",
                                     "tasks-schema"),
                            version = get_latest_version()) {
    file_path <- file.path(version,
                           paste0(file, ".json"))
    schema <- try(
        jsonvalidate::json_validator(
            file_path,
            engine = "ajv"),
        silent = TRUE)

    if (class(schema) == "try-error") {
        octolog::octo_abort(
            c("x" = "Error detected in file {.path {file_path}}",
              "!" =  attr(schema, "condition")$message),
                            .fail_fast = TRUE)
    } else {
        octolog::octo_inform(
            c("v" = "{.path {file_path}} validated successfully!")
            )
    }
}

# VALIDATIONS ----
octolog::enable_github_colors()

octolog::octo_start_group("Validating schema files...")

octolog::octo_inform("Validating latest schema version {.val {get_latest_version()}}")

# Test failure
validate_schema("admin-schema", version = "v0.0.1")

# Validate admin-schema.json
validate_schema("admin-schema")

# Validate tasks-schema.json
validate_schema("tasks-schema")


octolog::octo_end_group()
