---
user-invocable: true
model-auto-invocable: false
---

Write a failing test for the behavior: $ARGUMENTS

Steps:
1. Identify where the high-level behavior tests are located
2. Write the test describing the behavior — do not implement the production code yet
3. Run all tests and confirm that the right ones fail (red)
4. Report the failing test output to confirm we're in the red state

Rules:
- Test must fail for the right reason (not a compile error from missing types — stub those minimally if needed)
- No production logic yet
- Describe behavior, not implementation
