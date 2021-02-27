@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    'Pester' = @{
        Version = '5.1.1'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    'psake' = @{
        Version = '4.9.0'
    }
    'BuildHelpers' = @{
        Version = '2.0.16'
    }
    'PowerShellBuild' = @{
        Version = '0.4.0'
    }
}
