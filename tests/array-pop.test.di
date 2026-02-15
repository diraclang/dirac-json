<!-- TEST: array_pop -->
<!-- EXPECT: Popped: cherry -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="fruits">["apple", "banana", "cherry"]</defvar>
  <defvar name="last"><array name="fruits"><pop /></array></defvar>
  <output>Popped: <variable name="last" /></output>
</dirac>
