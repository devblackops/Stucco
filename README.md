# PSStucco <img src="./media/trowel.png" alt="Trowel"  height="8%" width="8%" style="float:right" align="right">

> [!IMPORTANT]  
> This is a rebuild of the [Stucco](https://github.com/devblackops/Stucco) Module with some various tweaks and bugfixes for personal use.
> Feel free to use also. You can view the differences and details by looking at [the commit changes](https://github.com/devblackops/Stucco/compare/main...jimbrig:PSStucco:main) and the [issues from devblackops/Stucco](https://github.com/devblackops/Stucco/issues).

## Contents

- [Badges](#badges)
- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contribution](#contribution)

***

## Badges

| Publish |  PS Gallery | License |
|----------------|-------------|---------|
[![Publish](https://github.com/jimbrig/PSStucco/actions/workflows/publish.yaml/badge.svg)](https://github.com/jimbrig/PSStucco/actions/workflows/publish.yaml) | [![PowerShell Gallery][psgallery-badge]][psgallery] | [![License][license-badge]][license]


## Overview

> [!TIP]
> (PS)Stucco is an **opinionated** [Plaster](https://github.com/PowerShellOrg/Plaster) template for building high-quality [PowerShell](https://github.com/PowerShell/PowerShell) modules.
> This template produces PowerShell projects according to a structure that I and many others in the PowerShell community use.
> Apart from the PowerShell module itself, this template creates project scaffolding that enables effective collaboration with the community.


## Features

- MIT, Apache, or Unlicense licensing options
- Changelog following [Keep a Changelog](http://keepachangelog.com/) guidelines with [Semantic Versioning](http://semver.org/)
- Optional [Code of Conduct](http://contributor-covenant.org)
- Optional [Read The Docs](https://readthedocs.org/) support for online documentation using [Mkdocs](https://www.mkdocs.org/)
- Optional [PlatyPS](https://github.com/PowerShell/platyPS) support for markdown-based help documentation
- Project dependency resolution using [PSDepend](https://github.com/RamblingCookieMonster/PSDepend)
- [psake](https://github.com/psake/psake) tasks using [PowerShellBuild](https://github.com/psake/PowerShellBuild) for build / test automation
- [AppVeyor](https://www.appveyor.com/), [Azure Pipelines](https://azure.microsoft.com/en-us/services/devops/pipelines/) or [GitLab CI/CD](https://docs.gitlab.com/ee/ci/) for CI/CD
- GitHub templates for contributing, issues, and pull requests
- VSCode tasks

## Installation

Install from the [PowerShell Gallery]():

```powershell
Install-PSResource PSStucco
```

## Usage

```powershell
$template = Get-PlasterTemplate -IncludeInstalledModules | Where-Object TemplatePath -Match 'Stucco'

Invoke-Plaster -TemplatePath $template.TemplatePath
```

## Contribution

The goal of this project is help create common patterns for PowerShell module development.
Additional features or capabilities that benefit the community are welcome.

[psgallery-badge]: https://img.shields.io/powershellgallery/dt/stucco.svg
[psgallery]: https://www.powershellgallery.com/packages/PSStucco
[license-badge]: https://img.shields.io/github/license/jimbrig/stucco.svg
[license]: https://www.powershellgallery.com/packages/psstucco
