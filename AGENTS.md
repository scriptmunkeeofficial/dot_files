# Agent Configuration for Dot Files Repository

## Build/Lint/Test Commands
- No specific build commands needed for dot files
- No linting or testing framework used for this repository
- Manual verification of dot files functionality through terminal usage

## Code Style Guidelines

### Formatting
- Use 2 space indentation for all configuration files
- Keep lines under 120 characters when possible
- Use consistent spacing around operators and after commas

### Naming Conventions
- Dot files should be prefixed with "dot." in the repository (e.g., dot.bash_profile)
- Script files should use descriptive names with .sh extension
- Configuration variables should use UPPER_SNAKE_CASE

### Error Handling
- Shell scripts should use `set -euo pipefail` for better error handling
- Include proper logging and exit codes in scripts
- Handle edge cases like existing files/directories gracefully

### Imports and Dependencies
- Use absolute paths when referencing files in scripts
- Document external dependencies in README.md
- Prefer standard Unix tools that are widely available

## Repository Structure
- `files/`: Contains all dot files with "dot." prefix
- `src/`: Contains shell scripts for various setups
- `resources/`: Contains images and screenshots
- Root level: Setup scripts and documentation

## Special Instructions for Agents
- When modifying dot files, maintain backward compatibility
- Preserve user customizations when possible
- Test changes in a clean environment before committing