# Section 07. Redirecciones y pipelines

## 40. I/O Redirection

### STDOUT

En Linux, "stdout" es la abreviatura de "standard output", que es uno de los tres flujos de datos estándar utilizados por los programas en la línea de comandos para la entrada/salida de datos. Es el flujo de datos estándar donde un programa emite su salida, que normalmente se muestra en la pantalla del terminal. Por lo tanto, stdout se refiere a la salida de datos que un programa envía a la pantalla del terminal o al siguiente comando en una tubería (pipe) para su procesamiento adicional.

### /dev/stdout

En Linux, /dev/stdout es un archivo especial de dispositivo que representa la salida estándar (standard output o stdout) de un programa en la línea de comandos. Es un enlace simbólico que apunta al dispositivo de terminal actual o a cualquier otro flujo de salida que se haya redirigido.

Cuando un programa en la línea de comandos emite su salida estándar, normalmente se muestra en la pantalla del terminal. Sin embargo, si se redirige la salida a otro lugar, como a un archivo o a otro programa a través de una tubería (pipe), /dev/stdout representa ese destino de salida. Por lo tanto, cualquier salida que se envíe a /dev/stdout se redirigirá al destino de salida actual, ya sea la pantalla del terminal o algún otro archivo o programa. Esto permite redirigir la salida estándar de un programa a diferentes destinos sin tener que cambiar su código fuente.

### /dev/stderr

En Linux, /dev/stderr es un archivo especial de dispositivo que representa la salida de error estándar (standard error o stderr) de un programa en la línea de comandos. Es similar a /dev/stdout, pero en lugar de representar la salida estándar, representa la salida de error estándar, que es el flujo de datos utilizado por los programas para enviar mensajes de error o diagnóstico.

Normalmente, los mensajes de error generados por un programa se muestran en la pantalla del terminal junto con la salida estándar. Sin embargo, se puede redirigir la salida de error a otro lugar, como a un archivo o a otro programa, utilizando la redirección en la línea de comandos. /dev/stderr representa ese destino de salida de error actual. Por lo tanto, cualquier salida de error que se envíe a /dev/stderr se redirigirá al destino de salida de error actual, ya sea la pantalla del terminal o algún otro archivo o programa. Esto permite redirigir la salida de error de un programa a diferentes destinos sin tener que cambiar su código fuente.

### Entradas /dev/stdin

En Linux, /dev/stdin es un archivo especial de dispositivo que representa la entrada estándar (standard input o stdin) de un programa en la línea de comandos. Es utilizado por los programas para leer datos desde la entrada del usuario o desde otro programa que redirija su salida a la entrada estándar.

Cuando un programa espera recibir datos de entrada, normalmente lo hace a través de la entrada estándar. Por lo tanto, /dev/stdin es utilizado como un descriptor de archivo que representa la entrada estándar actual. Los datos que se ingresan desde el teclado o se redirigen desde otro programa a través de la entrada estándar se pueden leer desde /dev/stdin en el programa que lo esté utilizando.

Un ejemplo de uso de /dev/stdin es con el comando cat en Linux, que se utiliza para concatenar archivos. Si se ejecuta cat sin argumentos, esperará a que el usuario ingrese datos desde el teclado, que se leerán a través de /dev/stdin. Por ejemplo:

```bash
cat        # Espera a que el usuario ingrese datos desde el teclado
Hola mundo # Usuario ingresa datos desde el teclado
Hola mundo # Se muestra en la salida estándar la entrada del usuario

```

## 41. Standard Output Redirection (stdout)

### Operador >

El símbolo ">" en Linux se utiliza para redirigir la salida de un comando a un archivo. Básicamente, permite que la salida que normalmente se imprimiría en la pantalla (stdout) sea redirigida a un archivo en su lugar.

El uso básico del símbolo ">" es el siguiente:

```bash
comando > archivo
```

Donde "comando" es el comando cuya salida se desea redirigir, y "archivo" es el nombre del archivo donde se desea guardar la salida.

Por ejemplo, supongamos que tienes un archivo de texto llamado "archivo.txt" y deseas agregarle el contenido del archivo "salida.txt" usando el comando "cat":

