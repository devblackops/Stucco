# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.5.0] 2022-09-15

### Added

[**#28**](https://github.com/devblackops/Stucco/pull/28) Add argument completer to -Task parameter of `build.ps1` in module template (via [@webtroter](https://github.com/webtroter))

### Fixed

[**#PR27**](https://github.com/devblackops/Stucco/pull/27) - Fix comment-based help tests and filtering out common parameters (via [@HeyItsGilbert](https://github.com/HeyItsGilbert))

## [0.4.0] 2021-04-08

### Changed

- Bumped `PowerShellBuild` dependency to `0.6.1`.
- The `-DestinationPath` parameter in `New-StuccoModule` is explicitly set to `Position=0` so the
parameter name is no longer mandatory (e.g.: `New-StuccoModule C:\my\path\to\module`) now works as expected.
- Add `-WhatIf` support to `New-StuccoModule`

### Fixed

- Removed logic trying to dot source `Initialize.ps1`. This file doesn't exist in the templated module.

## [0.3.1] 2021-02-27

### Fixed

- [PowerShellBuild](https://github.com/psake/PowerShellBuild) dependency is now correctly set to 0.5.0

## [0.3.0] 2021-02-27

### Added

- [**#PR16**](https://github.com/devblackops/Stucco/pull/16) - Add parameter description to example function in template module (via [@mikejwhat](https://github.com/mikejwhat))
- You can now pass psake [parameters](https://psake.readthedocs.io/en/latest/pass-parameters/) via the template module build script.
- Added optional VSCode dev container support to Plaster template
- Added function `Get-StuccoTemplate`
  - Returns Stucco's Plaster template object
- Added function `New-StuccoModule`
  - Creates a new module based on the Stucco module template

### Changed

- Required Pester version in template module has been bumped to `5.1.1`
- Clean up Pester tests in template module

### Fixed

- [**#PR22**](https://github.com/devblackops/Stucco/pull/22) - Update dependencies for psake, BuildHelpers, and PSScriptAnalzyer (via [@HP41](https://github.com/HP41))
- [**#PR19**](https://github.com/devblackops/Stucco/pull/19) - Update tests to support Pester v5 (via [@andrewwillett](https://github.com/andrewwillett))
- Classes are now properly supported if the option to include them is selected when creating a module from the template

## [0.2.0] 2019-11-09

### Added

- **#11** - Added support for GitLab CI in module template (via [@sk82jack](https://github.com/sk82jack))
- Added support for GitHub Actions in module template

### Changed

- Bumped versions of dependent modules [Pester](https://github.com/pester/Pester), [BuildHelpers](https://github.com/RamblingCookieMonster/BuildHelpers), and [PowerShellBuild](https://github.com/psake/PowerShellBuild)

### Fixed

- **#11** - Fixed casing of `tests` folder and for `public/private` folders in psm1 (via [@sk82jack](https://github.com/sk82jack))

## [0.1.1] 2019-04-23

### Fixed

- Azure Pipelines yaml file wasn't being output if it was chosen during Plaster execution

## [0.1.0] 2019-04-23

### Added

- Initial release
