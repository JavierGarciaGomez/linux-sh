# Section 06. File System Advabced

## 29. Inodos.

### Concepto

En Linux, un inodo (inode en inglés) es una estructura de datos que contiene información sobre un archivo o directorio en un sistema de archivos. Cada archivo o directorio en un sistema de archivos de Linux está representado por un inodo único que contiene metadatos como el propietario del archivo, los permisos de acceso, la fecha de creación y modificación, y los bloques de datos asociados al archivo.

Los inodos son importantes para el sistema de archivos de Linux ya que permiten la gestión de los archivos y directorios en el sistema de archivos. Los inodos son identificados por un número de inodo único que es utilizado por el sistema operativo para acceder al archivo o directorio correspondiente.

### df

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ df --help
Usage: df [OPTION]... [FILE]...
Show information about the file system on which each FILE resides,
or all file systems by default.


```

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ df -i
Filesystem                  Inodes   IUsed    IFree IUse% Mounted on
tmpfs                      4095877    1493  4094384    1% /run
/dev/mapper/vgubuntu-root 14385152 1239639 13145513    9% /
tmpfs                      4095877     703  4095174    1% /dev/shm
tmpfs                      4095877       5  4095872    1% /run/lock
tmpfs                      4095877       1  4095876    1% /run/qemu
/dev/sdb2                   109536     318   109218    1% /boot
/dev/sdb1                        0       0        0     - /boot/efi
tmpfs                       819175     216   818959    1% /run/user/1000

```

### ls -i [FILE]

Para saber el número de inodo

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ ls -i exercises.txt
3170750 exercises.txt
```

### Contenido inodo

STAT

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ stat exercises.txt
  File: exercises.txt
  Size: 11        	Blocks: 8          IO Block: 4096   regular file
Device: fd01h/64769d	Inode: 3170750     Links: 1
Access: (0664/-rw-rw-r--)  Uid: ( 1000/  javier)   Gid: ( 1000/  javier)
Access: 2023-04-10 17:24:15.362397069 +0200
Modify: 2023-04-10 17:24:15.354397033 +0200
Change: 2023-04-10 17:24:15.354397033 +0200
 Birth: 2023-04-10 17:21:39.353769306 +0200

```

## 30. Dentries.

En Linux, los dentries son una estructura de datos que se utiliza en el sistema de archivos para mantener información sobre los directorios. "dentry" es una abreviación de "directory entry" o "entrada de directorio" en inglés.

Los dentries son utilizados por el kernel de Linux para mapear nombres de archivos a sus inodos correspondientes en el sistema de archivos. Cada vez que se accede a un directorio, se crea una nueva entrada dentry en la caché del kernel para ese directorio. La caché de dentries se utiliza para acelerar el acceso a directorios frecuentemente accedidos, evitando la necesidad de realizar lecturas del sistema de archivos cada vez que se accede a un directorio.

Los dentries también contienen información adicional, como la fecha de acceso, la fecha de modificación, los permisos de archivo y otros metadatos asociados con el directorio. Además, los dentries también se utilizan para mantener información sobre los directorios padre y los directorios hijos en la jerarquía de directorios del sistema de archivos.

En resumen, los dentries son una estructura de datos utilizada en el kernel de Linux para mantener información sobre los directorios en el sistema de archivos, lo que ayuda a acelerar el acceso a los directorios y mejorar el rendimiento del sistema de archivos en general.

