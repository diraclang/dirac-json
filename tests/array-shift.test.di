<!-- TEST: array_shift -->
<!-- EXPECT: Shifted: apple -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="fruits">["apple", "banana", "cherry"]</defvar>
  <defvar name="first"><array name="fruits"><shift /></array></defvar>
  <output>Shifted: <variable name="first" /></output>
</dirac>
