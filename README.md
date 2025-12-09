# Global Agent Context

A single repo for all global coding agent configurations. Add/modify files here and run the script to symlink them to the proper locations. Currently supports Claude Code and Codex.

## What Gets Linked

- **Slash commands** (`slash-commands/`) → `~/.claude/commands` and `~/.codex/prompts`
- **Instructions** (`CLAUDE.md` / `AGENTS.md`) → `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`
- **Skills** (`skills/`) → `~/.claude/skills`

The `skill-creator` skill was cloned from [anthropics/skills](https://github.com/anthropics/skills.git) and modified for local use (removed packaging-related scripts + documentation). The `.upstream` file in the skill directory tracks the original source.

## Setup

1. Clone this repo
2. Edit `create-links.sh` to enable/disable linking for Claude or Codex
3. Run `./create-links.sh`

### Manual Setup Steps
[parallel.ai](https://parallel.ai) is my current search MCP of choice, and I'm experimenting with [superpowers](https://github.com/obra/superpowers).

Add the Parallel Search MCP server:
```bash
claude mcp add --transport http --scope user "Parallel-search-mcp" https://search-mcp.parallel.ai/mcp
```

Install superpowers plugin (run these in Claude Code):
```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```


