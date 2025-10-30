# Technology Stack

## Core Technologies
- **GitHub Actions**: CI/CD platform for workflow automation
- **ngrok**: Secure tunneling service for exposing local services
- **PowerShell**: Windows automation and configuration
- **Bash**: macOS/Linux shell scripting

## Platform Support
- **Windows**: Windows Server 2022 (windows-latest runner)
- **macOS**: macOS latest runner

## Remote Access Protocols
- **Windows**: Remote Desktop Protocol (RDP) on port 3389
- **macOS**: VNC (Virtual Network Computing) on port 5900

## Required Secrets
- `NGROK_AUTH_TOKEN`: Authentication token for ngrok service

## Common Commands

### Manual Workflow Dispatch
```bash
# Trigger workflows manually through GitHub UI or CLI
gh workflow run macos.yml
```

### Windows Setup Commands
```powershell
# Enable Terminal Services
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -Value 0

# Configure firewall for RDP
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Set user password
Set-LocalUser -Name "runneradmin" -Password (ConvertTo-SecureString -AsPlainText "P@ssw0rd!" -Force)
```

### macOS Setup Commands
```bash
# Disable Spotlight indexing for performance
sudo mdutil -i off -a

# Install ngrok via Homebrew
brew install --cask ngrok

# Start ngrok tunnel
ngrok tcp 5900 --region=in
```