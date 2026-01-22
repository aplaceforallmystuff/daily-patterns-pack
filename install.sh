#!/bin/bash

# Daily Patterns Pack Installer
# Installs /log-to-daily skill and @vault-analyst agent to Claude Code

set -e

CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"
AGENTS_DIR="$CLAUDE_DIR/agents"

echo "Installing Daily Patterns Pack..."

# Create directories if needed
mkdir -p "$SKILLS_DIR"
mkdir -p "$AGENTS_DIR"

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install skill
if [ -d "$SKILLS_DIR/log-to-daily" ]; then
    echo "  Updating existing log-to-daily skill..."
    rm -rf "$SKILLS_DIR/log-to-daily"
fi
cp -r "$SCRIPT_DIR/skills/log-to-daily" "$SKILLS_DIR/"
echo "  Installed /log-to-daily skill"

# Install agent
if [ -f "$AGENTS_DIR/vault-analyst.md" ]; then
    echo "  Updating existing vault-analyst agent..."
    rm "$AGENTS_DIR/vault-analyst.md"
fi
cp "$SCRIPT_DIR/agents/vault-analyst.md" "$AGENTS_DIR/"
echo "  Installed @vault-analyst agent"

echo ""
echo "Installation complete!"
echo ""
echo "Usage:"
echo "  /log-to-daily    - Log session activity to today's daily note"
echo "  @vault-analyst   - Analyze vault patterns and recommend automations"
echo ""
echo "Configure your daily note path in:"
echo "  $SKILLS_DIR/log-to-daily/SKILL.md"
