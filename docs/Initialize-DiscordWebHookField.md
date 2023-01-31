---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Initialize-DiscordWebHookField

## SYNOPSIS

Creates a new Discord field object.

## SYNTAX

```powershell
Initialize-DiscordWebHookField [-Name] <String> [-Value] <String> [-Inline] [<CommonParameters>]
```

## DESCRIPTION

Creates a Discord field object for use within an embed.

## EXAMPLES

### EXAMPLE 1

```powershell
Initialize-DiscordWebHookField -Name 'Note' -Value 'This is a field'
```

Creates a Discord field object with title 'Note' and content 'This is a field'.

### EXAMPLE 2

```powershell
Initialize-DiscordWebHookField -Name 'Part 1' -Value 'First field' -Inline
```

PS C:\\\> Initialize-DiscordWebHookField -Name 'Part 2' -Value 'Second field' -Inline

Creates a Discord field object with title 'Part 1' and content 'First field'.
Creates a Discord field object with title 'Part 2' and content 'Second field' on the same line/row.

## PARAMETERS

### -Name

The title of the field.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value

The content of the field.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Inline

Whether or not this field should be on the same line/row or not.
Only works if preceding or following field is also inline.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String for the name and value, and System.Switch for inline

## OUTPUTS

### System.Collections.Specialized.OrderedDictionary

## NOTES

## RELATED LINKS

[Initialize-DiscordWebHookEmbed](Initialize-DiscordWebHookEmbed.md)
