# Agent Configuration for Dot Files Repository

## Overview

This document provides guidelines for AI agents to ensure they interact with this dot files repository safely, consistently, and effectively. This repository contains personal configuration files for various development tools and environments.

## Repository Structure

An overview of the repository layout:

```
.
├── AGENTS.md
├── README.md
├── setup.sh
├── files/
│   ├── dot.bash_profile
│   ├── dot.tmux.conf
│   ├── dot.vimrc
│   └── tmuxline.theme
├── src/
│   ├── internet_speed_test.py
│   ├── tmux_default_session.sh
│   └── tmux-7-dwarfs.sh
├── resources/
│   ├── gruvbox.png
│   └── ...
└── ...
```

**Key Files & Directories:**

*   `AGENTS.md`: This file. Contains instructions for AI agent interaction.
*   `setup.sh`: The main setup script for installing and configuring dot files.
*   `files/`: Contains all dot files, prefixed with `dot.` (e.g., `dot.vimrc`). These are the primary configuration files to be modified.
*   `src/`: Contains helper scripts and supplementary configurations, often used by the main dot files.
*   `resources/`: Contains images, screenshots, and other assets for documentation.

## Build/Lint/Test Commands

*   **Build/Lint**: No specific build or linting commands are required for this repository.
*   **Testing**: Verification must be performed manually.
    *   **Method 1 (Single File)**: After modifying a dotfile, source it in a new, non-login shell session to test its functionality (e.g., `source files/dot.bash_profile`).
    *   **Method 2 (Full Setup)**: To test the entire setup process, run `./setup.sh` in a clean environment (like a Docker container or a fresh VM).

## Code Style Guidelines

### Formatting
- Use 2-space indentation for all configuration files.
- Keep lines under 120 characters where possible.
- Use consistent spacing around operators and after commas.

### Naming Conventions
- Dot files must be prefixed with `dot.` in the `files/` directory (e.g., `dot.bash_profile`).
- Script files should have descriptive names with a `.sh` or `.py` extension.
- Configuration variables should use `UPPER_SNAKE_CASE`.

## Error Handling

- Shell scripts must use `set -euo pipefail` for robust error handling.
- Include descriptive logging and appropriate exit codes in scripts.
- Handle edge cases gracefully. **Example**: Before writing a file or creating a symlink, check if the target already exists to prevent accidental overwrites.

## Security Guidelines

- **No Hardcoded Secrets**: Never hardcode secrets, API keys, or any personally identifiable information (PII) into any file.
- **Use Environment Variables**: When credentials are required, use environment variables or a dedicated secrets management tool.

## Commit Message Guidelines

- **Conventional Commits**: Follow the Conventional Commits specification (e.g., `feat:`, `fix:`, `docs:`, `style:`, `refactor:`).
- **Example**: `feat: add new keybinding for tmux to split panes`

## Special Instructions for Agents

- **Backward Compatibility**: Ensure changes do not break existing setups or remove functionality without explicit instruction.
- **Preserve User Customizations**: Before adding new configurations (e.g., an alias or function), check if a similar user-defined one already exists to avoid conflicts.
- **Clean Environment Testing**: Test significant changes in an isolated environment (e.g., a Docker container) to ensure they don't have unintended side effects on the host system.

