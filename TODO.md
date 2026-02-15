# DIRAC JSON - TODO

**Project**: JSON utility library for DIRAC  
**Location**: `/Users/zhiwang/diraclang/dirac-json/`  
**Parent TODO**: See `/Users/zhiwang/diraclang/dirac/TODO.md`

## 🔴 High Priority

### Pending
- [ ] **npm publishing**: Publish as standalone package
  - Currently local project
  - Version 0.1.0 target
  - All tests passing (17/17)

## 🟡 Medium Priority

### Pending
- [ ] **Array operations enhancement**: Support more array methods within JSON objects
  - Syntax: `path="items[0].name"` for array access
  - Consider: array length, map, filter operations

- [ ] **JSON validation**: Check if string is valid JSON before parsing
  - Return error message on invalid JSON
  - Optionally validate against schema

- [ ] **Testing**: Create test suite for all operations
  - Test parse, stringify, path queries
  - Test edge cases and error handling

## 🟢 Low Priority / Future

### Pending
- [ ] **JSONPath support**: Full JSONPath query language
  - Beyond simple dot notation
  - Support wildcards, filters, recursive descent

- [ ] **Transform operations**: Merge, filter, map
  - Combine multiple JSON objects
  - Filter by conditions
  - Transform structure

- [ ] **npm publishing**: Publish as standalone package
  - Currently local project
  - Version 0.1.0 target

## ✅ Completed

- [x] **Testing suite** (v0.1.0)
  - Created 17 comprehensive unit tests
  - Coverage: All array operations (get, push, pop, shift, unshift, length)
  - Coverage: All JSON object operations (getKeys, get key/path, has, set, stringify)
  - Test patterns: Simple operations, path traversal, iteration, edge cases
  - Test framework: Using dirac test-runner with TEST/EXPECT comments
  - All 17 tests passing ✓
  - Test command: `npm test`

- [x] **Object operations with path syntax** (v0.1.0)
  - Implemented `<json name="var">` pattern matching `<array>` syntax
  - Operations: `<getKeys />`, `<get key="" jsonPath="" />`, `<set key="">`, `<has key="" />`, `<stringify indent="" />`
  - Path parser supports dot notation (`a.b.c`) and array indices (`items[0].name`)
  - Fixed namespace conflict: renamed `param-path` to `param-jsonPath` to avoid Node.js `path` module collision
  - Tests: All 8 test cases passing in `tests/json-object.test.di`
  - Key features:
    - Simple key access: `<get key="field" />`
    - Path access: `<get jsonPath="a.b.c" />` or `<get jsonPath="items[0].name" />`
    - Variable substitution: `<get key="${varKey}" />`
    - Object iteration: `<getKeys />` returns array, iterate with `<loop>`
    - Existence check: `<has key="field" />` returns boolean
    - Pretty printing: `<stringify indent="2" />`

- [x] **Basic library structure**
  - Created lib/index.di
  - Basic README with examples
  - package.json setup

---

## Notes
- **Last updated**: 2026-02-14
- **Current status**: Initial implementation
- **Priority**: Low overall, Mid desirability
- **Related**: Will integrate with dirac-lang stdlib system
