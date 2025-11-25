---
description: Guidelines for generating a plan before making changes
---

# Plan Style Guidelines

- **Lead with intent.** Start every plan with a 1–2 sentence summary explaining the goal and how the pieces fit together.
- **Organize by subsystem.** Use `##` for top-level areas (Backend, API Client, etc.) and `###` for specific files within each area. List concrete actions under each heading.
- **Reference paths explicitly.** Always include the full relative path (e.g., ``ios-app/KindleAudioApp/APIClient.swift``) so engineers know exactly where edits go.
- **Describe code, not prose.** Focus on what functions, structs, and routes need to exist, including signatures and important fields. Skip status updates, effort estimates, or vague statements.
- **Keep responsibilities narrow.** Favor small helpers (like coordinators or schedulers) instead of piling logic into massive files. Mention ownership boundaries to reinforce the intent.
- **End-to-end flow.** Ensure the plan tells a complete story from backend through frontend, highlighting how data moves and which steps depend on previous ones.