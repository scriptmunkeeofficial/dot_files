#!/bin/bash

# Improved setup script with better error handling, dependency checks, and user prompts
# Works on both macOS and Linux

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log() { echo -e "${BLUE}[INFO]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $*"; }

# Platform detection
detect_platform() {
    case "$(uname -s)" in
        Darwin*)  PLATFORM="macos" ;;
        Linux*)   PLATFORM="linux" ;;
        *)        error "Unsupported platform: $(uname -s)"; exit 1 ;;
    esac
    log "Detected platform: $PLATFORM"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Prompt user for yes/no decision
prompt_yes_no() {
    local prompt="$1"
    local default="${2:-y}"
    local response
    
    while true; do
        read -p "$prompt (y/n) [${default}]: " response
        response=${response:-$default}
        case "$response" in
            [Yy]*) return 0 ;;
            [Nn]*) return 1 ;;
            *) echo "Please answer yes or no." ;;
        esac
    done
}

# Install Homebrew (macOS only)
install_homebrew() {
    if [[ "$PLATFORM" == "macos" ]]; then
        if ! command_exists brew; then
            if prompt_yes_no "Homebrew is not installed. Install it now?"; then
                log "Installing Homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                success "Homebrew installed"
            else
                error "Homebrew is required for this setup. Exiting."
                exit 1
            fi
        else
            log "Homebrew is already installed"
        fi
    fi
}

# Install base packages
install_base_packages() {
    if prompt_yes_no "Install base applications?"; then
        log "Installing base applications..."
        
        if [[ "$PLATFORM" == "macos" ]]; then
            # macOS packages
            brew tap universal-ctags/universal-ctags
            
            # Install packages with error handling
            local packages=(
                "tmux" "urlview" "reattach-to-user-namespace" "sqlite" 
                "wget" "svn" "bat" "bash-completion" "yazi" "fzf" "ffmpeg" 
                "the_silver_searcher" "zoxide"
            )
            
            for package in "${packages[@]}"; do
                if ! brew list --formula | grep -q "^${package}$" && ! brew list --cask | grep -q "^${package}$"; then
                    log "Installing $package..."
                    if ! brew install "$package"; then
                        warn "Failed to install $package"
                    fi
                else
                    log "$package is already installed"
                fi
            done
            
            # Install HEAD version of universal-ctags
            if ! brew list --formula | grep -q "^universal-ctags$"; then
                log "Installing universal-ctags (HEAD)..."
                if ! brew install --HEAD universal-ctags; then
                    warn "Failed to install universal-ctags (HEAD)"
                fi
            fi
            
            # Install cask applications
            local cask_packages=("iterm2" "visual-studio-code" "macvim" "orbstack" "tableplus" "discord" "raycast" "rectangle")
            
            for package in "${cask_packages[@]}"; do
                if ! brew list --cask | grep -q "^${package}$"; then
                    log "Installing cask package $package..."
                    if ! brew install --cask "$package"; then
                        warn "Failed to install cask package $package"
                    fi
                else
                    log "Cask package $package is already installed"
                fi
            done
        else
            # Linux packages (Ubuntu/Debian as example)
            log "Installing packages for Linux..."
            if ! command_exists sudo; then
                error "sudo is required but not found. Please run as root or install sudo."
                exit 1
            fi
            
            sudo apt update
            
            local packages=(
                "tmux" "sqlite3" "wget" "bat" "fzf" "ffmpeg" "silversearcher-ag" 
                "zoxide" "curl" "git" "vim" "build-essential"
            )
            
            for package in "${packages[@]}"; do
                if ! dpkg -l | grep -q "^ii  ${package}"; then
                    log "Installing $package..."
                    if ! sudo apt install -y "$package"; then
                        warn "Failed to install $package"
                    fi
                else
                    log "$package is already installed"
                fi
            done
        fi
        
        success "Base applications installation process completed"
    fi
}

# Install fonts
install_fonts() {
    if prompt_yes_no "Install fonts?"; then
        log "Installing fonts..."
        
        if [[ "$PLATFORM" == "macos" ]]; then
            brew tap homebrew/cask-fonts
            
            local fonts=(
                "font-source-code-pro-for-powerline" "font-anonymous-pro"
                "font-liberation-nerd-font" "font-3270-nerd-font" "font-anonymice-nerd-font"
                "font-menlo-for-powerline" "font-dejavu-sans-mono-nerd-font" "font-droid-sans-mono-nerd-font"
                "font-roboto-mono-nerd-font" "font-ubuntu-mono-nerd-font" "font-ubuntu-nerd-font"
                "font-ubuntu-sans-nerd-font" "font-victor-mono-nerd-font" "font-sauce-code-pro-nerd-font"
                "font-jetbrains-mono-nerd-font"
            )
            
            for font in "${fonts[@]}"; do
                if ! brew list --cask | grep -q "^${font}$"; then
                    log "Installing font $font..."
                    if ! brew install --cask "$font"; then
                        warn "Failed to install font $font"
                    fi
                else
                    log "Font $font is already installed"
                fi
            done
        else
            # For Linux, we might need a different approach
            log "Font installation on Linux not implemented in this script"
            log "Please install Nerd Fonts manually from https://www.nerdfonts.com/"
        fi
        
        success "Fonts installation process completed"
    fi
}

