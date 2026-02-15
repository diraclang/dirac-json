<!-- Test array iteration without destruction -->
<import src="../lib/index.di" />

<defvar name="packages">["pkg1", "pkg2", "pkg3"]</defvar>

<output>Array length: <array name="packages"><length /></array></output>

<output>First pass - getting by index:</output>
<output>  Item 0: <array name="packages"><get index="0" /></array></output>
<output>  Item 1: <array name="packages"><get index="1" /></array></output>
<output>  Item 2: <array name="packages"><get index="2" /></array></output>

<output>Second pass - array still has all items:</output>
<output>  Item 0: <array name="packages"><get index="0" /></array></output>
<output>  Item 1: <array name="packages"><get index="1" /></array></output>
<output>  Item 2: <array name="packages"><get index="2" /></array></output>

<output>Done - array is unchanged</output>
