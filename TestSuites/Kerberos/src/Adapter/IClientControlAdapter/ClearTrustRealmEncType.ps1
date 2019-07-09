﻿#############################################################################
## Copyright (c) Microsoft. All rights reserved.
## Licensed under the MIT license. See LICENSE file in the project root for full license information.
#############################################################################

[string]$RemotePassword = $PtfProp_LocalRealm_Users_Admin_Password
[string]$RemoteUserName = $PtfProp_LocalRealm_Users_Admin_Username
[string]$RemoteComputerName = $PtfProp_LocalRealm_KDC01_FQDN
[string]$Command = "ksetup /DelEncTypeAttr " + $PtfProp_TrustedRealm_RealmName

$PWD = ConvertTo-SecureString $RemotePassword -AsPlainText -Force
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $RemoteUserName, $PWD
$Script = [ScriptBlock]::Create($Command)
Invoke-Command -ComputerName $RemoteComputerName -Credential $Cred $Script
