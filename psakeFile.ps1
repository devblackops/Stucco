Properties {
    # Set this to $true to create a module with a monolithic PSM1
    $PSBPreference.Build.CompileModule = $false
    $PSBPreference.Help.DefaultLocale = 'en-US'
    $PSBPreference.Test.OutputFile = 'out/testResults.xml'
    $PSBPreference.Build.CopyDirectories = @()
    # Publish settings
    if ($galleryApiKey) {
        $PSBPreference.Publish.PSRepositoryApiKey = $galleryApiKey.GetNetworkCredential().password
    }
}

Task Default -depends Test

Task Test -FromModule PowerShellBuild -minimumVersion '0.6.1'

Task InstallAct {
    if (-not (Get-Command -name act -CommandType Application -ErrorAction SilentlyContinue)) {
        if ($IsWindows) {
            choco install act-cli
        } elseif ($IsLinux) {
            curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
        } elseIf ($IsMacOS) {
            brew install nektos/tap/act
        }
    } else {
        'act already installed'
    }
}

Task TestGHAction -depends Build, InstallAct {
    act -j test -P ubuntu-latest=nektos/act-environments-ubuntu:18.04
}

Task GenerateYAMLHelp -depends GenerateMarkdown {
    If (-not (Get-Command New-YamlHelp -CommandType Function -ErrorAction SilentlyContinue)) {
        Install-Module -Name platyPS -Repository PSGallery -Scope CurrentUser -Force
    }
    New-YamlHelp -Path './Docs/en-US' -OutputFolder './Docs/en-US' -Force
}


# Get-HelpPreview -Path .\Docs\en-US\PSXLDevTools-help.xml
