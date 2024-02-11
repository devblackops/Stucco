[cmdletbinding(DefaultParameterSetName = 'Task')]
param(
    # Build task(s) to execute
    [parameter(ParameterSetName = 'task', position = 0)]
    [ArgumentCompleter( {
            param($Command, $Parameter, $WordToComplete, $CommandAst, $FakeBoundParams)
            $psakeFile = './psakeFile.ps1'
            switch ($Parameter) {
                'Task' {
                    if ([string]::IsNullOrEmpty($WordToComplete)) {
                        Get-PSakeScriptTasks -buildFile $psakeFile | Select-Object -ExpandProperty Name
                    } else {
                        Get-PSakeScriptTasks -buildFile $psakeFile |
                            Where-Object { $_.Name -match $WordToComplete } |
                            Select-Object -ExpandProperty Name
                    }
                }
                Default {
                }
            }
        })]
    [string[]]$Task = 'default',
    # Bootstrap dependencies
    [switch]$Bootstrap,
    # List available build tasks
    [parameter(ParameterSetName = 'Help')]
    [switch]$Help,
    [pscredential]$PSGalleryApiKey,
    # Optional properties to pass to psake
    [hashtable]$Properties
)

$ErrorActionPreference = 'Stop'

# Bootstrap dependencies
if ($Bootstrap.IsPresent) {
    Get-PackageProvider -Name Nuget -ForceBootstrap | Out-Null
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    if (-not (Get-Module -Name PSDepend -ListAvailable)) {
        Install-Module -Name PSDepend -Repository PSGallery
    }
    Import-Module -Name PSDepend -Verbose:$false
    Invoke-PSDepend -Path './requirements.psd1' -Install -Import -Force -WarningAction SilentlyContinue
}

# Execute psake task(s)
$psakeFile = './psakeFile.ps1'
if ($Help.IsPresent) {
    Get-PSakeScriptTasks -buildFile $psakeFile  |
        Format-Table -Property Name, Description, Alias, DependsOn
} else {
    Set-BuildEnvironment -Force
    $parameters = @{}
    if ($PSGalleryApiKey) {
        $parameters['galleryApiKey'] = $PSGalleryApiKey
    }
    Invoke-psake -buildFile $psakeFile -taskList $Task -nologo -parameters $parameters
    exit ( [int]( -not $psake.build_success ) )
}
