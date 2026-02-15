# DIRAC JSON - TODO

**Project**: JSON utility library for DIRAC  
**Location**: `/Users/zhiwang/diraclang/dirac-json/`  
**Parent TODO**: See `/Users/zhiwang/diraclang/dirac/TODO.md`

## 🔴 High Priority

### Pending
- [ ] **Object operations with path syntax**: Implement key access and path-based queries for JSON objects
  - **Why**: Enable working with associative arrays/objects using consistent syntax with `<array>` pattern
  - **Use case**: Package registry with object keys like `{'dirac-json': [...], 'dirac-mongodb': [...]}`
  - **Design principle**: Keep consistent with `<array name="var">` pattern - use `name` attribute for variable
  - **Operations needed**:
    - `<json name="obj"><getKeys /></json>` - Returns array of object keys
    - `<json name="obj"><get key="someKey" /></json>` - Get value by simple key
    - `<json name="obj"><get key="${varKey}" /></json>` - Support variable substitution for dynamic keys
    - `<json name="obj"><get path="a.b.c" /></json>` - Get nested value with dot notation
    - `<json name="obj"><get path="items[0].name" /></json>` - Path with array indexing
    - `<json name="obj"><set key="newKey" value="..." /></json>` - Set value by key
    - `<json name="obj"><has key="someKey" /></json>` - Check if key exists (returns boolean)
  - **Syntax consistency**:
    ```xml
    <!-- Arrays (existing pattern) -->
    <array name="myArray"><get index="0" /></array>
    <array name="myArray"><length /></array>
    
    <!-- JSON objects (new pattern - same style) -->
    <json name="myObject"><get key="field" /></json>
    <json name="myObject"><get path="a.b.c" /></json>
    <json name="myObject"><getKeys /></json>
    ```
  - **Example workflow**:
    ```xml
    <defvar name="packages">{'dirac-json': ['json', 'array'], 'dirac-mongodb': ['mongodb']}</defvar>
    
    <!-- Simple key access -->
    <defvar name="value"><json name="packages"><get key="dirac-json" /></json></defvar>
    
    <!-- Path with array index -->
    <defvar name="firstKeyword"><json name="packages"><get path="dirac-json[0]" /></json></defvar>
    
    <!-- Iterate over object keys -->
    <defvar name="keys"><json name="packages"><getKeys /></json></defvar>
    <defvar name="count"><array name="keys"><length /></array></defvar>
    <loop count="${count}">
      <defvar name="key"><array name="keys"><get index="${i}" /></array></defvar>
      <defvar name="value"><json name="packages"><get key="${key}" /></json></defvar>
      <output>Package: <variable name="key" />, Keywords: <variable name="value" /></output>
    </loop>
    ```
  - **Implementation notes**:
    - `<get>` subroutine supports both `key` (simple) and `path` (complex) attributes
    - Path parser handles: dot notation (`.field`), bracket notation (`[0]` or `['key']`)
    - Handle edge cases: missing keys, null values, array out of bounds
  - **File**: `lib/index.di` - Add nested subroutines to `<json>` tag

## 🟡 Medium Priority

### Pending
- [ ] **Array operations**: Support array indexing and iteration
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
