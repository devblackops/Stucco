## When testing help, remember that help is cached at the beginning of each session.
## To test, restart session.

# Taken with love from @juneb_get_help (https://raw.githubusercontent.com/juneb/PesterTDD/master/Module.Help.Tests.ps1)

function script:FilterOutCommonParams {
    [CmdletBinding()]
    param ($Params)
    $commonParams = @(
        'Debug', 'ErrorAction', 'ErrorVariable', 'InformationAction', 'InformationVariable',
        'OutBuffer', 'OutVariable', 'PipelineVariable', 'Verbose', 'WarningAction',
        'WarningVariable', 'Confirm', 'Whatif'
    )
    $params | Where-Object { $_.Name -notin $commonParams } | Sort-Object -Property Name -Unique
}

Describe 'Help Tests' {
    BeforeDiscovery {
        # $env:BHProjectName (Module Info from BuildHelpers)
        $params = @{
            Module = (Get-Module $ModuleName)
            CommandType = [System.Management.Automation.CommandTypes[]]'Cmdlet, Function' # Not alias
        }

        if ($PSVersionTable.PSVersion.Major -lt 6) {
            $params.CommandType[0] += 'Workflow'
        }

        $commands = Get-Command @params
    }

    Describe "Command <_.Name>" -ForEach $commands {
        BeforeDiscovery {
            # BeforeDiscovery scope is separate from the below BeforeAll, Describe and It blocks
            $command = $_
            $commandHelp = Get-Help $command.Name -ErrorAction SilentlyContinue

            $commandParameters = script:FilterOutCommonParams -Params $command.ParameterSets.Parameters
            $commandParameterNames = $commandParameters.Name

            $helpParameters = script:FilterOutCommonParams -Params $commandHelp.Parameters.Parameter
            $helpParameterNames = $helpParameters.Name

            $helpLinks = $commandHelp.relatedLinks.navigationLink.uri
        }

        BeforeAll {
            # BeforeDiscovery scope is separate from the below BeforeAll, Describe and It blocks
            # Therefore re-creating the variables.
            $command = $_
            $commandHelp = Get-Help $command.Name -ErrorAction SilentlyContinue

            $commandParameters = script:FilterOutCommonParams -Params $command.ParameterSets.Parameters
            $commandParameterNames = $commandParameters.Name

            $helpParameters = script:FilterOutCommonParams -Params $commandHelp.Parameters.Parameter
        }

        # If help is not found, synopsis in auto-generated help is the syntax diagram
        It 'should not be auto-generated' {
            $commandHelp.Synopsis | Should -Not -BeLike '*`[`<CommonParameters`>`]*'
        }

        # Should be a description for every function
        It "gets description" {
            $commandHelp.Description | Should -Not -BeNullOrEmpty
        }

        # Should be at least one example
        It "gets example code" {
            ($commandHelp.Examples.Example | Select-Object -First 1).Code | Should -Not -BeNullOrEmpty
        }

        # Should be at least one example description
        It "gets example help" {
            ($commandHelp.Examples.Example.Remarks | Select-Object -First 1).Text | Should -Not -BeNullOrEmpty
        }

        It "finds help parameter <_> in command parameters" -ForEach $helpParameterNames {
            $_ -in $commandparameterNames | Should -Be $true
        }

        It "should have 200 Status Code for help link: <_>" -ForEach $helpLinks {
            (Invoke-WebRequest -Uri $_ -UseBasicParsing).StatusCode | Should -Be '200'
        }

        Describe "For Command parameter <_.Name>" -ForEach $commandParameters {
            BeforeAll {
                $commandParameter = $_

                $parameterHelp = $helpParameters | Where-Object {$_.Name -eq $commandParameter.Name}
                $parameterHelpType = if ($parameterHelp.parameterValue) { $parameterHelp.parameterValue.Trim() }
            }

            # Should be a description for every parameter
            It "gets help" {
                $parameterHelp.Description.Text | Should -Not -BeNullOrEmpty
            }

            # Required value in Help should match IsMandatory property of parameter
            It "has correct Mandatory value" {
                $parameterHelp.Required | Should -Be $commandParameter.IsMandatory.toString()
            }

            # Parameter type in Help should match code
            It "has correct parameter type" {
                $parameterHelpType | Should -Be $commandParameter.ParameterType.Name
            }
        }
    }
}