```bash
cat salida.txt > archivo.txt
```

Esto redirigirá la salida del comando "cat salida.txt" (que normalmente se imprimiría en la pantalla) al archivo "archivo.txt", sobreescribiendo su contenido con la salida del comando "cat".

Es importante tener en cuenta que el uso del símbolo ">" sobrescribirá el contenido del archivo de destino si este ya existe. Si se desea agregar la salida al final del archivo en lugar de sobrescribirlo, se puede utilizar el símbolo ">>" en su lugar.

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -lah > salida_ls.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat salida_ls.txt
total 8,0K
drwxrwxr-x 2 javier javier 4,0K abr 17 17:06 .
drwxrwxr-x 3 javier javier 4,0K abr 17 17:06 ..
-rw-rw-r-- 1 javier javier    0 abr 17 17:06 salida_ls.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$

```

El comando > se pede utilizar para crear nuevos archivos:

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ >newFile.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -lah
total 12K
drwxrwxr-x 2 javier javier 4,0K abr 17 17:14 .
drwxrwxr-x 3 javier javier 4,0K abr 17 17:06 ..
-rw-rw-r-- 1 javier javier    0 abr 17 17:14 newFile.txt
-rw-rw-r-- 1 javier javier  165 abr 17 17:06 salida_ls.txt

```

### Operador >>

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -lah > salida_ls.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat salida_ls.txt
total 8,0K
drwxrwxr-x 2 javier javier 4,0K abr 17 17:14 .
drwxrwxr-x 3 javier javier 4,0K abr 17 17:06 ..
-rw-rw-r-- 1 javier javier    0 abr 17 17:16 newFile.txt
-rw-rw-r-- 1 javier javier    0 abr 17 17:16 salida_ls.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -lah >> salida_ls.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat salida_ls.txt
total 8,0K
drwxrwxr-x 2 javier javier 4,0K abr 17 17:14 .
drwxrwxr-x 3 javier javier 4,0K abr 17 17:06 ..
-rw-rw-r-- 1 javier javier    0 abr 17 17:16 newFile.txt
-rw-rw-r-- 1 javier javier    0 abr 17 17:16 salida_ls.txt
total 12K
drwxrwxr-x 2 javier javier 4,0K abr 17 17:14 .
drwxrwxr-x 3 javier javier 4,0K abr 17 17:06 ..
-rw-rw-r-- 1 javier javier    0 abr 17 17:16 newFile.txt
-rw-rw-r-- 1 javier javier  222 abr 17 17:16 salida_ls.txt

```

## 42. Standard Error (stderr)

### File Descriptor

En Linux, un file descriptor es un número entero que representa una referencia a un archivo abierto por un programa en ejecución. Los file descriptors son utilizados por el sistema operativo para identificar y acceder a archivos y recursos, como dispositivos de entrada/salida (I/O), sockets, y pipes.

En particular, en Linux, se utilizan tres file descriptors predeterminados para la gestión de la entrada/salida de datos:

stdout (file descriptor 1): Representa la salida estándar, que es la salida normal de un programa. Por defecto, los datos que se envían a stdout se muestran en la pantalla del terminal o se redirigen a un archivo.

stderr (file descriptor 2): Representa la salida de error estándar, que es la salida utilizada para mensajes de error y diagnóstico de un programa. Por defecto, los datos que se envían a stderr se muestran en la pantalla del terminal o se redirigen a un archivo.

Estos file descriptors son utilizados por los programas para escribir y redirigir sus salidas estándar y de error. Por ejemplo, si un programa imprime mensajes de salida en la pantalla, estos mensajes se envían a stdout. Si un programa genera mensajes de error o de diagnóstico, estos mensajes se envían a stderr.

Es importante tener en cuenta que en Linux, los file descriptors son números enteros y se utilizan en combinación con operadores de redirección y otros comandos para gestionar la entrada/salida de datos de un programa. Por ejemplo, se puede redirigir la salida estándar (stdout) o la salida de error estándar (stderr) a un archivo, a otro programa o a un dispositivo específico utilizando los file descriptors y operadores de redirección adecuados en la línea de comandos.

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -l /dev/stdout
lrwxrwxrwx 1 root root 15 abr 13 18:29 /dev/stdout -> /proc/self/fd/1
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -l /dev/stderr
lrwxrwxrwx 1 root root 15 abr 13 18:29 /dev/stderr -> /proc/self/fd/2

```

