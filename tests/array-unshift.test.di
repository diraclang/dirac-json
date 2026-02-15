<!-- TEST: array_unshift -->
<!-- EXPECT: After unshift: 4 -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="fruits">["apple", "banana", "cherry"]</defvar>
  <defvar name="len"><array name="fruits"><unshift>mango</unshift></array></defvar>
  <output>After unshift: <variable name="len" /></output>
</dirac>