Inodo de un directorio

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ ls -lid /home/javier/code/courses/linux-sh/
1218419 drwxrwxr-x 6 javier javier 4096 abr 10 17:16 /home/javier/code/courses/linux-sh/
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$
```

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ ls -lia /home/javier/code/courses/linux-sh/
total 248
1218419 drwxrwxr-x 6 javier javier   4096 abr 10 17:16 .
1218417 drwxrwxr-x 3 javier javier   4096 abr  5 22:16 ..
1218420 drwxrwxr-x 8 javier javier   4096 abr  5 22:16 .git
1218449 -rw-rw-r-- 1 javier javier 222203 abr  5 22:16 Indice+curso+Linux.pdf
1218464 -rw-rw-r-- 1 javier javier     11 abr  5 22:16 README.md
1218475 drwxrwxr-x 3 javier javier   4096 abr  6 09:50 s04-shell
1218504 drwxrwxr-x 2 javier javier   4096 abr  6 09:08 s05-fileSystem
3170640 drwxrwxr-x 3 javier javier   4096 abr 10 17:21 s06-fileSystemAdvanced

```

## 31. Enlaces simbólicos (soft links).

### Intro

Los soft links, o enlaces simbólicos, son un tipo de enlace utilizado en Linux para crear referencias a archivos o directorios. Un soft link es un tipo de archivo especial que contiene una ruta relativa o absoluta a otro archivo o directorio en el sistema de archivos.

El soft link actúa como un "atajo" o una referencia al archivo o directorio original, permitiendo acceder a él desde otra ubicación en el sistema de archivos. A diferencia de los hard links, que apuntan directamente a los bloques de datos del archivo original, los soft links apuntan a la ruta del archivo o directorio, lo que los hace más flexibles y versátiles.

Aquí hay un ejemplo de cómo crear un soft link en Linux:

```bash
ln -s /ruta/al/archivo-original /ruta/del/enlace-simbolico
```

Por ejemplo, para crear un soft link llamado "mi_archivo" que apunta a un archivo llamado "archivo_original.txt" en el directorio "/home/usuario/documentos", puedes usar el siguiente comando:

```bash
ln -s /home/usuario/documentos/archivo_original.txt /home/usuario/mi_archivo
```

Esto creará un soft link llamado "mi_archivo" en el directorio "/home/usuario" que apunta al archivo "archivo_original.txt" en el directorio "/home/usuario/documentos". Puedes acceder y usar el archivo a través del soft link "mi_archivo" como si fuera el archivo original.

---

El bin es un ejemplo de un soft link

```bash
drwxr-xr-x  20 root root  4096 abr  5 09:06 .
drwxr-xr-x  20 root root  4096 abr  5 09:06 ..
lrwxrwxrwx   1 root root     7 abr  5 09:03 bin -> usr/bin

```

---

Es muy usado para apuntar a versiones nuevas de una aplicación, por ejemplo python hace reerencia a una versión y luego a otra

---

Los enlaces simbólicos tienen su propio inodo.

Los enlaces simbólicos en sus permisos empiezan con l lrwxrwxrwx

### Creación de enlaces simbólicos (ln -s)

```bash
ln -s originalFile.txt secondFile.txt
```

## 32. Enlaces duros (hard links).

Se crean igual que los simbólicos pero sin el parámetro s.

Un hard link en Linux es un tipo de enlace que permite crear múltiples entradas en el sistema de archivos que apuntan a los mismos bloques de datos en el disco duro. A diferencia de los soft links, los hard links no apuntan a rutas o nombres de archivo, sino que se refieren directamente a los bloques de datos del archivo original. Los hard links pueden existir en distintas ubicaciones del sistema de archivos y reflejan los cambios en el contenido del archivo original. Sin embargo, solo pueden crearse dentro del mismo sistema de archivos y solo para archivos, no para directorios.

Pero es tratado como un archivo normal aunque el inodo es exactamente el mismo

```bash
3170750 -rw-rw-r-- 1 javier javier   11 abr 10 17:24 exercises.txt
3170798 -rw-rw-r-- 2 javier javier   42 abr 10 23:31 hardLink.txt
3170798 -rw-rw-r-- 2 javier javier   42 abr 10 23:31 originalFile.txt
3170832 drwxrwxr-x 2 javier javier 4096 abr 10 23:34 randFolder
3170800 lrwxrwxrwx 1 javier javier   16 abr 10 23:35 secondFile.txt -> originalFile.txt
```

