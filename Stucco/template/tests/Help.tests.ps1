BeforeDiscovery {

    # Taken with love from @juneb_get_help (https://raw.githubusercontent.com/juneb/PesterTDD/master/Module.Help.Tests.ps1)

    $outputDir = Join-Path -Path $ENV:BHProjectPath -ChildPath 'Output'
    $outputModDir = Join-Path -Path $outputDir -ChildPath $env:BHProjectName
    $manifest = Import-PowerShellDataFile -Path $env:BHPSModuleManifest
    $outputModVerDir = Join-Path -Path $outputModDir -ChildPath $manifest.ModuleVersion

    # Get module commands
    # Remove all versions of the module from the session. Pester can't handle multiple versions.
    #Get-Module $env:BHProjectName | Remove-Module -Force
    Import-Module -Name (Join-Path -Path $outputModVerDir -ChildPath "$($env:BHProjectName).psd1") -Verbose:$false -ErrorAction Stop

    $params = @{
        Module = (Get-Module $env:BHProjectName)
        CommandType = [System.Management.Automation.CommandTypes[]]'Cmdlet, Function' # Not alias
    }

    if ($PSVersionTable.PSVersion.Major -lt 6) {
        $params.CommandType[0] += 'Workflow'
    }

    $commands = Get-Command @params

    ## When testing help, remember that help is cached at the beginning of each session.
    ## To test, restart session.

}
Describe "Test help for <_.Name>" -ForEach $commands {

    BeforeDiscovery {

        $commandName = $_.Name

        # Context: Parameter help
        $common = 'Debug', 'ErrorAction', 'ErrorVariable', 'InformationAction', 'InformationVariable', 'OutBuffer',
        'OutVariable', 'PipelineVariable', 'Verbose', 'WarningAction', 'WarningVariable', 'Confirm', 'Whatif'

        $parameters = $_.ParameterSets.Parameters |
        Sort-Object -Property Name -Unique |
        Where-Object { $_.Name -notin $common }
        $parameterNames = $parameters.Name

        # The module-qualified command fails on Microsoft.PowerShell.Archive cmdlets
        $help = Get-Help $commandName -ErrorAction SilentlyContinue

        # Context: Help parameter help
        ## Without the filter, WhatIf and Confirm parameters are still flagged in "finds help parameter in code" test
        $helpParameters = $help.Parameters.Parameter |
        Where-Object { $_.Name -notin $common } |
        Sort-Object -Property Name -Unique
        $helpParameterNames = $helpParameters.Name

        # Context: Help links
        # Changed $link to $link*s* (original line: $link = $help.relatedLinks.navigationLink.uri)
        $links = $help.relatedLinks.navigationLink.uri

    }

    BeforeAll {

        # These variables are used in both Discovery and Test phases, so we need to duplicate them here in BeforeAll
        $commandName = $_.Name

        # Context: Parameter help
        $common = 'Debug', 'ErrorAction', 'ErrorVariable', 'InformationAction', 'InformationVariable', 'OutBuffer',
        'OutVariable', 'PipelineVariable', 'Verbose', 'WarningAction', 'WarningVariable', 'Confirm', 'Whatif'

        $parameters = $_.ParameterSets.Parameters |
        Sort-Object -Property Name -Unique |
        Where-Object { $_.Name -notin $common }
        $parameterNames = $parameters.Name

        # The module-qualified command fails on Microsoft.PowerShell.Archive cmdlets
        $help = Get-Help $commandName -ErrorAction SilentlyContinue

        # Context: Help parameter help
        ## Without the filter, WhatIf and Confirm parameters are still flagged in "finds help parameter in code" test
        $helpParameters = $help.Parameters.Parameter |
        Where-Object { $_.Name -notin $common } |
        Sort-Object -Property Name -Unique

        $helpParameterNames = $helpParameters.Name
    }

    # If help is not found, synopsis in auto-generated help is the syntax diagram
    It 'should not be auto-generated' {
        $help.Synopsis | Should -Not -BeLike '*`[`<CommonParameters`>`]*'
    }

    # Should be a description for every function
    It "gets description for <commandName>" {
        $help.Description | Should -Not -BeNullOrEmpty
    }

    # Should be at least one example
    It "gets example code from <commandName>" {
        ($help.Examples.Example | Select-Object -First 1).Code | Should -Not -BeNullOrEmpty
    }

    # Should be at least one example description
    It "gets example help from <commandName>" {
        ($help.Examples.Example.Remarks | Select-Object -First 1).Text | Should -Not -BeNullOrEmpty
    }

    Context "Test <_.Name> parameter help for <commandName>" -Foreach $parameters {

        BeforeAll {

            $parameterName = $_.Name
            $parameterHelp = $help.parameters.parameter | Where-Object Name -EQ $parameterName

        }

        # Should be a description for every parameter
        It "gets help for parameter: <_.Name> : in <commandName>" {
            $parameterHelp.Description.Text | Should -Not -BeNullOrEmpty
        }

        # Required value in Help should match IsMandatory property of parameter
        It "help for <_.Name> parameter in <commandName> has correct Mandatory value" {
            $codeMandatory = $_.IsMandatory.toString()
            $parameterHelp.Required | Should -Be $codeMandatory
        }

        # Parameter type in Help should match code
        # It "help for $commandName has correct parameter type for $parameterName" {
        #     $codeType = $_.ParameterType.Name
        #     # To avoid calling Trim method on a null object.
        #     $helpType = if ($parameterHelp.parameterValue) { $parameterHelp.parameterValue.Trim() }
        #     $helpType | Should -Be $codeType
        # }
    }

    Context "Test <_> help parameter help for <commandName>" -Foreach $helpParameterNames {

        # Shouldn't find extra parameters in help.
        It "finds help parameter in code: <_>" {
            $_ -in $parameterNames | Should -Be $true
        }

    }

    Context "Help Links should be Valid for $commandName" -Foreach $links {

        if ($_) {
            # Should have a valid uri if one is provided.
            it "[$link] should have 200 Status Code for $commandName" {
                $Results = Invoke-WebRequest -Uri $link -UseBasicParsing
                $Results.StatusCode | Should -Be '200'
            }
        }

    }
}
