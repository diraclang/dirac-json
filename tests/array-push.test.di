<!-- TEST: array_push -->
<!-- EXPECT: After push: 4 -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="fruits">["apple", "banana", "cherry"]</defvar>
  <defvar name="len"><array name="fruits"><push>date</push></array></defvar>
  <output>After push: <variable name="len" /></output>
</dirac>
