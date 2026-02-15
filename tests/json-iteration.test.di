<!-- TEST: json_iteration -->
<!-- EXPECT_CONTAINS: Package: dirac-json -->
<!-- EXPECT_CONTAINS: Package: dirac-http -->
<dirac>
  <import src="../lib/index.di" />
  <defvar name="packages">{"dirac-json": ["json"], "dirac-http": ["http"]}</defvar>
  <defvar name="keys"><json name="packages"><getKeys /></json></defvar>
  <defvar name="count"><array name="keys"><length /></array></defvar>
  <loop count="${count}">
    <defvar name="key"><array name="keys"><get index="${i}" /></array></defvar>
    <output>Package: <variable name="key" /></output>
  </loop>
</dirac>
