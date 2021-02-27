# Stucco

| GitHub Actions |  PS Gallery | License |
|----------------|-------------|---------|
[![GitHub Actions Status][github-actions-badge]][github-actions-build] | [![PowerShell Gallery][psgallery-badge]][psgallery] | [![License][license-badge]][license]

---

<p align="center">
    <img src="./media/trowel.png" alt="Trowel">
</p>

Stucco is an **opinionated** [Plaster](https://github.com/PowerShellOrg/Plaster) template for building high-quality [PowerShell](https://github.com/PowerShell/PowerShell) modules.
This template produces PowerShell projects according to a structure that I and many others in the PowerShell community use.
Apart from the PowerShell module itself, this template creates project scaffolding that enables effective collaboration with the community.


## Features

- MIT or Apache licensing options
- Changelog following [Keep a Changelog](http://keepachangelog.com/) guidelines with [Semantic Versioning](http://semver.org/)
- Optional [Code of Conduct](http://contributor-covenant.org)
- Optional [Read The Docs](https://readthedocs.org/) support for online documentation using [Mkdocs](https://www.mkdocs.org/)
- Optional [PlatyPS](https://github.com/PowerShell/platyPS) support for markdown-based help documentation
- Project dependency resolution using [PSDepend](https://github.com/RamblingCookieMonster/PSDepend)
- [psake](https://github.com/psake/psake) tasks using [PowerShellBuild](https://github.com/psake/PowerShellBuild) for build / test automation
- [AppVeyor](https://www.appveyor.com/), [Azure Pipelines](https://azure.microsoft.com/en-us/services/devops/pipelines/) or [GitLab CI/CD](https://docs.gitlab.com/ee/ci/) for CI/CD
- GitHub templates for contributing, issues, and pull requests
- VSCode tasks

## Usage

```powershell
$template = Get-PlasterTemplate -IncludeInstalledModules | Where-Object TemplatePath -Match 'Stucco'

Invoke-Plaster -TemplatePath $template.TemplatePath
```

## Contributions Welcome

The goal of this project is help create common patterns for PowerShell module development.
Additional features or capabilities that benefit the community are welcome.

[github-actions-badge]: https://github.com/devblackops/stucco/workflows/CI/badge.svg
[github-actions-build]: https://github.com/devblackops/stucco/actions
[psgallery-badge]: https://img.shields.io/powershellgallery/dt/stucco.svg
[psgallery]: https://www.powershellgallery.com/packages/stucco
[license-badge]: https://img.shields.io/github/license/devblackops/stucco.svg
[license]: https://www.powershellgallery.com/packages/stucco
