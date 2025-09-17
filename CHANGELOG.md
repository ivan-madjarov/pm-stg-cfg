# Changelog

## [1.2.2] - 2025-09-17
- Hosts append now inserts two blank lines before the comment and hosts entry to match requested formatting.

## [1.2.1] - 2025-09-17
- Added `run-configure.bat` bootstrapper to run `configure-staging.ps1` elevated with `-ExecutionPolicy Bypass` for easier execution.
- Updated `README.md` with clearer usage instructions and examples.

## [1.2.0] - 2025-09-17
- Improved `configure-staging.ps1` to add a blank line before the comment and hosts entry for better formatting.

## [1.1.0] - 2025-09-17
- Updated shortcuts in `configure-staging.ps1` to use a more relevant icon from `imageres.dll`.
- Improved script documentation and execution policy handling.

## [1.0.0] - 2025-09-17
- Initial release of `pm-stg-cfg` repository.
- Added script to configure hosts file and create shortcuts for Patch Manager Plus 11 Staging System.
