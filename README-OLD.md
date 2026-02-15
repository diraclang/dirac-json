# dirac-json

JSON utility library for DIRAC - provides declarative JSON parsing and access through subroutines.

## Installation

```bash
npm install dirac-json
```

## Usage

```xml
<dirac>
  <!-- Import the library -->
  <import path="dirac-json/lib/index.di"/>
  
  <!-- Parse JSON string -->
  <defvar name="json_text">{"name":"Alice","age":30,"address":{"city":"NYC"}}</defvar>
  <call name="parse" output="person">
    <param><variable name="json_text"/></param>
  </call>
  
  <!-- Extract nested values -->
  <call name="get" output="name">
    <param><variable name="person"/></param>
    <param>name</param>
  </call>
  
  <call name="get" output="city">
    <param><variable name="person"/></param>
    <param>address.city</param>
  </call>
  
  <output>Name: <variable name="name"/></output>
  <output>City: <variable name="city"/></output>
  
  <!-- Convert back to JSON -->
  <call name="stringify" output="json_out">
    <param><variable name="person"/></param>
    <param>true</param><!-- pretty print -->
  </call>
  
  <output><variable name="json_out"/></output>
</dirac>
```

## API

### parse(json_string)
Parses a JSON string into an object.

**Parameters:**
- `json_string`: JSON string to parse

**Returns:** Parsed JavaScript object

### get(object, path)
Extracts a value from an object using dot notation path.

**Parameters:**
- `object`: JavaScript object
- `path`: Dot-separated path (e.g., "address.city")

**Returns:** Value at the specified path, or `undefined` if not found

### stringify(object, pretty)
Converts an object to JSON string.

**Parameters:**
- `object`: JavaScript object to stringify
- `pretty`: "true" or true for pretty-printed output (optional)

**Returns:** JSON string

## Example: Processing JSON from stdin

```xml
<dirac>
  <import path="dirac-json/lib/index.di"/>
  
  <!-- Read JSON from stdin -->
  <input name="message" mode="all"/>
  
  <!-- Parse it -->
  <call name="parse" output="msg">
    <param><variable name="message"/></param>
  </call>
  
  <!-- Extract fields -->
  <call name="get" output="image">
    <param><variable name="msg"/></param>
    <param>image</param>
  </call>
  
  <call name="get" output="timestamp">
    <param><variable name="msg"/></param>
    <param>timestamp</param>
  </call>
  
  <!-- Use the values -->
  <output>Image: <variable name="image"/></output>
  <output>Time: <variable name="timestamp"/></output>
</dirac>
```

## License

MIT
