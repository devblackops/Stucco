@{
    PSDependOptions = @{
        Target = 'CurrentUser'
    }
    'Pester' = @{
        Version = '4.7.3'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    'psake' = @{
        Version = '4.8.0'
    }
    'BuildHelpers' = @{
        Version = '2.0.8'
    }
    'PowerShellBuild' = @{
        Version = '0.3.0'
    }
}
