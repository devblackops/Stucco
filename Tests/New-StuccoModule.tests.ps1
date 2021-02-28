Describe 'New-StuccoModule' {

    BeforeAll {
        # Create the test module
        $testModuleName           = 'MyTestModule'
        $templateTestModulePath   = "TestDrive:/$testModuleName/withtemplate"
        $noTemplateTestModulePath = "TestDrive:/$testModuleName/notemplate"
        $params = @{
            Force           = $true
            NoLogo          = $true
            PassThru        = $true
            TemplateParameters = @{
                ModuleName   = $testModuleName
                Description  = 'My test module'
                Version      = '0.1.0'
                FullName     = 'Stucco'
                License      = 'MIT'
                CoC          = 'No'
                MkDocs       = 'No'
                Classes      = 'Yes'
                PlatyPS      = 'Yes'
                devcontainer = 'Yes'
                CICD         = 'GitHubActions'
            }
        }
        $t = Get-StuccoTemplate

        $templateResult   = $t | New-StuccoModule -DestinationPath $templateTestModulePath @params | Select-Object -Last 1
        $noTemplateResult = New-StuccoModule -DestinationPath $noTemplateTestModulePath @params | Select-Object -Last 1
    }

    Context 'Template provided' {
        It 'Creates a module from a passed in template' {
            # Validate the module was created
            $templateResult.DestinationPath | Should -Exist
            $templateResult.Success         | Should -Be $true

            # Validate some module contents are there
            (Test-Path $templateTestModulePath/.devcontainer)   | Should -Be $true
            (Test-Path $templateTestModulePath/$testModuleName) | Should -Be $true
        }
    }

    Context 'No template provided' {
        it 'Creates a module from the included template' {
            # Validate the module was created
            $noTemplateResult.DestinationPath | Should -Exist
            $noTemplateResult.Success         | Should -Be $true

            # Validate some module contents are there
            (Test-Path $NoTemplateTestModulePath/.devcontainer)   | Should -Be $true
            (Test-Path $NoTemplateTestModulePath/$testModuleName) | Should -Be $true
        }
    }
}
