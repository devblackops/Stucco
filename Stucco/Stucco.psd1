@{
    RootModule        = 'Stucco.psm1'
    ModuleVersion     = '0.5.1'
    GUID              = '24effa48-ac05-4efd-872d-40d556089ce0'
    Author            = 'Brandon Olin'
    CompanyName       = 'Community'
    Copyright         = '(c) Brandon Olin. All rights reserved.'
    Description       = 'An opinionated Plaster template for high-quality PowerShell modules'
    PowerShellVersion = '3.0'
    RequiredModules   = @(
        @{ModuleName = 'BuildHelpers';    ModuleVersion = '2.0.16'}
        @{ModuleName = 'Plaster';         ModuleVersion = '1.1.4'}
        @{ModuleName = 'psake';           ModuleVersion = '4.9.0'}
        @{ModuleName = 'PowerShellBuild'; ModuleVersion = '0.6.1'}
    )
    FunctionsToExport = @(
        'Get-StuccoTemplate'
        'New-StuccoModule'
    )
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Extensions   = @(
                @{
                    Module         = 'Plaster'
                    MinimumVersion = '1.1.4'
                    Details        = @{
                        TemplatePaths = @('.')
                    }
                }
            )
            Tags         = @('Plaster', 'Module', 'Template', 'PSEdition_Core', 'PSEdition_Desktop')
            LicenseUri   = 'https://raw.githubusercontent.com/devblackops/Stucco/main/LICENSE'
            ProjectUri   = 'https://github.com/devblackops/Stucco'
            IconUri      = 'https://raw.githubusercontent.com/devblackops/Stucco/main/media/trowel.png'
            ReleaseNotes = 'https://raw.githubusercontent.com/devblackops/Stucco/main/CHANGELOG.md'
        }
    }
}