File descriptor 1 y 2

### Redirigir el error

usando el código 2 del error

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -l nonExistendDirectory 2> error_lis.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat error_lis.txt
ls: cannot access 'nonExistendDirectory': No such file or directory

```

### Redirigir stdout y stderr al mismo archivo

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -lah > ls-both.txt 2>&1
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat ls-both.txt
total 16K
drwxrwxr-x 2 javier javier 4,0K abr 17 18:13 .
drwxrwxr-x 3 javier javier 4,0K abr 17 17:06 ..
-rw-rw-r-- 1 javier javier   68 abr 17 17:58 error_lis.txt
-rw-rw-r-- 1 javier javier    0 abr 17 18:13 ls-both.txt
-rw-rw-r-- 1 javier javier    0 abr 17 17:16 newFile.txt
-rw-rw-r-- 1 javier javier  443 abr 17 17:17 salida_ls.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ ls -lah nonExist > ls-both.txt 2>&1
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat ls-both.txt
ls: cannot access 'nonExist': No such file or directory
s9
```

### Versión mas moderna para ambos

```bash
 ls -lah &> ls-both.txt
```

y concatenando

```bash
 ls -lah &>> ls-both.txt
```

## 43. /dev/null

En Linux, /dev/null es un dispositivo de archivo especial que se utiliza para descartar o eliminar datos de salida (stdout) o datos de error (stderr) de un programa. Es básicamente un agujero negro donde los datos escritos en él se descartan y no se almacenan en el sistema de archivos.

Cuando se redirige la salida de un programa a /dev/null, los datos de salida del programa se eliminan y no se muestran en la pantalla del terminal ni se guardan en un archivo. Esto es útil cuando se desea suprimir la salida de un programa o cuando no se desea almacenar los datos de salida en el sistema de archivos.

Por ejemplo, el siguiente comando en Linux redirige la salida estándar (stdout) del comando ls a /dev/null, lo que significa que la salida del comando no se mostrará en la pantalla del terminal:

```bash
ls > /dev/null
```

Del mismo modo, se puede redirigir la salida de error estándar (stderr) a /dev/null utilizando el descriptor de archivo 2 para stderr:

```bash
command 2> /dev/null
```

Esto es útil para descartar los mensajes de error de un programa y evitar que se muestren en la pantalla del terminal o se almacenen en un archivo.

### ejemplo

No imprime los errores

```bash
javier@javier-machine:~$ find /var/log -name auth.log
find: ‘/var/log/speech-dispatcher’: Permission denied
/var/log/auth.log
find: ‘/var/log/private’: Permission denied
find: ‘/var/log/gdm3’: Permission denied
javier@javier-machine:~$ find /var/log -name auth.log 2> /dev/null
/var/log/auth.log

```

## 44. STDIN

En Linux, STDIN (Standard Input) es uno de los tres flujos de datos estándar que utilizan los programas para leer datos de entrada. Los otros dos flujos de datos estándar son STDOUT (Standard Output) y STDERR (Standard Error).

STDIN es el flujo de entrada de datos que un programa utiliza para leer información desde el teclado o desde otro programa. Por defecto, un programa espera la entrada del usuario a través de STDIN cuando se le solicita información o datos de entrada.

En la mayoría de los casos, STDIN se lee línea por línea, lo que significa que un programa espera a que el usuario ingrese una línea de texto y luego presione Enter para enviar esa línea como entrada. El programa luego puede procesar esa entrada y realizar acciones en consecuencia.

Es común redirigir STDIN a partir de un archivo en lugar de leer la entrada del teclado. Por ejemplo, se puede usar el siguiente comando para redirigir STDIN desde un archivo llamado input.txt:

```bash
command < input.txt
```

Esto permite que el programa lea datos de entrada desde el archivo en lugar de esperar la entrada del usuario a través del teclado.

