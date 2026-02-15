# DIRAC JSON Test Suite

Unit tests for the dirac-json library.

## Running Tests

From the dirac-json directory:
```bash
npm test
```

## Test Coverage

### Array Operations
- ✅ `<array><get>` - Get item at index
- ✅ `<array><push>` - Add item to end
- ✅ `<array><pop>` - Remove and return last item
- ✅ `<array><shift>` - Remove and return first item
- ✅ `<array><unshift>` - Add item to beginning
- ✅ `<array><length>` - Get array length

### JSON Object Operations
- ✅ `<json><getKeys>` - Get object keys as array
- ✅ `<json><get key="">` - Get value by simple key
- ✅ `<json><get jsonPath="">` - Get value by path with dot notation
- ✅ `<json><get jsonPath="">` - Get value by path with array indices
- ✅ `<json><has>` - Check if key exists
- ✅ `<json><set>` - Set value by key
- ✅ `<json><stringify>` - Convert to JSON string

## Test File Format

Each test file follows this pattern:
```xml
<!-- TEST: test_name -->
<!-- EXPECT: expected output -->
<dirac>
  <import src="../lib/index.di" />
  <!-- test code here -->
</dirac>
```
