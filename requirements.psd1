@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    'Pester' = @{
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    'psake'
    'BuildHelpers'
    'Plaster'
    'PowerShellBuild'
    'PSScriptAnalyzer'
}
