---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Initialize-DiscordWebHookImage

## SYNOPSIS
Creates a new Discord image object.

## SYNTAX

```
Initialize-DiscordWebHookImage [-Url] <String> [<CommonParameters>]
```

## DESCRIPTION
Creates a Discord image object for use within an embed.
The alias can be used to distinguish the image's use in your code.

## EXAMPLES

### EXAMPLE 1
```
Initialize-DiscordWebHookImage -Url 'https://upload.wikimedia.org/wikipedia/en/5/5f/TomandJerryTitleCardc.jpg'
```

Creates a Discord picture image object for use within an embed.

### EXAMPLE 2
```
New-DiscordWebHookThumbnail -Url 'https://upload.wikimedia.org/wikipedia/commons/2/20/Tom_%C3%A9s_Jerry.png'
```

Creates a Discord thumbnail image object for use within an embed.

## PARAMETERS

### -Url
The web address of the image.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String for the url, System.Int32 for the width and height.
## OUTPUTS

### System.Collections.Specialized.OrderedDictionary
## NOTES

## RELATED LINKS

[Initialize-DiscordWebHookEmbed]()

