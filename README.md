# dirac-json

JSON and array operations for Dirac language.

## Installation

```bash
npm install dirac-json
```

## Usage

```xml
<import src="dirac-json" />
```

## JSON Operations

### Parse JSON String

```xml
<defvar name="obj">
  <parse json_string='{"name":"John","age":30}' />
</defvar>
```

### Get Nested Value

```xml
<defvar name="userName">
  <get object="$obj" path="name" />
</defvar>
```

### Stringify Object

```xml
<defvar name="jsonStr">
  <stringify object="$obj" pretty="true" />
</defvar>
```

## Array Operations

The `<array>` tag provides array manipulation with nested operation tags.

### Create an Array

```xml
<defvar name="myArray">["hello", "world"]</defvar>
```

### Get Array Length

```xml
<array name="myArray"><length /></array>
<!-- Output: 2 -->
```

### Access by Index

```xml
<array name="myArray"><get index="0" /></array>
<!-- Output: hello -->

<array name="myArray"><get index="1" /></array>
<!-- Output: world -->
```

### Push (Add to End)

```xml
<array name="myArray"><push>test</push></array>
<!-- myArray is now ["hello", "world", "test"] -->
```

### Pop (Remove from End)

```xml
<array name="myArray"><pop /></array>
<!-- Returns: test -->
<!-- myArray is now ["hello", "world"] -->
```

### Shift (Remove from Beginning)

```xml
<array name="myArray"><shift /></array>
<!-- Returns: hello -->
<!-- myArray is now ["world"] -->
```

### Unshift (Add to Beginning)

```xml
<array name="myArray"><unshift>first</unshift></array>
<!-- myArray is now ["first", "world"] -->
```

## Complete Example

```xml
<dirac>
  <import src="dirac-json" />
  
  <!-- Create and manipulate an array -->
  <defvar name="items">["apple", "banana"]</defvar>
  
  <output>Initial: </output>
  <output><variable name="items" /></output>
  
  <!-- Add items -->
  <array name="items"><push>cherry</push></array>
  <array name="items"><unshift>avocado</unshift></array>
  
  <output>After adding: </output>
  <output><variable name="items" /></output>
  <!-- Output: ["avocado","apple","banana","cherry"] -->
  
  <!-- Get length -->
  <output>Length: </output>
  <array name="items"><length /></array>
  <!-- Output: 4 -->
  
  <!-- Remove items -->
  <output>Popped: </output>
  <array name="items"><pop /></array>
  <!-- Output: cherry -->
  
  <output>Shifted: </output>
  <array name="items"><shift /></array>
  <!-- Output: avocado -->
  
  <output>Final: </output>
  <output><variable name="items" /></output>
  <!-- Output: ["apple","banana"] -->
</dirac>
```

## API Reference

### JSON Operations

- **`<parse json_string="..." />`** - Parse JSON string into object
- **`<get object="..." path="..." />`** - Extract value using dot notation (e.g., "user.address.city")
- **`<stringify object="..." pretty="true|false" />`** - Convert object to JSON string

### Array Operations

All array operations use the pattern: `<array name="variableName"><operation /></array>`

- **`<length />`** - Get array length (returns number)
- **`<get index="n" />`** - Get item at index n (returns item)
- **`<push>value</push>`** - Add item to end (mutates array)
- **`<pop />`** - Remove and return last item (mutates array)
- **`<shift />`** - Remove and return first item (mutates array)
- **`<unshift>value</unshift>`** - Add item to beginning (mutates array)

**Important Notes:**
- Arrays are stored as JSON strings in DIRAC variables
- Array operations automatically parse/serialize during execution
- Mutating operations (push, pop, shift, unshift) modify the variable in place
- Non-mutating operations (length, get) only read the array

## License

MIT
