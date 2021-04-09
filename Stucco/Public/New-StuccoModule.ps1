function New-StuccoModule {
    <#
    .SYNOPSIS
        Creates a new module based on the Stucco module template
    .DESCRIPTION
        Creates a new module based on the Stucco module template
    .EXAMPLE
        New-StuccoModule -DestinationPath ./MyModule

        Creates a new module called MyModule in the directory ./MyModule
    .EXAMPLE
        $template = Get-StuccoTemplate
        $params = @{
            DestinationPath = './MyAwesomeModule'
            Force           = $true
            NoLogo          = $true
            TemplateParameters = @{
                ModuleName   = 'MyAwesomeModule'
                Description  = 'My awesome module'
                Version      = '0.1.0'
                FullName     = 'Community'
                License      = 'MIT'
                CoC          = 'No'
                MkDocs       = 'No'
                Classes      = 'Yes'
                PlatyPS      = 'Yes'
                devcontainer = 'Yes'
                CICD         = 'GitHubActions'
            }
        }
        $template | New-StuccoModule @params

        Gets the Stucco template, then creates a hashtable containing all
        required parameters to create a new module without additional prompts.
    .LINK
        Get-StuccoTemplate
    #>
    [CmdletBinding(DefaultParameterSetName = 'notemplate')]
    param(
        # Destination path for new module
        [Parameter(Mandatory, Position = 0)]
        [string]$DestinationPath,

        # Plaster template object
        [Parameter(Mandatory, ParameterSetName = 'template', ValueFromPipeline)]
        [Alias('InputObject')]
        [PSCustomObject]$Template,

        # Template parameters to pass to Invoke-Plaster
        [hashtable]$TemplateParameters = @{},

        # Overwrite existing files in destination path
        [switch]$Force,

        # Suppress the Plaster logo
        [switch]$NoLogo,

        # Return a InvokePlasterInfo object representing the created module
        [switch]$PassThru
    )

    process {
        if ($Template) {
            $templatePath = $Template.TemplatePath
        } else {
            # Get the Plaster template included in the Stucco module
            $moduleBase   = $ExecutionContext.SessionState.Module.ModuleBase
            $t            = Get-PlasterTemplate -Path $moduleBase
            $templatePath = $t.TemplatePath
        }

        if ((Test-Path -Path $templatePath)) {
            $plasterParams = @{
                TemplatePath    = $templatePath
                DestinationPath = $DestinationPath
                Force           = $Force.IsPresent
                NoLogo          = $NoLogo.IsPresent
                PassThru        = $PassThru.IsPresent
            }
            Invoke-Plaster @plasterParams @TemplateParameters
        } else {
            # We should never see this but...belt and suspenders and all that.
            Write-Error "Unable to find Plaster template at [$templatePath]"
        }
    }
}
