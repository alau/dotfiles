---
user-invocable: true
model-auto-invocable: false
---

Refactor the code changed in the current TDD cycle while keeping all tests green.

Steps:
1. Identify code to refactor (duplication, unclear naming, poor structure, etc.)
2. Make one logical change at a time
3. Run the tests after each change to confirm still green
4. Run `make lint` at the end and fix any issues
5. Report what was changed and final test/lint status

Rules:
- No new behavior — tests must stay green throughout
- Small incremental changes, not big rewrites
- Run tests between each distinct refactor step
