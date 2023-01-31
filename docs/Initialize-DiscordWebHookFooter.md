---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Initialize-DiscordWebHookFooter

## SYNOPSIS
Creates a new Discord footer object.

## SYNTAX

```
Initialize-DiscordWebHookFooter [-Text] <String> [[-IconUrl] <String>] [<CommonParameters>]
```

## DESCRIPTION
The Discord footer object is added to and displayed at the bottom of an embed.

## EXAMPLES

### EXAMPLE 1
```
Initialize-DiscordWebHookFooter -Text 'That's all folks!' -IconUrl 'https://upload.wikimedia.org/wikipedia/en/7/79/Bugsbunny2011.png'
```

Creates a Discord footer object with text and an icon.

## PARAMETERS

### -Text
The footer text.

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

### -IconUrl
A very tiny (24px x 24px) icon displayed left of the footer.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String
## OUTPUTS

### System.Collections.Specialized.OrderedDictionary
## NOTES

## RELATED LINKS

[Initialize-DiscordWebHookEmbed]()

