Describe 'Module manifest' {
    BeforeAll {
        # Module Info (From BuildHelpers)
        $ModuleName         = $env:BHProjectName
        $ModuleManifestPath = $env:BHPSModuleManifest

        $ManifestData = Test-ModuleManifest -Path $ModuleManifestPath `
                                            -ErrorAction Stop `
                                            -WarningAction SilentlyContinue `
                                            -Verbose:$false

        $ChangelogPath    = Join-Path -Path $env:BHProjectPath -ChildPath 'CHANGELOG.md'
        $ChangelogVersion = $null
        foreach ($line in (Get-Content $ChangelogPath)) {
            if ($line -match "^##\s\[(?<Version>(\d+\.){1,3}\d+)\]") {
                $ChangelogVersion = $matches.Version
                break
            }
        }
    }

    It 'has a valid manifest' {
        $ManifestData | Should -Not -BeNullOrEmpty
    }

    It 'has a valid name in the manifest' {
        $ManifestData.Name | Should -Be $ModuleName
    }

    It 'has a valid version in the manifest' {
        $ManifestData.Version -as [Version] | Should -Not -BeNullOrEmpty
    }

    It 'has a valid description' {
        $ManifestData.Description | Should -Not -BeNullOrEmpty
    }

    It 'has a valid author' {
        $ManifestData.Author | Should -Not -BeNullOrEmpty
    }

    It 'has a valid guid' {
        { [guid]::Parse($ManifestData.Guid) } | Should -Not -Throw
    }

    It 'has a valid copyright' {
        $ManifestData.CopyRight | Should -Not -BeNullOrEmpty
    }

    It 'has a valid version in the changelog' {
        $ChangelogVersion               | Should -Not -BeNullOrEmpty
        $ChangelogVersion -as [Version] | Should -Not -BeNullOrEmpty
    }

    It 'changelog and manifest versions are the same' {
        $ChangelogVersion -as [Version] | Should -Be ( $ManifestData.Version -as [Version] )
    }
}

Describe 'Git Tagging' {
    BeforeAll {
        $GitTagVersion = $null
        if (Get-Command git.exe -ErrorAction SilentlyContinue) {
            $thisCommit = git.exe log --decorate --oneline HEAD~1..HEAD
            if ($thisCommit -match 'tag:\s*(\d+(?:\.\d+)*)') { GitTagVersion = $matches[1] }
        }

         # Module Info (From BuildHelpers)
         $ManifestData = Test-ModuleManifest -Path $env:BHPSModuleManifest `
                                             -ErrorAction Stop `
                                             -WarningAction SilentlyContinue `
                                             -Verbose:$false
    }

    It 'is tagged with a valid version' -Skip {
        $GitTagVersion               | Should Not BeNullOrEmpty
        $GitTagVersion -as [Version] | Should Not BeNullOrEmpty
    }

    It 'matches Manifest version' -Skip {
        $ManifestData.Version -as [Version] | Should be ( $GitTagVersion -as [Version] )
    }
}
