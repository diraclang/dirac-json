<dirac>
  <import src="../lib/index.di" />
  
  <output>Debug path parsing</output>
  
  <!-- Test the actual structure -->
  <defvar name="packages">{"dirac-json": ["json", "array"]}</defvar>
  <output>Full packages: <variable name="packages" /></output>
  
  <defvar name="val1"><json name="packages"><get key="dirac-json" /></json></defvar>
  <output>Get by key 'dirac-json': <variable name="val1" /></output>
  
  <defvar name="val2"><json name="packages"><get jsonPath="dirac-json" /></json></defvar>
  <output>Get by path 'dirac-json': <variable name="val2" /></output>
  
  <defvar name="val3"><json name="packages"><get jsonPath="dirac-json[0]" /></json></defvar>
  <output>Get by path 'dirac-json[0]': <variable name="val3" /></output>
  
  <!-- Test nested object -->
  <defvar name="nested">{"user": {"name": "Alice"}}</defvar>
  <output>Full nested: <variable name="nested" /></output>
  
  <defvar name="val4"><json name="nested"><get jsonPath="user" /></json></defvar>
  <output>Get path 'user': <variable name="val4" /></output>
  
  <defvar name="val5"><json name="nested"><get jsonPath="user.name" /></json></defvar>
  <output>Get path 'user.name': <variable name="val5" /></output>
</dirac>
