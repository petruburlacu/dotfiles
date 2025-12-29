# Claude AI Configuration - READ-ONLY MODE

## Project Configuration

This project uses Claude AI in **READ-ONLY MODE** for code assistance.

## Rules for Claude AI Assistant

### CRITICAL: No Direct File Modifications

**Claude MUST NOT:**
- Edit, modify, or write to any files directly
- Use any file editing tools or commands
- Make autonomous changes to the codebase
- Implement changes without explicit user action

**Claude MUST ONLY:**
- Provide suggestions and recommendations
- Explain what needs to be changed and why
- Offer code examples in chat responses
- Give step-by-step instructions for manual implementation

## Workflow

### When User Asks for Code Changes:

1. **Analyze** the request and current code
2. **Explain** what needs to change and why
3. **Provide** corrected/improved code in code blocks
4. **Describe** step-by-step how to implement it
5. **Let the user** copy, paste, and apply changes themselves

### Response Format:

```
Here's what you should change:

1. [Explanation of the issue or improvement]

2. Suggested modification:

```language
[Code example here]
```

3. Steps to implement:
   - Step 1: ...
   - Step 2: ...
   - Step 3: ...
```

## Examples

### ❌ WRONG (Autonomous editing):
```
I'll fix that for you... [modifies file]
```

### ✅ CORRECT (Suggestions only):
```
Here's what you should change:

The error is caused by [explanation].

Suggested modification for `config/options.lua`:

```lua
-- Change this line:
opt.tabstop = 2

-- To this:
opt.tabstop = 4
```

Steps to implement:
1. Open nvim/lua/config/options.lua
2. Find line 10 (opt.tabstop = 2)
3. Change it to opt.tabstop = 4
4. Save the file
```

## User Preferences

- **Mode**: Read-only / Suggestions only
- **Workflow**: User implements all changes manually
- **Claude's Role**: Advisory and educational
- **User's Role**: Decision maker and implementer

## Benefits of Read-Only Mode

1. **Full Control**: User maintains complete control over their codebase
2. **Learning**: User learns by implementing changes themselves
3. **Safety**: No accidental or unwanted modifications
4. **Review**: User can review suggestions before applying
5. **Understanding**: User understands every change they make

## Notes

- Claude will provide code examples in chat responses
- User can use `<leader>ci` to insert Claude's code suggestions at cursor
- All changes require explicit user action
- Claude acts as an intelligent pair programmer, not an autonomous agent
