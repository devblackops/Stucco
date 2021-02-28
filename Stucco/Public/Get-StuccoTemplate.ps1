function Get-StuccoTemplate {
    <#
    .SYNOPSIS
        Returns Stucco's Plaster template
    .DESCRIPTION
        Returns Stucco's Plaster template
    .EXAMPLE
        $template = Get-StuccoTemplate
        $template | New-StuccoModule

        Gets the Plaster template from the Stucco module and creates a new module with it
    .LINK
        New-StuccoModule
    #>
    [OutputType([PSCustomObject])]
    [cmdletbinding()]
    param()

    $moduleBase = $ExecutionContext.SessionState.Module.ModuleBase
    Get-PlasterTemplate -Path $moduleBase
}
