
Function Get-HelloWorld {
    <#
    .SYNOPSIS
        Returns Hello world
    .DESCRIPTION
        Returns Hello world
    .EXAMPLE
        PS> Get-HelloWorld

        Runs the command
    #>
    [CmdletBinding()]
    param (
        # Parameter description can go here or above in format: .PARAMETER  <Parameter-Name>
        [Parameter()]
        [string]
        $Value = 'GetHelloWorld'
    )

    $value
}
