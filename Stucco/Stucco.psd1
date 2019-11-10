@{
    # RootModule = ''
    ModuleVersion     = '0.2.0'
    GUID              = '24effa48-ac05-4efd-872d-40d556089ce0'
    Author            = 'Brandon Olin'
    CompanyName       = 'Community'
    Copyright         = '(c) Brandon Olin. All rights reserved.'
    Description       = 'An opinionated Plaster template for high-quality PowerShell modules'
    PowerShellVersion = '3.0'
    RequiredModules   = @(
        @{ModuleName = 'BuildHelpers';    ModuleVersion = '2.0.11'}
        @{ModuleName = 'Plaster';         ModuleVersion = '1.1.3'}
        @{ModuleName = 'psake';           ModuleVersion = '4.8.0'}
        @{ModuleName = 'PowerShellBuild'; ModuleVersion = '0.4.0'}
    )
    FunctionsToExport = @()
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Extensions   = @(
                @{
                    Module         = 'Plaster'
                    MinimumVersion = '1.1.3'
                    Details        = @{
                        TemplatePaths = @('.')
                    }
                }
            )
            Tags         = @('Plaster', 'Module', 'Template', 'PSEdition_Core', 'PSEdition_Desktop')
            LicenseUri   = 'https://raw.githubusercontent.com/devblackops/Stucco/master/LICENSE'
            ProjectUri   = 'https://github.com/devblackops/Stucco'
            IconUri      = 'https://raw.githubusercontent.com/devblackops/Stucco/master/media/trowel.png'
            ReleaseNotes = 'https://raw.githubusercontent.com/devblackops/Stucco/master/CHANGELOG.md'
        }
    }
}