El número que está después de los permisos hace referencia al número de enlaces duro que tieene el fichero

Los enlaces de directorio arriba . y .. son tratados como enlaces duro.

## 33. Wildcards.

### Intro

Los wildcards, o comodines, en Linux son caracteres especiales que se utilizan para representar uno o más caracteres en nombres de archivos o directorios. Los wildcards son ampliamente utilizados en la línea de comandos para realizar operaciones en lotes, como búsqueda, copia, eliminación, etc., en archivos y directorios basados en patrones de nombres.

Algunos ejemplos de wildcards comunes en Linux son:

### Asterisco (\*):

Representa cualquier número de caracteres, incluyendo cero caracteres. Por ejemplo:

```bash
ls *.txt
```

Esto listaría todos los archivos en el directorio actual que tengan extensión .txt.

### Signo de interrogación (?):

Representa un solo carácter. Por ejemplo:

```bash
ls file?
```

Esto listaría todos los archivos en el directorio actual que tengan nombres de archivo con 5 caracteres, donde el último caracter es desconocido.

### Corchetes ([]):

Representan una selección de caracteres posibles. Por ejemplo:

```bash
ls [abc]*
```

Esto listaría todos los archivos en el directorio actual cuyos nombres comienzan con cualquier letra entre a, b o c.

```bash
ls file[123]*
```

Esto los archivos que se llamen file y tengan 1 2 3

```bash
ls file[!123]*
```

Los que no tengan 1 2 3

### Corchetes para clases ([[:class]])

```bash
ls file[[:digit:]]
ls file[[:upper:]]
ls file[[:lower:]]
```

Esto buscaría cualquier dígito

### Llaves ({}):

Representan una lista de opciones. Por ejemplo:

```bash
cp {file1,file2} dir/
```

Esto copiaría file1 y file2 en el directorio dir/.

Los wildcards son herramientas poderosas que permiten realizar operaciones en lotes en Linux de forma rápida y eficiente. Sin embargo, es importante tener precaución al utilizarlos, ya que pueden tener efectos no deseados si no se comprenden correctamente.

## 34. Shell expansions

### echo

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ type echo
echo is a shell builtin

javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ echo this is a text in echo
this is a text in echo

echo fil*
file1.txt file2.txt