# Setup iTerm2 themes (macOS only)
setup_iterm_themes() {
    if [[ "$PLATFORM" == "macos" ]] && prompt_yes_no "Setup iTerm2 themes?"; then
        log "Setting up iTerm2 themes..."
        
        if [ ! -d themes ]; then
            mkdir themes
        fi
        
        cd themes || exit 1
        if curl -s https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Hybrid.itermcolors -o Hybrid.itermcolors; then
            log "Downloaded Hybrid.itermcolors"
        else
            warn "Failed to download Hybrid.itermcolors"
        fi
        
        if curl -s https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/nord.itermcolors -o nord.itermcolors; then
            log "Downloaded nord.itermcolors"
        else
            warn "Failed to download nord.itermcolors"
        fi
        
        cd ../ || exit 1
        success "iTerm2 themes downloaded"
    fi
}

# Setup VIM
setup_vim() {
    if prompt_yes_no "Setup VIM?"; then
        log "Setting up VIM..."
        
        local current_path=$(pwd)
        
        # Create vim directories if they don't exist
        if [ ! -d ~/.vim/autoload ]; then
            mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
            log "Created .vim directories"
        else
            warn ".vim folder already exists"
        fi
        
        # Symlink vimrc if it doesn't exist
        if [ ! -f ~/.vimrc ] || [ ! -L ~/.vimrc ]; then
            ln -sf "$current_path/files/dot.vimrc" ~/.vimrc
            log "Symlinked .vimrc"
        else
            warn ".vimrc already exists"
        fi
        
        # Install vim-plug if not present
        if [ ! -f ~/.vim/autoload/plug.vim ]; then
            log "Installing vim-plug..."
            if curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; then
                log "vim-plug installed"
            else
                warn "Failed to install vim-plug"
            fi
        else
            log "vim-plug already installed"
        fi
        
        success "VIM setup completed"
    fi
}

# Setup Tmux
setup_tmux() {
    if prompt_yes_no "Setup Tmux?"; then
        log "Setting up Tmux..."
        
        # Create tmux plugin directory
        if [ ! -d ~/.tmux/plugins ]; then
            mkdir -p ~/.tmux/plugins
            log "Created tmux plugin directory"
        fi
        
        # Symlink tmux.conf if it doesn't exist
        local current_path=$(pwd)
        if [ ! -f ~/.tmux.conf ] || [ ! -L ~/.tmux.conf ]; then
            ln -sf "$current_path/files/dot.tmux.conf" ~/.tmux.conf
            log "Symlinked .tmux.conf"
        else
            warn ".tmux.conf already exists"
        fi
        
        # Install tpm (Tmux Plugin Manager)
        if [ ! -d ~/.tmux/plugins/tpm ]; then
            log "Installing TPM (Tmux Plugin Manager)..."
            if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
                log "TPM installed"
            else
                warn "Failed to install TPM"
            fi
        else
            log "TPM already installed"
        fi
        
        # Symlink theme file
        if [ ! -f ~/.tmux/tmuxline.theme ]; then
            mkdir -p ~/.tmux
            ln -sf "$current_path/files/tmuxline.theme" ~/.tmux/
            log "Symlinked tmuxline.theme"
        else
            warn "tmuxline.theme already exists"
        fi
        
        # Adding Tmux Default Sessions to the PATH
        if [ ! -d ~/bin ]; then
            mkdir ~/bin
        fi
        
        ln -sf "$current_path/src/tmux_default_session.sh" ~/bin/
        ln -sf "$current_path/src/tmux-7-dwarfs.sh" ~/bin/
        
        success "Tmux setup completed"
    fi
}

# Setup Bash
setup_bash() {
    if prompt_yes_no "Setup Bash profile?"; then
        log "Setting up Bash profile..."
        
        local current_path=$(pwd)
        
        # Symlink bash profile
        if [ ! -f ~/.bash_profile ] || [ ! -L ~/.bash_profile ]; then
            ln -sf "$current_path/files/dot.bash_profile" ~/.bash_profile
            log "Symlinked .bash_profile"
        else
            warn ".bash_profile already exists"
        fi
        
        # Create local shell profile if it doesn't exist
        if [ ! -f ~/.local_shell_profile ] || [ ! -L ~/.local_shell_profile ]; then
            touch ~/.local_shell_profile
            
            cat > ~/.local_shell_profile <<'EOF'
#!/bin/sh

# Local shell profile settings
# Add your personal shell profile attributes here (e.g., API keys, personal aliases)

################################################################################
# Aliases
################################################################################


################################################################################
# Environment Variables
################################################################################


################################################################################
# PATH Additions
################################################################################

EOF
            log "Created ~/.local_shell_profile"
        else
            log "~/.local_shell_profile already exists"
        fi
        
        success "Bash profile setup completed"
    fi
}

# Main function
main() {
    log "Starting improved dotfiles setup..."
    
    # Detect platform
    detect_platform
    
    # Install Homebrew on macOS
    install_homebrew
    
    # Install base packages
    install_base_packages
    
    # Install fonts
    install_fonts
    
    # Setup iTerm2 themes (macOS only)
    if [[ "$PLATFORM" == "macos" ]]; then
        setup_iterm_themes
    fi
    
    # Setup VIM
    setup_vim
    
    # Setup Tmux
    setup_tmux
    
    # Setup Bash
    setup_bash
    
    success "Setup completed! Please restart your terminal or run 'source ~/.bash_profile'"
}

# Run main function
main "$@"