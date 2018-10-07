properties {
    # Disable "compiling" module into monolithinc PSM1.
    # This modifies the default behavior from the "Build" task
    # in the PowerShellBuild.Common shared psake task module
    $CompileModule = $false
}

task default

task Build -FromModule PowerShellBuild.Common -Version '0.1.0'
