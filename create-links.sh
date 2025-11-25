#!/bin/bash

# This script symlinks slash commands and agent instructions to Claude Code and Codex.
#
# For each symlink, the script:
# 1. Removes any existing symlink at the target location
# 2. Warns and skips if a non-symlink file exists (to avoid overwriting real files)
# 3. Creates a new symlink if the target doesn't exist

# Configuration - set to true/false to enable/disable linking
LINK_CLAUDE=true
LINK_CODEX=false

# Source directory (run this script from the repo root)
SOURCE_DIR="$(pwd)/slash-commands"

# Source files - detect which exist
CLAUDE_MD_FILE="$(pwd)/CLAUDE.md"
AGENTS_MD_FILE="$(pwd)/AGENTS.md"

# Determine which source file to use for each target
if [ -f "$CLAUDE_MD_FILE" ] && [ -f "$AGENTS_MD_FILE" ]; then
    # Both exist: use CLAUDE.md for Claude, AGENTS.md for Codex
    CLAUDE_MD_SOURCE="$CLAUDE_MD_FILE"
    AGENTS_MD_SOURCE="$AGENTS_MD_FILE"
elif [ -f "$CLAUDE_MD_FILE" ]; then
    # Only CLAUDE.md exists: use it for both
    CLAUDE_MD_SOURCE="$CLAUDE_MD_FILE"
    AGENTS_MD_SOURCE="$CLAUDE_MD_FILE"
elif [ -f "$AGENTS_MD_FILE" ]; then
    # Only AGENTS.md exists: use it for both
    CLAUDE_MD_SOURCE="$AGENTS_MD_FILE"
    AGENTS_MD_SOURCE="$AGENTS_MD_FILE"
else
    echo "Warning: Neither CLAUDE.md nor AGENTS.md found in $(pwd), so nothing will be linked."
    CLAUDE_MD_SOURCE=""
    AGENTS_MD_SOURCE=""
fi

# Target directories
CLAUDE_COMMANDS_TARGET="$HOME/.claude/commands"
CODEX_PROMPTS_TARGET="$HOME/.codex/prompts"
CLAUDE_MD_TARGET="$HOME/.claude/CLAUDE.md"
CODEX_AGENTS_TARGET="$HOME/.codex/AGENTS.md"

# Link for Claude Code
if [ "$LINK_CLAUDE" = true ]; then
    # Link slash commands
    if [ -L "$CLAUDE_COMMANDS_TARGET" ]; then
        echo "Removing existing symlink at $CLAUDE_COMMANDS_TARGET"
        rm "$CLAUDE_COMMANDS_TARGET"
    elif [ -e "$CLAUDE_COMMANDS_TARGET" ]; then
        echo "Warning: $CLAUDE_COMMANDS_TARGET exists and is not a symlink. Skipping."
    fi

    if [ ! -e "$CLAUDE_COMMANDS_TARGET" ]; then
        mkdir -p "$(dirname "$CLAUDE_COMMANDS_TARGET")"
        ln -s "$SOURCE_DIR" "$CLAUDE_COMMANDS_TARGET"
        echo "Created symlink: $CLAUDE_COMMANDS_TARGET -> $SOURCE_DIR"
    fi

    # Link CLAUDE.md
    if [ -n "$CLAUDE_MD_SOURCE" ]; then
        if [ -L "$CLAUDE_MD_TARGET" ]; then
            echo "Removing existing symlink at $CLAUDE_MD_TARGET"
            rm "$CLAUDE_MD_TARGET"
        elif [ -e "$CLAUDE_MD_TARGET" ]; then
            echo "Warning: $CLAUDE_MD_TARGET exists and is not a symlink. Skipping."
        fi

        if [ ! -e "$CLAUDE_MD_TARGET" ]; then
            ln -s "$CLAUDE_MD_SOURCE" "$CLAUDE_MD_TARGET"
            echo "Created symlink: $CLAUDE_MD_TARGET -> $CLAUDE_MD_SOURCE"
        fi
    fi
fi

# Link for Codex
if [ "$LINK_CODEX" = true ]; then
    # Link slash commands (prompts)
    if [ -L "$CODEX_PROMPTS_TARGET" ]; then
        echo "Removing existing symlink at $CODEX_PROMPTS_TARGET"
        rm "$CODEX_PROMPTS_TARGET"
    elif [ -e "$CODEX_PROMPTS_TARGET" ]; then
        echo "Warning: $CODEX_PROMPTS_TARGET exists and is not a symlink. Skipping."
    fi

    if [ ! -e "$CODEX_PROMPTS_TARGET" ]; then
        mkdir -p "$(dirname "$CODEX_PROMPTS_TARGET")"
        ln -s "$SOURCE_DIR" "$CODEX_PROMPTS_TARGET"
        echo "Created symlink: $CODEX_PROMPTS_TARGET -> $SOURCE_DIR"
    fi

    # Link AGENTS.md
    if [ -n "$AGENTS_MD_SOURCE" ]; then
        if [ -L "$CODEX_AGENTS_TARGET" ]; then
            echo "Removing existing symlink at $CODEX_AGENTS_TARGET"
            rm "$CODEX_AGENTS_TARGET"
        elif [ -e "$CODEX_AGENTS_TARGET" ]; then
            echo "Warning: $CODEX_AGENTS_TARGET exists and is not a symlink. Skipping."
        fi

        if [ ! -e "$CODEX_AGENTS_TARGET" ]; then
            ln -s "$AGENTS_MD_SOURCE" "$CODEX_AGENTS_TARGET"
            echo "Created symlink: $CODEX_AGENTS_TARGET -> $AGENTS_MD_SOURCE"
        fi
    fi
fi

echo "Done!"
