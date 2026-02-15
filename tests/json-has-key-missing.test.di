<!-- TEST: json_has_key_missing -->
<!-- EXPECT: Has email: false -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "age": 30}</defvar>
  <defvar name="hasEmail"><json name="person"><has key="email" /></json></defvar>
  <output>Has email: <variable name="hasEmail" /></output>
</dirac>
