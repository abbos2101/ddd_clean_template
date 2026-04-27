# AI Rule: Flutter Code Compression

## Purpose
Transform Flutter source code into compressed reference files that allow AI to understand architecture, APIs, patterns, and dependencies **without reading original source**.

## When to Apply
User provides source code from one of these layers and asks to compress:
- `infrastructure/services` → `infrastructure_services.compressed.md`
- `application/*`, `var_status` → `application_blocs.compressed.md`
- `domain/models` → `domain_models.compressed.md`
- `common/theme,helpers,extensions,constants` → `common_core.compressed.md`
- `common/widgets` → `common_widgets.compressed.md`

---

## Output Format

### Structure per file:
```markdown
# {Layer Name} — Compressed Reference

## {Section/Class Name}
> One-line purpose description.

\`\`\`
ClassName(Dependencies)
  ├── methodName(params) → ReturnType    # key behavior note
  └── get property → Type               # key: 'cache_key', default: value
\`\`\`

### Behavior:
- Critical logic flow in 1-2 lines
- Edge cases that affect other layers

## Key Conventions
- Bullet list of patterns used across this layer
```

---

## INCLUDE — What to Capture

### Always:
- **Class signature**: name, DI annotation, constructor dependencies
- **Public API**: method name, parameters (with types and defaults), return type
- **State shape**: all fields with types and defaults (for Bloc states)
- **Enum values**: full list of variants
- **JSON mapping**: `@JsonKey(name: 'api_key')` mappings
- **DI metadata**: `@Injectable`, `@Singleton`, `@PostConstruct`, `@preResolve`
- **Dependency graph**: what class depends on what
- **Interceptor/middleware order**: when order matters
- **Config values**: timeouts, cache durations, default values
- **Extension methods**: method name, input type, return type, brief behavior
- **Navigation side effects**: any `router.replaceAll` or `router.push` calls
- **Error handling pattern**: how errors flow (Either, try-catch, error strings)

### Conditionally (only if critical):
- Internal algorithm summary (e.g., "ray-casting for point-in-polygon")
- Queue/throttle patterns
- Platform-specific branches (kIsWeb, kDebugMode)

---

## EXCLUDE — What to Strip

- Full method bodies / implementation details
- Import statements (mention only non-obvious dependencies)
- Generated file contents (`.freezed.dart`, `.g.dart`, `.gr.dart`)
- Inline comments and doc comments (unless they define a contract)
- Debug logging details
- UI layout code (padding, margins, colors in widgets — keep only in theme section)
- Test code
- Boilerplate (`super.key`, `const`, obvious constructors)

---

## Rules

### 1. Signature over Implementation
```
# GOOD
pickImage({ImageSource}) → Future<String?>   # pick + compress, sequential queue

# BAD
pickImage calls ImagePicker, then checks if file exists, then calls _compress
which uses FlutterImageCompress with quality 60...
```

### 2. Show Dependency Direction
```
# GOOD
AuthBloc(AuthFacade) → never touches datasource directly

# BAD
AuthBloc handles login
```

### 3. Defaults are API
```
# GOOD
cacheDuration: null=no cache, zero=refreshForceCache, >0=forceCache

# BAD
cacheDuration parameter exists
```

### 4. Enum = Full List
```
# GOOD
ActionStatus: UNKNOWN, PENDING, APPROVED, APPROVED_WITHOUT_CHECK, ...

# BAD
ActionStatus has several values including APPROVED
```

### 5. Convention Section Required
Every compressed file MUST end with "Key Conventions" summarizing:
- Naming patterns
- Error handling approach
- State management pattern
- DI registration pattern
- Navigation pattern

### 6. Cross-Reference Minimally
If a class from another layer is used, mention it by name only:
```
# GOOD
Depends on: ContourPolygonModel.polygon.coordinates

# BAD
(copy ContourPolygonModel definition here)
```

### 7. Unprovided Code
If a file exists in the tree but code wasn't provided:
```
## ClassName
> Not in provided code. Used by X / in Y page.
```

---

## Quality Checklist
Before finalizing, verify:
- [ ] Can AI generate a new Bloc/Cubit following this pattern without seeing original?
- [ ] Can AI call any service method with correct params?
- [ ] Can AI create a new model matching existing conventions?
- [ ] Are all enum values listed?
- [ ] Are all JSON key mappings documented?
- [ ] Is DI registration clear (Injectable vs Singleton, PostConstruct)?
- [ ] Are error handling flows traceable?
- [ ] Does "Key Conventions" section exist?
