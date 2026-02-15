<!-- TEST: array_get -->
<!-- EXPECT: Item at index 1: banana -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="fruits">["apple", "banana", "cherry"]</defvar>
  <defvar name="item"><array name="fruits"><get index="1" /></array></defvar>
  <output>Item at index 1: <variable name="item" /></output>
</dirac>
