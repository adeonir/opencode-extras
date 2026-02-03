#!/bin/bash

# OpenCode Extras Installer
# Creates symlinks to commands, agents, and skills

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$HOME/.config/opencode}"

echo "Installing opencode-extras to: $TARGET_DIR"
echo "Source: $SCRIPT_DIR"
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
                echo "  $filename"
            fi
        done
    fi
}

# Install git-helpers
echo "Installing git-helpers..."
echo "  Commands:"
link_files "$SCRIPT_DIR/git-helpers/commands" "$TARGET_DIR/commands" "commands"
echo "  Agents:"
link_files "$SCRIPT_DIR/git-helpers/agents" "$TARGET_DIR/agents" "agents"
echo "  Skills:"
link_files "$SCRIPT_DIR/git-helpers/skills" "$TARGET_DIR/skills" "skills"

# Install spec-driven
echo ""
echo "Installing spec-driven..."
echo "  Commands:"
link_files "$SCRIPT_DIR/spec-driven/commands" "$TARGET_DIR/commands" "commands"
echo "  Agents:"
link_files "$SCRIPT_DIR/spec-driven/agents" "$TARGET_DIR/agents" "agents"
echo "  Skills:"
link_files "$SCRIPT_DIR/spec-driven/skills" "$TARGET_DIR/skills" "skills"

echo ""
echo "Done! Installed to $TARGET_DIR"
echo ""
