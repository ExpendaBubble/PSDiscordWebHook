---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Initialize-DiscordWebHookMessage

## SYNOPSIS
Constructs a message object to send to Discord via web hook.

## SYNTAX

```
Initialize-DiscordWebHookMessage [[-AvatarUrl] <String>] [[-Content] <String>] [[-Embeds] <IDictionary[]>]
 [-TextToSpeech] [[-UserName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Discord web hook message object.
Must contain at least some content or one or more embeds.

## EXAMPLES

### EXAMPLE 1
```
Initialize-DiscordWebHookMessage -Content 'Hello World!' -UserName 'Brian Kernighan'
```

Constructs a simple Discord webhook message object.

### EXAMPLE 2
```
Initialize-DiscordWebHookMessage -Embeds $embed -UserName 'Gordon Freeman'
```

Constructs a rich Discord webhook message object.

## PARAMETERS

### -AvatarUrl
Url to avatar image for user.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Content
Plain text content to send.

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

### -Embeds
Rich content to send.

```yaml
Type: System.Collections.IDictionary[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TextToSpeech
Enables text-to-speech for content.

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

### -UserName
User name to use for the message posted by the web hook.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Collections.IDictionary for embeds, System.Boolean for TTS and System.String for everything else.
## OUTPUTS

### System.Collections.IDictionary
## NOTES

## RELATED LINKS

[Initialize-DiscordWebHookEmbed]()

[Send-DiscordWebHookMessage]()

