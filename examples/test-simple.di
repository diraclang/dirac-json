<dirac>
  <import src="../lib/index.di" />
  
  <defvar name="myArray">["a", "b", "c"]</defvar>
  
  <output>Before array call</output>
  
  <array name="myArray">
    <output>Inside array - before length call</output>
  </array>
  
  <output>After array call</output>
</dirac>
