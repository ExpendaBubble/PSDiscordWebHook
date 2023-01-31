---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Initialize-DiscordWebHookEmbed

## SYNOPSIS

Constructs a Discord embed object for use within a message.

## SYNTAX

### Default (Default)

```powershell
Initialize-DiscordWebHookEmbed [-Author <IDictionary>] [-Description <String>] [-Fields <IDictionary[]>]
 [-Footer <IDictionary>] [-Image <IDictionary>] [-Thumbnail <IDictionary>] [-Title <String>]
 [<CommonParameters>]
```

### ColorHex

```powershell
Initialize-DiscordWebHookEmbed [-Author <IDictionary>] [-ColorHex <String>] [-Description <String>]
 [-Fields <IDictionary[]>] [-Footer <IDictionary>] [-Image <IDictionary>] [-Thumbnail <IDictionary>]
 [-Title <String>] [<CommonParameters>]
```

### ColorName

```powershell
Initialize-DiscordWebHookEmbed [-Author <IDictionary>] [-ColorName <String>] [-Description <String>]
 [-Fields <IDictionary[]>] [-Footer <IDictionary>] [-Image <IDictionary>] [-Thumbnail <IDictionary>]
 [-Title <String>] [<CommonParameters>]
```

## DESCRIPTION

Creates an embed that can be part of a rich message consisting of various components such as fields and image, a thumbnail, etc.

## EXAMPLES

### EXAMPLE 1

```powershell
Initialize-DiscordWebHookEmbed -Title 'Embed Title' `
```

-Description 'Embed Description' \`
        -Fields $field1,$field2,$field3 \`
        -Author $author \`
        -ColorName 'CamouflageGreen' \`
        -Image $image \`
        -Thumbnail $image

Creates a rich Discord embed object with an author, thumbnail, title, description, 3 fields and a picture.

## PARAMETERS

### -Author

Name of the author, possible with icon and clickable link, displayed at the top of the embed.

```yaml
Type: System.Collections.IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorName

Name of color to use for the left border of the embed.

```yaml
Type: System.String
Parameter Sets: ColorName
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHex

Hex value of color to use for the left border of the embed.

```yaml
Type: System.String
Parameter Sets: ColorHex
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description

Text displayed below the title of the embed.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fields

One or more blocks of content displayed as part of the embed.

```yaml
Type: System.Collections.IDictionary[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Footer

Text displayed at the bottom of the embed, with optional icon.

```yaml
Type: System.Collections.IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Image

A picture to add below the content and fields.

```yaml
Type: System.Collections.IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Thumbnail

A thumbnail picture to add in the top right corner of the embed.

```yaml
Type: System.Collections.IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title

Title text of the embed, displayed just after the author.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String and System.Collections.IDictionary

## OUTPUTS

### System.Collections.IDictionary

## NOTES

## RELATED LINKS

[Initialize-DiscordWebHookAuthor](Initialize-DiscordWebHookAuthor.md)

[Initialize-DiscordWebHookField](Initialize-DiscordWebHookField.md)

[Initialize-DiscordWebHookImage](Initialize-DiscordWebHookImage.md)

[Initialize-DiscordWebHookMessage](Initialize-DiscordWebHookMessage.md)
