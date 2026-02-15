<!-- TEST: array_length -->
<!-- EXPECT: Array length: 3 -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="fruits">["apple", "banana", "cherry"]</defvar>
  <defvar name="len"><array name="fruits"><length /></array></defvar>
  <output>Array length: <variable name="len" /></output>
</dirac>
