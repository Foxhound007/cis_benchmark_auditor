🔐 CIS Benchmark Auditor (Lite)
Author: Charles G. | Auroch Security
Purpose: Lightweight PowerShell script to check core CIS benchmarks on Windows 10/11 systems.

✅ Checks Performed
Password policy settings
Account lockout settings
RDP configuration
Guest account status
Windows Firewall profile status
Windows Update service status
SMBv1 protocol state
AutoRun/AutoPlay policy
Insecure services (Telnet, FTP, Remote Registry)
Admin shares (C$, ADMIN$)
🚀 Usage
powershell -ExecutionPolicy Bypass -File .\cis_benchmark_auditor_lite.ps1
📦 Requirements
PowerShell 5.1+
Local admin privileges
Windows 10/11 or Server 2016+
📄 Sample Output
[+] Checking RDP status:
RDP: Disabled (Compliant)

[+] Checking Guest Account status:
Guest account: DISABLED (Compliant)

[+] Checking SMBv1 Status:
Disabled

...
This utility is provided for educational and demonstration use by Auroch Security.
