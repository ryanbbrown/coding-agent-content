# Coding Agent Content

A single repo for all your global coding agent configurations. Add your files here and run the script to symlink them to the proper locations. Currently supports Claude Code and Codex.

## What Gets Linked

- **Slash commands** (`slash-commands/`) → `~/.claude/commands` and `~/.codex/prompts`
- **Instructions** (`CLAUDE.md` / `AGENTS.md`) → `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`
- **Skills** (`skills/`) → `~/.claude/skills`

Note that the `anthropic-skills` repo is included as a submodule. This allows selectively linking only specific skills (configured in `ANTHROPIC_SKILLS_TO_LINK` in the script) rather than installing all of them via the plugin; I only use skill-creator.

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


