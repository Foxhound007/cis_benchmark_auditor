# 🔐 CIS Benchmark Auditor (Lite)

**Author:** Charles G. | Auroch Security  
**Purpose:** Lightweight PowerShell script to check core CIS benchmarks on Windows 10/11 systems.

---

## ✅ Checks Performed

1. Password policy settings  
2. Account lockout settings  
3. RDP configuration  
4. Guest account status  
5. Windows Firewall profile status  
6. Windows Update service status  
7. SMBv1 protocol state  
8. AutoRun/AutoPlay policy  
9. Insecure services (Telnet, FTP, Remote Registry)  
10. Admin shares (C$, ADMIN$)

---

## 🚀 Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\cis_benchmark_auditor_lite.ps1
```

---

## 📦 Requirements

- PowerShell 5.1+  
- Local admin privileges  
- Windows 10/11 or Server 2016+

---

## 📄 Sample Output

```
[+] Checking RDP status:
RDP: Disabled (Compliant)

[+] Checking Guest Account status:
Guest account: DISABLED (Compliant)

[+] Checking SMBv1 Status:
Disabled

...
```

---

> *This utility is provided for educational and demonstration use by Auroch Security.*
