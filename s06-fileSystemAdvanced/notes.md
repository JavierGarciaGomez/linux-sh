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
