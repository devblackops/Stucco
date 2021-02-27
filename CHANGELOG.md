# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.3.0] Unreleased

### Added

- [**#PR16**](https://github.com/devblackops/Stucco/pull/16) - Add parameter description to example function in template module (via [@mikejwhat](https://github.com/mikejwhat))

### Fixed

- [**#PR22**](https://github.com/devblackops/Stucco/pull/22) - Update dependencies for psake, BuildHelpers, and PSScriptAnalzyer (via [@HP41](https://github.com/HP41))
- [**#PR19**](https://github.com/devblackops/Stucco/pull/19) - Update tests to support Pester v5 (via [@andrewwillett](https://github.com/andrewwillett))

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
