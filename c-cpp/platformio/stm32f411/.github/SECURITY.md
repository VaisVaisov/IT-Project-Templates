# Security Policy

## Reporting a Vulnerability

**Do not report security vulnerabilities through public GitHub issues.**

To report a security issue:
1. Go to the [Security tab](../../security) of this repository
2. Click **"Report a vulnerability"**

### Response Timeline

- **Acknowledgement**: within 48 hours
- **Fix**: within 30 days for critical issues

## Security Measures in This Template

- **Trivy** CI scan (HIGH/CRITICAL, blocks merge)
- **Dependabot** for automated dependency updates
- **detect-secrets** pre-commit hook
- **PlatformIO static analysis** (`pio check`) in CI
- **Wokwi CI** firmware simulation before release

## Embedded Security Notes

For STM32 projects, consider:
- Enabling **RDP (Read Protection)** level 1 or 2 in production firmware
- Using **hardware RNG** for cryptographic keys
- Storing sensitive data in **backup SRAM** with tamper protection
- Disabling **JTAG/SWD** in production builds
