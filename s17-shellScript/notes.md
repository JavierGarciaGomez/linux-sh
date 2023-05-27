# Section 17. Shell script

## 133. Qué es Shell Script

### Concepto

Bash, abreviatura de "Bourne Again SHell", es un intérprete de comandos o una interfaz de línea de comandos (CLI) utilizado en sistemas operativos basados en Unix, como Linux. Bash es una implementación del shell original de Unix, conocido como el shell Bourne.

Bash proporciona una interfaz entre el usuario y el sistema operativo, permitiendo al usuario ejecutar comandos y realizar diversas tareas en el sistema. Es un lenguaje de script que permite la automatización de tareas mediante la ejecución de comandos en secuencia.

En ese sentido, Bash puede considerarse como un lenguaje de programación, aunque es importante destacar que su principal función es facilitar la interacción con el sistema operativo a través de la ejecución de comandos. Bash admite variables, estructuras de control (como bucles y condicionales) y funciones, lo que le permite realizar tareas más complejas que simplemente ejecutar comandos individuales.

Además de ser utilizado como intérprete de comandos en la línea de comandos, Bash también se utiliza como el shell predeterminado en muchos sistemas Linux, lo que significa que es el programa que se ejecuta cuando se inicia una sesión de usuario en la terminal.

En resumen, Bash es un intérprete de comandos utilizado en Linux y otros sistemas Unix. Es un lenguaje de script que permite la ejecución de comandos y la automatización de tareas en el sistema operativo.

### La diferencia entre bash y shell script

La diferencia principal entre un shell script y un bash script radica en el intérprete utilizado para ejecutar el script.

Un shell script es un script o programa escrito en un lenguaje de script genérico de shell, que puede ser interpretado por cualquier shell disponible en el sistema operativo, como Bash, Korn shell (ksh), C shell (csh), entre otros. Los shell scripts son escritos en un lenguaje que sigue la sintaxis y las reglas del shell específico en el que se ejecutarán.

Por otro lado, un bash script es un script escrito específicamente para ser interpretado y ejecutado por el intérprete de comandos Bash. Bash es uno de los shells más populares y ampliamente utilizado en sistemas Linux y Unix. Los bash scripts están escritos en un lenguaje de script que sigue la sintaxis y las características específicas de Bash, y pueden hacer uso de las funcionalidades y extensiones proporcionadas por este intérprete.

En resumen, mientras que un shell script puede ser ejecutado por cualquier shell disponible en el sistema operativo, un bash script es específico para el intérprete de comandos Bash. Bash scripts pueden aprovechar las características y funcionalidades adicionales que Bash ofrece, mientras que shell scripts son más genéricos y compatibles con múltiples shells. Sin embargo, debido a la amplia disponibilidad y popularidad de Bash, bash scripts son comunes en el entorno de Linux y Unix.

## 134. Nuestro primer shell script

```bash
#!/bin/bash
# Esto es un programa que saca por pantalla hola, mundo

echo "Hola, mundo" #Esto se imprimirá en consola.

```

## 135. Comenzando el proyecto

### Instrucciones

Coger el resultado de nmap, lo parsee, analice y lo muestre en html

```bash
# Este programa parse los resultados de nmap y construye un documento html

echo "<html>
   <head>
      <title>Resultados nmap </title>
  </head>
  <body>
      <h1> Resultados  </h1>
      <p> Acá van los resultados  </p>
 </body>
<html>"
```

## 136. Variables

## 137. Constantes

## 138. Here Documents

## 139. Funciones

## 142. Código

```bash
#!/bin/bash

# Este programa parse los resultados de nmap y construye un documento html

TITULO="Resultados nmap"
FECHA_ACTUAL="$(date)"
TIMESTAMP="Informe generado el $FECHA_ACTUAL por el usuario $USERNAME"

nmap_exec () {
    echo "[INFO] Ejecutando nmap en la red $1, por favor espere unos segundos..."
    sudo nmap -sV $1 > $2
    echo "[OK] Fichero $2 generado correctamente"
    return 0
}

generar_html () {
cat <<EOF
<html>
    <head>
        <title>$TITULO</title>
   </head>
  <body>
    <h1>$TITULO</h1>
    <p1>$TIMESTAMP</p1>
  </body>
</html>

EOF
}

#Generamos el reporte raw con nmap
nmap_exec "192.168.239.0/24" "salida_nmap.raw"

# Generamos el reporte con los resultados de nmap en HTML
echo "[INFO] Generando reporte html..."
generar_html > resultados_nmap.html
echo "[OK] Reporte resultados_nmap.html generado correctamente"
```
