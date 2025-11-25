# Root Instructions

## How to interact
- Always ask the user any necessary follow up questions about their intent before making changes.
- If the user interrupts you and asks a question, IMMEDIATELY ANSWER THE QUESTION. Do not use the question as a jumping-off point for additional changes.
- Any time the user asks you to search the web, delegate to a sub-agent spawned using `Task`, even if it's just a simple search request that will only require a single API call. The sub-agent should use the parallel search 

## How to write code
- Do NOT program defensively; solve the user request in the simplest way possible. Don't include extra parameters that aren't currently necessary. Don't over-functionize or over-nest data structures; inline code where possible.
- Add one-line docstrings to all TypeScript functions (e.g. `/** Description of function */`)
- ALWAYS use existing libraries and utility functions; do NOT rewrite functions for basic language functionality

