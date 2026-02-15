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

  <!-- json: JSON object operations with nested operation tags -->
  <subroutine name="json" param-name="string:required:JSON object variable name">
    
    <!-- getKeys: Get array of object keys -->
    <subroutine name="getKeys">
      <eval name="result">
        let objValue;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            objValue = session.variables[i].value;
            break;
          }
        }
        let obj = typeof objValue === 'string' ? JSON.parse(objValue) : objValue;
        if (typeof obj !== 'object' || obj === null || Array.isArray(obj)) {
          throw new Error(`Variable ${name} is not a JSON object`);
        }
        return JSON.stringify(Object.keys(obj));
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!--get: Get value by key or jsonPath -->
    <subroutine name="get" param-key="string:optional:object key" param-jsonPath="string:optional:path with dot notation or array indices">
      <eval name="result">
        let objValue;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            objValue = session.variables[i].value;
            break;
          }
        }
        let obj = typeof objValue === 'string' ? JSON.parse(objValue) : objValue;
        
        // Simple key access
        if (key !== undefined && key !== '') {
          return obj[key];
        }
        
        // Path access (dot notation and array indices)
        if (jsonPath !== undefined && jsonPath !== '') {
          let current = obj;
          
          // Parse jsonPath: support "a.b.c" and "items[0].name"
          const parts = jsonPath.match(/([^.\[\]]+)|\[(\d+)\]/g);
          
          if (!parts) return undefined;
          
          for (const part of parts) {
            if (current === null || current === undefined) {
              return undefined;
            }
            
            // Check if it's an array index [0]
            if (part.startsWith('[') && part.endsWith(']')) {
              const idx = parseInt(part.slice(1, -1));
              current = current[idx];
            } else {
              current = current[part];
            }
          }
          
          // Return primitive values as-is, objects as JSON strings
          if (typeof current === 'object' && current !== null) {
            return JSON.stringify(current);
          }
          return current;
        }
        
        throw new Error('Either key or path parameter required');
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!-- set: Set value by key -->
    <subroutine name="set" param-key="string:required:object key">
      <defvar name="value"><parameters select="*" /></defvar>
      <eval>
        let objValue;
        let varIndex = -1;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            objValue = session.variables[i].value;
            varIndex = i;
            break;
          }
        }
        let obj = typeof objValue === 'string' ? JSON.parse(objValue) : objValue;
        if (typeof obj !== 'object' || obj === null || Array.isArray(obj)) {
          throw new Error(`Variable ${name} is not a JSON object`);
        }
        
        obj[key] = value;
        
        // Update the variable in place
        if (varIndex >= 0) {
          session.variables[varIndex].value = JSON.stringify(obj);
        }
        return value;
      </eval>
    </subroutine>
    
    <!-- has: Check if key exists -->
    <subroutine name="has" param-key="string:required:object key">
      <eval name="result">
        let objValue;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            objValue = session.variables[i].value;
            break;
          }
        }
        let obj = typeof objValue === 'string' ? JSON.parse(objValue) : objValue;
        if (typeof obj !== 'object' || obj === null || Array.isArray(obj)) {
          throw new Error(`Variable ${name} is not a JSON object`);
        }
        return obj.hasOwnProperty(key);
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!-- stringify: Convert to JSON string -->
    <subroutine name="stringify" param-indent="string:optional:indentation (2, 4, etc.)">
      <eval name="result">
        let objValue;
        for (let i = session.variables.length - 1; i >= 0; i--) {
          if (session.variables[i].name === name) {
            objValue = session.variables[i].value;
            break;
          }
        }
        let obj = typeof objValue === 'string' ? JSON.parse(objValue) : objValue;
        
        if (indent !== undefined) {
          const indentNum = parseInt(indent) || 2;
          return JSON.stringify(obj, null, indentNum);
        }
        return JSON.stringify(obj);
      </eval>
      <output><variable name="result" /></output>
    </subroutine>
    
    <!-- Execute nested operations -->
    <parameters select="*" />
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
        arr.push(value);
        // Update the variable in place
        if (varIndex >= 0) {
          session.variables[varIndex].value = JSON.stringify(arr);
        }
        return arr.length;
      </eval>
      <output><variable name="result" /></output>
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
        arr.unshift(value);
        // Update the variable in place
        if (varIndex >= 0) {
          session.variables[varIndex].value = JSON.stringify(arr);
        }
        return arr.length;
      </eval>
      <output><variable name="result" /></output>
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
