#!/bin/bash

# OpenCode Extras Installer
# Creates symlinks to commands, agents, and skills

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD='\033[1m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$HOME/.config/opencode}"

# Plugins to install
PLUGINS=("git-helpers" "spec-driven" "debug-tools")

echo -e "${BOLD}OpenCode Extras Installer${NC}"
echo -e "${BLUE}Installing to:${NC} $TARGET_DIR"
echo -e "${BLUE}Source:${NC} $SCRIPT_DIR"
echo ""

# Create target directories if they don't exist
mkdir -p "$TARGET_DIR/commands"
mkdir -p "$TARGET_DIR/agents"
mkdir -p "$TARGET_DIR/skills"

# Function to create symlinks
link_files() {
    local src_dir="$1"
    local dest_dir="$2"
    local file_type="$3"
    local count=0

    if [ -d "$src_dir" ]; then
        for file in "$src_dir"/*; do
            if [ -e "$file" ]; then
                local filename=$(basename "$file")
                local dest="$dest_dir/$filename"

                # Remove existing symlink or file
                if [ -L "$dest" ] || [ -e "$dest" ]; then
                    rm -rf "$dest"
                fi

                ln -s "$file" "$dest"
                echo -e "    ${GREEN}✓${NC} $filename"
                ((count++))
            fi
        done
    fi

    if [ $count -eq 0 ]; then
        echo -e "    ${YELLOW}⚠${NC} No $file_type found"
    else
        echo -e "    ${BLUE}→${NC} $count $file_type(s) linked"
    fi
}

# Install each plugin
for plugin in "${PLUGINS[@]}"; do
    echo -e "${BOLD}${YELLOW}$plugin${NC}"

    if [ ! -d "$SCRIPT_DIR/$plugin" ]; then
        echo -e "  ${RED}✗${NC} Plugin directory not found, skipping..."
        continue
    fi

    echo -e "  ${BLUE}Commands:${NC}"
    link_files "$SCRIPT_DIR/$plugin/commands" "$TARGET_DIR/commands" "command"

    echo -e "  ${BLUE}Agents:${NC}"
    link_files "$SCRIPT_DIR/$plugin/agents" "$TARGET_DIR/agents" "agent"

    echo -e "  ${BLUE}Skills:${NC}"
    link_files "$SCRIPT_DIR/$plugin/skills" "$TARGET_DIR/skills" "skill"

    echo ""
done

echo -e "${GREEN}${BOLD}✓ Installation complete!${NC}"
echo -e "${BLUE}Installed to:${NC} $TARGET_DIR"
echo ""
echo -e "${YELLOW}Available commands:${NC}"
echo "  /git-commit, /git-review, /git-push-pr, /git-summary"
echo "  /spec-init, /spec-plan, /spec-tasks, /spec-implement, /spec-validate"
echo "  /debug"
echo ""
echo -e "${YELLOW}Optional MCPs:${NC} Configure in ~/.config/opencode/opencode.json"
echo "  - context7, chrome-devtools, console-ninja, serena"
echo ""
