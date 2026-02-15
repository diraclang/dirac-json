<!-- TEST: json_get_path_array -->
<!-- EXPECT: First hobby: reading -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="person">{"name": "Alice", "hobbies": ["reading", "hiking"]}</defvar>
  <defvar name="hobby"><json name="person"><get jsonPath="hobbies[0]" /></json></defvar>
  <output>First hobby: <variable name="hobby" /></output>
</dirac>