```

### exercises

```bash
javier@javier-machine:~$ $((2+2))
4: command not found
javier@javier-machine:~$ echo $((2+2))
4
javier@javier-machine:~$ ls $((2+2))
ls: cannot access '4': No such file or directory
javier@javier-machine:~$ cat /
bin/        etc/        lib64/      mnt/        run/        sys/
boot/       home/       libx32/     opt/        sbin/       tmp/
cdrom/      lib/        lost+found/ proc/       snap/       usr/
dev/        lib32/      media/      root/       srv/        var/
javier@javier-machine:~$ cat code/courses/linux-sh/s06-fileSystemAdvanced/exercises/file$((1+1)).txt
File2
javier@javier-machine:~$ echo code/courses/linux-sh/s06-fileSystemAdvanced/exercises/file{1,2}.txt
code/courses/linux-sh/s06-fileSystemAdvanced/exercises/file1.txt code/courses/linux-sh/s06-fileSystemAdvanced/exercises/file2.txt
javier@javier-machine:~$ cd
.cache/        Downloads/     .local/        Pictures/      Videos/
code/          .dropbox/      .mongodb/      .pki/          .vscode/
.config/       Dropbox/       .mozilla/      Public/        .yarn/
Desktop/       .dropbox-dist/ Music/         snap/
.docker/       .fontconfig/   .ngrok/        .ssh/
Documents/     .gnome/        .npm/          Templates/
.dotnet/       .gnupg/        .nvm/          .thunderbird/
javier@javier-machine:~$ cd code/courses/linux-sh/s06-fileSystemAdvanced/exercises/
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ mkdir {0..5}-Folder
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ ls
0-Folder  3-Folder  exercises.txt  hardLink.txt      secondFile.txt
1-Folder  4-Folder  file1.txt      originalFile.txt
2-Folder  5-Folder  file2.txt      randFolder
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ echo start{AAA{1,2,3},BBB{3,4,5}}filnal
startAAA1filnal startAAA2filnal startAAA3filnal startBBB3filnal startBBB4filnal startBBB5filnal
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ echo start{A{1,2,3},B{3,4,5}}filnal
startA1filnal startA2filnal startA3filnal startB3filnal startB4filnal startB5filnal
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ mkdir {2020..2022}-{01..12}
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced/exercises$ ls
0-Folder  2020-06  2021-01  2021-08  2022-03  2022-10   exercises.txt
1-Folder  2020-07  2021-02  2021-09  2022-04  2022-11   file1.txt
2020-01   2020-08  2021-03  2021-10  2022-05  2022-12   file2.txt
2020-02   2020-09  2021-04  2021-11  2022-06  2-Folder  hardLink.txt
2020-03   2020-10  2021-05  2021-12  2022-07  3-Folder  originalFile.txt
2020-04   2020-11  2021-06  2022-01  2022-08  4-Folder  randFolder
2020-05   2020-12  2021-07  2022-02  2022-09  5-Folder  secondFile.txt
```

## 35. Command substitution

```bash
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced$ which cat
/usr/bin/cat
javier@javier-machine:~/code/courses/linux-sh/s06-fileSystemAdvanced$ ls -la $(which cat)
-rwxr-xr-x 1 root root 35280 feb  7  2022 /usr/bin/cat

```

La sustitución de comandos o "command substitution" en Linux es una funcionalidad que permite utilizar la salida de un comando como entrada para otro comando. Esto se logra mediante la utilización de caracteres especiales que indican que la salida de un comando debe ser sustituida en otro contexto.

El símbolo para la sustitución de comandos en Linux es el símbolo de dólar seguido de paréntesis $(). El contenido dentro de los paréntesis es interpretado como un comando a ejecutar, y la salida de ese comando se sustituye en ese lugar.

Aquí hay un ejemplo de utilidad de la sustitución de comandos en Linux:

```bash
# Ejemplo 1: Obtener la fecha actual y utilizarla en un nombre de archivo
filename="backup_$(date +%Y%m%d).tar.gz"
echo "El nombre del archivo de respaldo es: $filename"
code
```

En este ejemplo, el comando date +%Y%m%d obtiene la fecha actual en formato año-mes-día, y esa salida es sustituida en el nombre del archivo de respaldo utilizando la sustitución de comandos. Esto permite generar un nombre de archivo dinámico basado en la fecha actual.

La sustitución de comandos en Linux es una herramienta poderosa que permite utilizar la salida de un comando como entrada para otro, lo que facilita la automatización de tareas y la manipulación eficiente de datos en el sistema operativo.

## 36. Comillas en la Shell

Las comillas dobles se usan como strings

Las simples eliminan comportamientos especiales

## 37. Escapando carácteres especiales

El carácter de escape en Linux se representa mediante la barra invertida \ y se utiliza para modificar el comportamiento normal de otro carácter o para escapar caracteres especiales en un contexto específico. Un ejemplo común de uso es para escapar caracteres especiales en expresiones regulares. Por ejemplo, si quieres buscar un archivo que contiene un punto en su nombre, puedes usar el carácter de escape para indicar que el punto no debe ser interpretado como un carácter especial en la expresión regular:

```bash
ls archivo\ con\.txt
```

En este ejemplo, la barra invertida se utiliza para escapar tanto el espacio como el punto en el nombre del archivo, para que sean interpretados literalmente y no como caracteres especiales en la expresión regular.

## 38. Caso práctico. El programa vulnerable persistente
