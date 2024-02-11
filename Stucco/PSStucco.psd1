@{
    RootModule        = 'PSStucco.psm1'
    ModuleVersion     = '0.6.0'
    GUID              = '24effa48-ac05-4efd-872d-40d556089ce0'
    Author            = 'Jimmy Briggs'
    CompanyName       = 'Community'
    Copyright         = '(c) Jimmy Briggs. All rights reserved.'
    Description       = 'An opinionated Plaster template for high-quality PowerShell modules'
    PowerShellVersion = '3.0'
    RequiredModules   = @(
        @{ModuleName = 'BuildHelpers'}
        @{ModuleName = 'Plaster'}
        @{ModuleName = 'psake'}
        @{ModuleName = 'PowerShellBuild'}
    )
    FunctionsToExport = @(
        'Get-PSStuccoTemplate'
        'New-PSStuccoModule'
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
            LicenseUri   = 'https://raw.githubusercontent.com/jimbrig/PSStucco/main/LICENSE'
            ProjectUri   = 'https://github.com/jimbrig/PSStucco'
            IconUri      = 'https://raw.githubusercontent.com/jimbrig/Stucco/main/media/trowel.png'
            ReleaseNotes = 'https://raw.githubusercontent.com/jimbrig/Stucco/main/CHANGELOG.md'
        }
    }
}