En resumen, STDIN es el flujo de entrada de datos que un programa utiliza para leer información desde el teclado o desde otro programa, y se puede redirigir a partir de un archivo para proporcionar datos de entrada predefinidos.

### Ejercicio

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat file{1..3}.txt > fileAll.txt
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat fileAll.txt
file 1
file 2
file 3

```

### Operador <

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat > inputText.txt
This is my text
Oh yes a good text
^C
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat inputText.txt
This is my text
Oh yes a good text
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat < inputText.txt
This is my text
Oh yes a good text
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$
```

## 45. Pipelines

**Los pipelines en Linux son una forma de encadenar varios comandos juntos para que la salida de uno se convierta en la entrada del siguiente**. Se utilizan para procesar datos de manera eficiente y realizar tareas más complejas.

Imagina que tienes una lista de nombres en un archivo llamado nombres.txt y quieres mostrar solo los nombres que contengan la letra "a". Puedes usar pipelines para lograrlo. Aquí hay un ejemplo:

```bash
cat nombres.txt | grep "a"

```

En este ejemplo, el comando cat se utiliza para leer el contenido del archivo nombres.txt y enviarlo como salida al comando grep, que a su vez busca las líneas que contienen la letra "a". La salida de cat se convierte en la entrada de grep a través del pipeline |, y el resultado final será la lista de nombres que contienen la letra "a".

Otro ejemplo podría ser el uso de pipelines para contar la cantidad de palabras en un archivo y luego ordenarlas por frecuencia. Aquí está el comando:

```bash
cat archivo.txt | tr ' ' '\n' | sort | uniq -c | sort -nr
```

En este caso, se utilizan varios comandos juntos con pipelines para lograr la tarea completa. cat se utiliza para leer el contenido del archivo, tr se utiliza para reemplazar espacios por saltos de línea, sort se utiliza para ordenar las palabras, uniq -c se utiliza para contar la frecuencia de cada palabra y sort -nr se utiliza para ordenar las palabras por frecuencia en orden descendente.

Espero que esta explicación te haya ayudado a comprender qué son los pipelines en Linux y cómo se pueden usar con ejemplos simples.

### Haciendo ejemplo anterior

Archivo:

```bash
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Sed auctor aliquam ligula, vel euismod massa posuere a.
Nam gravida semper neque, vitae fringilla mi porttitor id.
Praesent quis pharetra orci, eu pulvinar massa.
Morbi consequat dui nec orci bibendum, eget feugiat felis tincidunt.
Pellentesque eu elit vitae nunc venenatis posuere.
Aenean vulputate dolor sapien, at finibus ligula gravida ac.
Suspendisse pulvinar, nunc nec volutpat fringilla, neque lectus congue ligula, in feugiat neque massa nec sapien.
Pellentesque consequat sollicitudin tincidunt.
Sed vestibulum odio ut dolor placerat, at rhoncus dui fermentum.
```

```bash
cat archivo.txt | tr ' ' '\n' | sort | uniq -c | sort -nr
```

Resultado del comando

```bash
javier@javier-machine:~/code/courses/linux-sh/s07-pipelinesAndRedirect/exercises$ cat pipeline1.txt | tr ' ' '\n' | sort | uniq -c | sort -nr
      3 nec
      3 dolor
      2 vitae
      2 tincidunt.
      2 Sed
      2 Pellentesque
      2 nunc
      2 neque
      2 massa
      2 ligula,

```

## 46. Filtros y búsquedas: sort, uniq, wc

### Sort

```bash
javier@javier-machine:~$ ls /bin /usr/bin | sort -r | cat
zstdmt
zstdmt
zstdless
```

### Uniq

Solo devuelve una vez los duplicados

```bash
javier@javier-machine:~$ ls /bin /usr/bin | sort -r | uniq | cat
zstdmt
zstdless
zstdgrep
zstdcat
```

Mostrar solo los duplicados (d) y cuenta (c)

```bash
ls /bin /usr/bin | sort -r | uniq -dc | cat
      2 zstdmt
      2 zstdless
      2 zstdgrep
      2 zstdcat
      2 zstd
      2 zoom

```

### wc

