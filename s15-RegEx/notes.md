# Section 15. Regular expressions

## 120. Qué son las expresiones regulares

### Expresiones regulares

Las expresiones regulares en Linux son patrones de búsqueda utilizados para encontrar y manipular texto de manera eficiente. Se basan en una sintaxis especializada que permite definir reglas de coincidencia de caracteres y secuencias en un conjunto de texto.

Las expresiones regulares se utilizan en varios comandos y herramientas de línea de comandos en Linux, como grep, sed, awk y otros, para realizar búsquedas, filtrar y transformar texto.

A continuación, se presentan algunos conceptos clave en las expresiones regulares:

1. Caracteres literales: Los caracteres literales son aquellos que coinciden exactamente con su representación. Por ejemplo, la expresión regular "hello" coincidirá solo con la palabra "hello" en el texto.

2. Metacaracteres: Los metacaracteres son caracteres especiales con significado especial en las expresiones regulares. Algunos ejemplos comunes son:

- . (punto): Coincide con cualquier carácter, excepto el salto de línea.
- \* (asterisco): Coincide con cero o más repeticiones del carácter o grupo anterior.
- \+ (más): Coincide con una o más repeticiones del carácter o grupo anterior.
- ? (interrogación): Coincide con cero o una repetición del carácter o grupo anterior.
- [] (corchetes): Define una clase de caracteres y coincide con cualquier carácter dentro de esa clase.
- () (paréntesis): Agrupa un conjunto de caracteres o expresiones para aplicar operaciones o cuantificadores.
- \ (barra invertida): Escapa un carácter especial, permitiendo que se trate como un carácter literal.

3. Cuantificadores: Los cuantificadores especifican la cantidad de repeticiones de un carácter o grupo que se deben encontrar. Algunos ejemplos son:

- {n}: Coincide exactamente con "n" repeticiones del carácter o grupo anterior.
- {n,}: Coincide con al menos "n" repeticiones del carácter o grupo anterior.
- {n,m}: Coincide con al menos "n" y como máximo "m" repeticiones del carácter o grupo anterior.

4. Clases de caracteres: Las clases de caracteres permiten definir conjuntos de caracteres que se pueden utilizar en una expresión regular. Algunos ejemplos comunes son:

- [a-z]: Coincide con cualquier letra minúscula.
- [A-Z]: Coincide con cualquier letra mayúscula.
- [0-9]: Coincide con cualquier dígito.
- [a-zA-Z0-9]: Coincide con cualquier letra o dígito.

5. Anclas: Las anclas son metacaracteres que se utilizan para especificar posiciones específicas en el texto. Algunos ejemplos son:

- ^ (circunflejo): Coincide con el inicio de una línea.
- $ (dólar): Coincide con el final de una línea.
- \b (límite de palabra): Coincide con el límite entre una palabra y un espacio en blanco.

### grep

grep es un comando en Linux que se utiliza para buscar patrones de texto en archivos o en la salida de otros comandos. La sintaxis básica de grep es la siguiente:

```bash
grep [opciones] patrón [archivos]
```

Aquí tienes una explicación de los componentes principales:

- opciones: Son indicadores que modifican el comportamiento de grep. Algunas opciones comunes incluyen:

  - -i: Realiza una búsqueda insensible a mayúsculas y minúsculas.
  - -v: Invierte la coincidencia, muestra las líneas que no contienen el patrón.
  - -r o -R: Realiza una búsqueda recursiva en directorios y archivos.
  - -l: Muestra solo los nombres de los archivos que contienen el patrón.
  - -n: Muestra los números de línea junto con las coincidencias.

Puedes usar varias opciones al mismo tiempo, como grep -i -r.

- patrón: Es la cadena de texto o la expresión regular que deseas buscar. Puede ser una cadena literal o una expresión regular más compleja.

- archivos: Son los archivos en los que deseas buscar. Puedes proporcionar uno o varios nombres de archivos separados por espacios. También puedes utilizar comodines para buscar en conjuntos de archivos, por ejemplo, \*.txt buscará en todos los archivos con extensión .txt en el directorio actual.

Aquí tienes algunos ejemplos de uso de grep:

1. Buscar una palabra en un archivo:

```bash
grep "patrón" archivo.txt
```

Buscar una palabra en varios archivos:

```bash
grep "patrón" archivo1.txt archivo2.txt
```

Buscar una palabra en todos los archivos dentro de un directorio:

```bash
grep -r "patrón" directorio/
```

Buscar una palabra de forma insensible a mayúsculas y minúsculas:

```bash
grep -i "patrón" archivo.txt
```

Buscar una palabra y mostrar solo los nombres de los archivos que contienen el patrón:

```bash
grep -l "patrón" archivo1.txt archivo2.txt
```

Estos son solo ejemplos básicos de cómo utilizar grep. Puedes combinar diferentes opciones y patrones más complejos para realizar búsquedas más específicas. Puedes consultar la página de manual de grep (man grep) para obtener más información sobre las opciones y posibilidades avanzadas de uso.
