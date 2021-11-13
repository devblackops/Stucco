---
external help file: Stucco-help.xml
Module Name: Stucco
online version:
schema: 2.0.0
---

# New-StuccoModule

## SYNOPSIS
Creates a new module based on the Stucco module template

## SYNTAX

### notemplate (Default)
```
New-StuccoModule [-DestinationPath] <String> [-TemplateParameters <Hashtable>] [-Force] [-NoLogo] [-PassThru]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### template
```
New-StuccoModule [-DestinationPath] <String> -Template <PSObject> [-TemplateParameters <Hashtable>] [-Force]
 [-NoLogo] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates a new module based on the Stucco module template

## EXAMPLES

### EXAMPLE 1
```
New-StuccoModule -Destinationpath ./MyModule
```

Creates a new module called MyModule in the directory ./MyModule

## PARAMETERS

### -DestinationPath
Destination path for new module

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Template
{{ Fill Template Description }}

```yaml
Type: PSObject
Parameter Sets: template
Aliases: InputObject

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TemplateParameters
{{ Fill TemplateParameters Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Overwrite existing files in destination path

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoLogo
Suppress the Plaster logo

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Return a InvokePlasterInfo object representing the created module

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-StuccoTemplate]()

