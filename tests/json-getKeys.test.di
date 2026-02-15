<!-- TEST: json_getKeys -->
<!-- EXPECT: Keys: ["name","age","city"] -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "age": 30, "city": "NYC"}</defvar>
  <defvar name="keys"><json name="person"><getKeys /></json></defvar>
  <output>Keys: <variable name="keys" /></output>
</dirac>
