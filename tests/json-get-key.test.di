<!-- TEST: json_get_key -->
<!-- EXPECT: Name: Alice -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "age": 30, "city": "NYC"}</defvar>
  <defvar name="name"><json name="person"><get key="name" /></json></defvar>
  <output>Name: <variable name="name" /></output>
</dirac>
