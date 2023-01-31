---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Initialize-DiscordWebHookAuthor

## SYNOPSIS

Creates a new Discord author object.

## SYNTAX

```powershell
Initialize-DiscordWebHookAuthor [-Name] <String> [[-Url] <String>] [[-IconUrl] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Discord author object is added to and displayed at the top of an embed.

## EXAMPLES

### EXAMPLE 1

```powershell
Initialize-DiscordWebHookAuthor -Name 'Jerry Mouse' -IconUrl 'https://upload.wikimedia.org/wikipedia/en/2/2f/Jerry_Mouse.png' -Url 'https://en.wikipedia.org/wiki/Jerry_Mouse'
```

Creates a Discord author object for Jerry, with a link to his Wikipedia page and his portrait for an icon.

## PARAMETERS

### -Name

The name of the author.

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

### -Url

A clickable link to a website.

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

### -IconUrl

A very tiny (24px x 24px) icon displayed left of the author's name.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

[Initialize-DiscordWebHookEmbed](Initialize-DiscordWebHookEmbed.md)
