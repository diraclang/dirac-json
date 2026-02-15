<!-- TEST: json_get_path_dot -->
<!-- EXPECT: Street: Main St -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "address": {"street": "Main St", "city": "NYC"}}</defvar>
  <defvar name="street"><json name="person"><get jsonPath="address.street" /></json></defvar>
  <output>Street: <variable name="street" /></output>
</dirac>