```bash
 wc --help
Usage: wc [OPTION]... [FILE]...
  or:  wc [OPTION]... --files0-from=F
Print newline, word, and byte counts for each FILE, and a total line if
more than one FILE is specified.  A word is a non-zero-length sequence of
characters delimited by white space.

With no FILE, or when FILE is -, read standard input.

The options below may be used to select which counts are printed, always in
the following order: newline, word, character, byte, maximum line length.
  -c, --bytes            print the byte counts
  -m, --chars            print the character counts
  -l, --lines            print the newline counts
      --files0-from=F    read input from the files specified by
                           NUL-terminated names in file F;
                           If F is - then read names from standard input
  -L, --max-line-length  print the maximum display width
  -w, --words            print the word counts
      --help     display this help and exit
      --version  output version information and exit

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/wc>
or available locally via: info '(coreutils) wc invocation'

```

Ejemplo:

```bash
wc /var/log/auth.log
  268  3348 33329 /var/log/auth.log
```

Los numeros significan lineas, palabras y chars/bytes

## 47. Filtros y búsquedas: grep, head, tail, tee

### GREP

¡Claro! grep es una herramienta poderosa en Linux que se utiliza para buscar y filtrar patrones de texto en archivos. Aquí te muestro algunos ejemplos útiles:

Buscar una palabra específica en un archivo:

```bash
grep "palabra" archivo.txt
```

Esto buscará la palabra "palabra" en el archivo archivo.txt y mostrará todas las líneas que contengan esa palabra.

Buscar una palabra en varios archivos:

```bash
grep "palabra" archivo1.txt archivo2.txt archivo3.txt
```

Esto buscará la palabra "palabra" en los archivos archivo1.txt, archivo2.txt y archivo3.txt y mostrará las líneas que contengan esa palabra en cada archivo.

Buscar una palabra ignorando mayúsculas y minúsculas:

```bash
grep -i "palabra" archivo.txt
```

Esto buscará la palabra "palabra" en el archivo archivo.txt, ignorando las diferencias entre mayúsculas y minúsculas.

Buscar una palabra en todos los archivos de un directorio y sus subdirectorios:

```bash
grep -r "palabra" directorio/
```

Esto buscará la palabra "palabra" en todos los archivos del directorio directorio/ y sus subdirectorios, y mostrará las líneas que contengan esa palabra en cada archivo.

Buscar líneas que NO contengan una palabra:

```bash
grep -v "palabra" archivo.txt
```

Esto mostrará todas las líneas del archivo archivo.txt que NO contengan la palabra "palabra".

Buscar un patrón utilizando expresiones regulares:

```bash
grep "patrón" archivo.txt
```

Esto buscará el patrón especificado utilizando expresiones regulares en el archivo archivo.txt y mostrará las líneas que coincidan con dicho patrón.

Estos son solo algunos ejemplos de cómo puedes utilizar grep en Linux. Esta herramienta es muy versátil y te permite realizar búsquedas y filtrados de texto de manera eficiente en archivos y directorios. ¡Espero que te sea útil!

### Explicacion curso

```bash
javier@javier-machine:~$ grep javier /var/log/auth.log
Apr 16 00:17:01 javier-machine CRON[265505]: pam_unix(cron:session): session opened for user root(uid=0) by (uid=0)
Apr 16 00:17:01 javier-machine CRON[265505]: pam_unix(cron:session): session closed for user root
Apr 16 00:29:22 javier-machine gnome-keyring-daemon[1608]: asked to register item /org/freedesktop/secrets/collection/Default_5fkeyring/2, but it's already registered

```

Concatenación

```bash
ls /usr/bin/ | sort | grep zip
bunzip2
bzip2
bzip2recover
funzip
gpg-zip
gunzip
gzip
preunzip
prezip
prezip-bin
streamzip
unzip
unzipsfx
zip
zipcloak
zipdetails
zipgrep
zipinfo
zipnote
zipsplit

```

### HEAD

```bash
ls /usr/bin/ | sort | grep zip | head -3

bunzip2
bzip2
bzip2recover

```

### TAIL

```bash
ls /usr/bin/ | sort | grep zip | tail -3
zipinfo
zipnote
zipsplit

```
