<!-- TEST: json_set_key -->
<!-- EXPECT: ["name","age","city","email"] -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "age": 30, "city": "NYC"}</defvar>
  <json name="person"><set key="email">alice@example.com</set></json>
  <defvar name="keys"><json name="person"><getKeys /></json></defvar>
  <output><variable name="keys" /></output>
</dirac>
