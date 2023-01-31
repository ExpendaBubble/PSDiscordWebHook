---
external help file: PSDiscordWebHook-help.xml
Module Name: PSDiscordWebHook
online version:
schema: 2.0.0
---

# Send-DiscordWebHookMessage

## SYNOPSIS
Send a Discord message.

## SYNTAX

```
Send-DiscordWebHookMessage [-Body] <IDictionary> [-Url] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sends a Discord message by webhook.

## EXAMPLES

### EXAMPLE 1
```
Send-DiscordWebHookMessage -Body $body -Url https://discord.com/api/webhooks/0987654321098765432/dFg_5g54KgjP42ger-KL7-rGJk45jpSDvm1WDCXBnKdzHAerBCidpvKWFNDS721KfALV
```

Sends Discord message.

## PARAMETERS

### -Body
Body to send.

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

### System.Collections.IDictionary for the body and System.String for the url.
## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES

## RELATED LINKS

[Initialize-DiscordWebHookMessage]()

[Remove-DiscordWebHookMessage]()

