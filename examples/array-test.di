<dirac>
  <import src="../lib/index.di" />
  
  <!-- Create an array -->
  <defvar name="myArray">[]</defvar>
  <echo message="Initial array: " />
  <output><variable name="myArray" /></output>
  
  <!-- Push some items -->
  <echo message="Pushing 'hello'..." />
  <array name="myArray"><push>hello</push></array>
  <output><variable name="myArray" /></output>
  
  <echo message="Pushing 'world'..." />
  <array name="myArray"><push>world</push></array>
  <output><variable name="myArray" /></output>
  
  <echo message="Pushing 42..." />
  <array name="myArray"><push>42</push></array>
  <output><variable name="myArray" /></output>
  
  <!-- Get length -->
  <defvar name="len">
    <array name="myArray"><length /></array>
  </defvar>
  <echo message="Array length: " />
  <output><variable name="len" /></output>
  
  <!-- Access by index -->
  <defvar name="item0">
    <array name="myArray"><get index="0" /></array>
  </defvar>
  <echo message="Item at index 0: " />
  <output><variable name="item0" /></output>
  
  <defvar name="item1">
    <array name="myArray"><get index="1" /></array>
  </defvar>
  <echo message="Item at index 1: " />
  <output><variable name="item1" /></output>
  
  <!-- Pop an item -->
  <defvar name="popped">
    <array name="myArray"><pop /></array>
  </defvar>
  <echo message="Popped item: " />
  <output><variable name="popped" /></output>
  <echo message="Array after pop: " />
  <output><variable name="myArray" /></output>
  
  <!-- Shift an item -->
  <defvar name="shifted">
    <array name="myArray"><shift /></array>
  </defvar>
  <echo message="Shifted item: " />
  <output><variable name="shifted" /></output>
  <echo message="Array after shift: " />
  <output><variable name="myArray" /></output>
  
  <!-- Unshift an item -->
  <echo message="Unshifting 'first'..." />
  <array name="myArray"><unshift>first</unshift></array>
  <echo message="Array after unshift: " />
  <output><variable name="myArray" /></output>
</dirac>
