<#
.SYNOPSIS
    CIS Benchmark Auditor (Lite) - Windows 10/11
    Author: Charles G. | Auroch Security
.DESCRIPTION
    Checks ~10 common CIS controls including password policy, RDP config, firewall, services, and account lockout.
#>

Write-Host "=========================================="
Write-Host "🔐  CIS BENCHMARK AUDITOR (LITE)"
Write-Host "Date: $(Get-Date)"
Write-Host "Hostname: $env:COMPUTERNAME"
Write-Host "==========================================`n"

# 1. Password Policy
Write-Host "[+] Checking Password Policy:"
net accounts

# 2. Lockout Policy
Write-Host "`n[+] Checking Account Lockout Policy:"
secedit /export /cfg temp_sec.cfg | Out-Null
Select-String -Path temp_sec.cfg -Pattern "LockoutBadCount", "LockoutDuration", "ResetLockoutCount" | ForEach-Object { $_.Line }
Remove-Item temp_sec.cfg

# 3. RDP Status
Write-Host "`n[+] Checking Remote Desktop status:"
$rdp = Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections
if ($rdp.fDenyTSConnections -eq 1) {
    Write-Host "RDP: Disabled (Compliant)"
} else {
    Write-Host "RDP: Enabled (Not Compliant)"
}

# 4. Guest Account Status
Write-Host "`n[+] Checking Guest Account status:"
$guest = Get-LocalUser -Name "Guest"
if ($guest.Enabled) {
    Write-Host "Guest account: ENABLED (Not Compliant)"
} else {
    Write-Host "Guest account: DISABLED (Compliant)"
}

# 5. Windows Firewall
Write-Host "`n[+] Checking Firewall Profiles:"
Get-NetFirewallProfile | Select-Object Name, Enabled

# 6. Windows Update
Write-Host "`n[+] Checking Windows Update Service:"
Get-Service -Name wuauserv | Select-Object Name, Status, StartType

# 7. SMBv1 status
Write-Host "`n[+] Checking SMBv1 Status:"
$smb1 = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
$smb1.State

# 8. AutoRun/AutoPlay
Write-Host "`n[+] Checking AutoRun/AutoPlay Settings:"
Get-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name NoDriveTypeAutoRun

# 9. Insecure Services (Telnet, FTP, Remote Registry)
Write-Host "`n[+] Checking Insecure Services:"
Get-Service | Where-Object { $_.Name -in @('Telnet', 'FTPSVC', 'RemoteRegistry') } | Select-Object Name, Status, StartType

# 10. Admin shares
Write-Host "`n[+] Checking for Admin Shares (C$, ADMIN$):"
Get-SmbShare | Where-Object { $_.Name -like '*$' } | Select-Object Name, Path

Write-Host "`n✅ Audit Complete. Review results manually for compliance."
#>

