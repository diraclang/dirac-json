<!-- 
  dirac-json library
  Provides declarative JSON parsing and access
-->
<dirac>
  <!-- parse: Parse JSON string into object -->
  <subroutine name="parse">
    <parameters>
      <parameter name="json_string"/>
    </parameters>
    <eval>JSON.parse(json_string)</eval>
  </subroutine>
  
  <!-- get: Extract value from JSON object by path (dot notation) -->
  <subroutine name="get">
    <parameters>
      <parameter name="object"/>
      <parameter name="path"/>
    </parameters>
    <eval>
      const parts = path.split('.');
      let result = object;
      for (const part of parts) {
        if (result === null || result === undefined) {
          return undefined;
        }
        result = result[part];
      }
      return result;
    </eval>
  </subroutine>
  
  <!-- stringify: Convert object to JSON string -->
  <subroutine name="stringify">
    <parameters>
      <parameter name="object"/>
      <parameter name="pretty"/>
    </parameters>
    <eval>
      if (pretty === 'true' || pretty === true) {
        return JSON.stringify(object, null, 2);
      }
      return JSON.stringify(object);
    </eval>
  </subroutine>

  <!-- array: Array operations with nested operation tags -->
  <subroutine name="array" param-name="string:required:array variable name">
    
    <!-- get: Get item at index -->
    <subroutine name="get" param-index="number:required:array index">
      <eval name="result">
        let arrValue;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            arrValue = session.variables[i].value;
            break;
          }
        }
        let arr = typeof arrValue === 'string' ? JSON.parse(arrValue) : arrValue;
        if (!Array.isArray(arr)) {
          throw new Error(`Variable ${name} is not an array`);
        }
        const idx = parseInt(index);
        return arr[idx];
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!-- push: Add item to end of array -->
    <subroutine name="push">
      <defvar name="value"><parameters select="*" /></defvar>
      <eval>
        let arrValue;
        let varIndex = -1;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            arrValue = session.variables[i].value;
            varIndex = i;
            break;
          }
        }
        let arr = typeof arrValue === 'string' ? JSON.parse(arrValue) : arrValue;
        if (!Array.isArray(arr)) {
          throw new Error(`Variable ${name} is not an array`);
        }
        arr.push(value);
        // Update the variable in place
        if (varIndex >= 0) {
          session.variables[varIndex].value = JSON.stringify(arr);
        }
        return arr.length;
      </eval>
    </subroutine>
    
    <!-- pop: Remove and return last item from array -->
    <subroutine name="pop">
      <eval name="result">
        let arrValue;
        let varIndex = -1;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            arrValue = session.variables[i].value;
            varIndex = i;
            break;
          }
        }
        let arr = typeof arrValue === 'string' ? JSON.parse(arrValue) : arrValue;
        if (!Array.isArray(arr)) {
          throw new Error(`Variable ${name} is not an array`);
        }
        const result = arr.pop();
        // Update the variable in place
        if (varIndex >= 0) {
          session.variables[varIndex].value = JSON.stringify(arr);
        }
        return result;
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!-- shift: Remove and return first item from array -->
    <subroutine name="shift">
      <eval name="result">
        let arrValue;
        let varIndex = -1;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            arrValue = session.variables[i].value;
            varIndex = i;
            break;
          }
        }
        let arr = typeof arrValue === 'string' ? JSON.parse(arrValue) : arrValue;
        if (!Array.isArray(arr)) {
          throw new Error(`Variable ${name} is not an array`);
        }
        const result = arr.shift();
        // Update the variable in place
        if (varIndex >= 0) {
          session.variables[varIndex].value = JSON.stringify(arr);
        }
        return result;
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!-- unshift: Add item to beginning of array -->
    <subroutine name="unshift">
      <defvar name="value"><parameters select="*" /></defvar>
      <eval>
        let arrValue;
        let varIndex = -1;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            arrValue = session.variables[i].value;
            varIndex = i;
            break;
          }
        }
        let arr = typeof arrValue === 'string' ? JSON.parse(arrValue) : arrValue;
        if (!Array.isArray(arr)) {
          throw new Error(`Variable ${name} is not an array`);
        }
        arr.unshift(value);
        // Update the variable in place
        if (varIndex >= 0) {
          session.variables[varIndex].value = JSON.stringify(arr);
        }
        return arr.length;
      </eval>
    </subroutine>
    
    <!-- length: Get array length -->
    <subroutine name="length">
      <eval name="result">
        let arrValue;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            arrValue = session.variables[i].value;
            break;
          }
        }
        let arr = typeof arrValue === 'string' ? JSON.parse(arrValue) : arrValue;
        if (!Array.isArray(arr)) {
          throw new Error(`Variable ${name} is not an array`);
        }
        return arr.length;
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!-- Execute nested operations -->
    <parameters select="*" />
  </subroutine>
</dirac>
