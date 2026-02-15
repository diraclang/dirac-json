<!-- Test JSON object operations -->
<dirac>
  <import src="../lib/index.di" />
  
  <output>=== Testing JSON Object Operations ===</output>
  
  <!-- Test 1: getKeys -->
  <output>
Test 1: getKeys</output>
  <defvar name="packages">{"dirac-json": ["json", "array"], "dirac-mongodb": ["mongodb", "database"], "dirac-http": ["http", "rest"]}</defvar>
  <defvar name="keys"><json name="packages"><getKeys /></json></defvar>
  <output>Keys: <variable name="keys" /></output>
  
  <!-- Test 2: Simple key access -->
  <output>
Test 2: Get by key</output>
  <defvar name="jsonValue"><json name="packages"><get key="dirac-json" /></json></defvar>
  <output>dirac-json value: <variable name="jsonValue" /></output>
  
  <!-- Test 3: Path with array index -->
  <output>
Test 3: Get by path with array index</output>
  <defvar name="firstKeyword"><json name="packages"><get jsonPath="dirac-json[0]" /></json></defvar>
  <output>First keyword: <variable name="firstKeyword" /></output>
  
  <!-- Test 4: Nested path -->
  <output>
Test 4: Nested object path</output>
  <defvar name="nestedObj">{"user": {"name": "Alice", "settings": {"theme": "dark"}}}</defvar>
  <defvar name="theme"><json name="nestedObj"><get jsonPath="user.settings.theme" /></json></defvar>
  <output>Theme: <variable name="theme" /></output>
  
  <!-- Test 5: has key -->
  <output>
Test 5: Check if key exists</output>
  <defvar name="hasJson"><json name="packages"><has key="dirac-json" /></json></defvar>
  <defvar name="hasNope"><json name="packages"><has key="nope" /></json></defvar>
  <output>Has dirac-json: <variable name="hasJson" /></output>
  <output>Has nope: <variable name="hasNope" /></output>
  
  <!-- Test 6: Iterate over keys -->
  <output>
Test 6: Iterate over object keys</output>
  <defvar name="pkgKeys"><json name="packages"><getKeys /></json></defvar>
  <defvar name="keyCount"><array name="pkgKeys"><length /></array></defvar>
  <loop count="${keyCount}">
    <defvar name="key"><array name="pkgKeys"><get index="${i}" /></array></defvar>
    <defvar name="value"><json name="packages"><get key="${key}" /></json></defvar>
    <output>  Package: <variable name="key" />, Keywords: <variable name="value" /></output>
  </loop>
  
  <!-- Test 7: set key -->
  <output>
Test 7: Set new key</output>
  <json name="packages"><set key="dirac-new">["new", "package"]</set></json>
  <defvar name="updatedKeys"><json name="packages"><getKeys /></json></defvar>
  <output>Updated keys: <variable name="updatedKeys" /></output>
  
  <!-- Test 8: stringify -->
  <output>
Test 8: Stringify with indent</output>
  <defvar name="prettified"><json name="packages"><stringify indent="2" /></json></defvar>
  <output>Pretty JSON:
<variable name="prettified" /></output>
  
  <output>
=== All JSON tests complete! ===</output>
</dirac>
