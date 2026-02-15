<dirac>
  <import src="../lib/index.di" />
  
  <!-- Create an array -->
  <defvar name="myArray">["hello", "world"]</defvar>
  
  <output>Initial array: </output>
  <output><variable name="myArray" /></output>
  <output>

</output>
  
  <!-- Test length -->
  <output>Length: </output>
  <array name="myArray"><length /></array>
  <output>

</output>
  
  <!-- Test get -->
  <output>Item at index 0: </output>
  <array name="myArray"><get index="0" /></array>
  <output>

</output>
  
  <output>Item at index 1: </output>
  <array name="myArray"><get index="1" /></array>
  <output>

</output>
  
  <!-- Test push -->
  <output>Pushing 'test'...</output>
  <output>

</output>
  <array name="myArray"><push>test</push></array>
  <output>Array after push: </output>
  <output><variable name="myArray" /></output>
  <output>

</output>
  
  <!-- Test pop -->
  <output>Popped: </output>
  <array name="myArray"><pop /></array>
  <output>

</output>
  <output>Array after pop: </output>
  <output><variable name="myArray" /></output>
  <output>

</output>
  
  <!-- Test shift -->
  <output>Shifted: </output>
  <array name="myArray"><shift /></array>
  <output>

</output>
  <output>Array after shift: </output>
  <output><variable name="myArray" /></output>
  <output>

</output>
  
  <!-- Test unshift -->
  <output>Unshifting 'first'...</output>
  <output>

</output>
  <array name="myArray"><unshift>first</unshift></array>
  <output>Array after unshift: </output>
  <output><variable name="myArray" /></output>
</dirac>
