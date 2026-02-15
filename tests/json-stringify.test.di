<!-- TEST: json_stringify -->
<!-- EXPECT_CONTAINS: "name": "Alice" -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "age": 30}</defvar>
  <defvar name="str"><json name="person"><stringify indent="2" /></json></defvar>
  <output><variable name="str" /></output>
</dirac>
