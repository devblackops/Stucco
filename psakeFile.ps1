properties {
    $PSBPreference.Help.DefaultLocale = 'en-US'
}

task default -depends test

task Test -FromModule PowerShellBuild -Version 0.4.0

