Describe 'Text files formatting' {
    BeforeAll {
        Set-StrictMode -Version latest

        # Make sure MetaFixers.psm1 is loaded
        Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath 'MetaFixers.psm1') -Verbose:$false -Force

        $allTextFiles = Get-TextFilesList $env:BHProjectPath

        $unicodeFilesCount = 0
        $totalTabsCount = 0

        foreach ($textFile in $allTextFiles) {
            if (Test-FileUnicode $textFile) {
                $unicodeFilesCount++
                Write-Warning (
                    "File $($textFile.FullName) contains 0x00 bytes." +
                    " It probably uses Unicode/UTF-16 and needs to be converted to UTF-8." +
                    " Use Fixer 'Get-UnicodeFilesList `$pwd | ConvertTo-UTF8'."
                )
            }
            $fileName = $textFile.FullName
                (Get-Content $fileName -Raw) | Select-String "`t" | Foreach-Object {
                    Write-Warning (
                        "There are tabs in $fileName." +
                        " Use Fixer 'Get-TextFilesList `$pwd | ConvertTo-SpaceIndentation'."
                    )
                    $totalTabsCount++
                }
        }
    }

    It "no text file uses Unicode/UTF-16 encoding" {
        $unicodeFilesCount | Should -Be 0
    }

    It "no text file use tabs for indentations" {
        $totalTabsCount | Should -Be 0
    }
}
