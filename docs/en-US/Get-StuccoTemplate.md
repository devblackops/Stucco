---
external help file: Stucco-help.xml
Module Name: Stucco
online version:
schema: 2.0.0
---

# Get-StuccoTemplate

## SYNOPSIS
Returns Stucco's Plaster template

## SYNTAX

```
Get-StuccoTemplate [<CommonParameters>]
```

## DESCRIPTION
Returns Stucco's Plaster template

## EXAMPLES

### EXAMPLE 1
```
$template = Get-StuccoTemplate
$template | New-StuccoModule
```

Gets the Plaster template from the Stucco module and creates a new module with it

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSObject
## NOTES

## RELATED LINKS

[New-StuccoModule]()

