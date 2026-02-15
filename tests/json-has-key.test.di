<!-- TEST: json_has_key -->
<!-- EXPECT: Has name: true -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "age": 30}</defvar>
  <defvar name="hasName"><json name="person"><has key="name" /></json></defvar>
  <output>Has name: <variable name="hasName" /></output>
</dirac>
