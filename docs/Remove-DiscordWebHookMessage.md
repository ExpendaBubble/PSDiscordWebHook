---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Remove-DiscordWebHookMessage

## SYNOPSIS
Deletes a Discord message that was created by the webhook.

## SYNTAX

```
Remove-DiscordWebHookMessage [-Id] <String> [-Url] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Uses a message id to delete a message that was sent by the same webhook.

## EXAMPLES

### EXAMPLE 1
```
Remove-DiscordWebHookMessage -Id 1234567890123456789 -Url https://discord.com/api/webhooks/0987654321098765432/dFg_5g54KgjP42ger-KL7-rGJk45jpSDvm1WDCXBnKdzHAerBCidpvKWFNDS721KfALV
```

Deletes Discord message with id 1234567890123456789.

## PARAMETERS

### -Id
Message id to delete.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Url
Webhook url.

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

### System.String
## OUTPUTS

## NOTES

## RELATED LINKS

[Edit-DiscordWebHookMessage]()

[Send-DiscordWebHookMessage]()

