---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Edit-DiscordWebHookMessage

## SYNOPSIS

Edits a Discord message that was created by the webhook.

## SYNTAX

```powershell
Edit-DiscordWebHookMessage [-Body] <IDictionary> [-Id] <String> [-Url] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION

Uses a message id to edit a message that was sent by the same webhook.

## EXAMPLES

### EXAMPLE 1

```powershell
Edit-DiscordWebHookMessage -Body $body -Id 1234567890123456789 -Url https://discord.com/api/webhooks/0987654321098765432/dFg_5g54KgjP42ger-KL7-rGJk45jpSDvm1WDCXBnKdzHAerBCidpvKWFNDS721KfALV
```

Edits Discord message with id 1234567890123456789.

## PARAMETERS

### -Body

Body to update message with.

```yaml
Type: System.Collections.IDictionary
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Id

Message id to edit.

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

### -Url

Webhook url.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
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
Type: System.Management.Automation.SwitchParameter
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

### System.Collections.IDictionary for the body and System.String for the url

## OUTPUTS

### System.Management.Automation.PSCustomObject

## NOTES

## RELATED LINKS

[Remove-DiscordWebHookMessage](Remove-DiscordWebHookMessage.md)

[Send-DiscordWebHookMessage](Send-DiscordWebHookMessage.md)
