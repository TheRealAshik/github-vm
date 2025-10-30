# Project Structure

## Root Directory
```
├── .github/                 # GitHub-specific configuration
│   ├── workflows/          # GitHub Actions workflow definitions
│   │   └── macos.yml      # macOS remote desktop workflow
│   ├── start.sh           # macOS setup script
│   └── login.sh           # macOS login details script
├── .kiro/                  # Kiro AI assistant configuration
│   └── steering/          # AI guidance documents
├── README.md              # Project documentation
└── win2022.txt           # Windows workflow configuration (YAML format)
```

## File Organization Patterns

### Workflow Files
- **Location**: `.github/workflows/`
- **Naming**: Platform-specific (e.g., `macos.yml`)
- **Format**: YAML with GitHub Actions syntax

### Setup Scripts
- **Location**: `.github/`
- **Naming**: Descriptive function names (e.g., `start.sh`, `login.sh`)
- **Platform**: Shell scripts for macOS/Linux, PowerShell for Windows

### Configuration Files
- **Windows workflows**: May be stored as `.txt` files with YAML content
- **Secrets**: Referenced via `${{ secrets.SECRET_NAME }}` syntax
- **Environment variables**: Defined in workflow steps

## Conventions

### Script Permissions
- Shell scripts should be made executable: `chmod +x script.sh`
- PowerShell scripts run with appropriate execution policies

### Security
- Sensitive data (tokens, passwords) stored as GitHub Secrets
- Default credentials: username `runneradmin`, password `P@ssw0rd!`

### Remote Access
- Windows: RDP on port 3389
- macOS: VNC on port 5900
- All connections tunneled through ngrok