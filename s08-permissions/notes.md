# Section 08. Users and permissions

## 50. Permisos y usuarios: passwd, shadow y group

### Comando id

```bash
javier@javier-machine:~$ id --help
Usage: id [OPTION]... [USER]...
Print user and group information for each specified USER,
or (when USER omitted) for the current user.

  -a             ignore, for compatibility with other versions
  -Z, --context  print only the security context of the process
  -g, --group    print only the effective group ID
  -G, --groups   print all group IDs
  -n, --name     print a name instead of a number, for -ugG
  -r, --real     print the real ID instead of the effective ID, with -ugG
  -u, --user     print only the effective user ID
  -z, --zero     delimit entries with NUL characters, not whitespace;
                   not permitted in default format
      --help     display this help and exit
      --version  output version information and exit

Without any OPTION, print some useful set of identified information.

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/id>
or available locally via: info '(coreutils) id invocation'


javier@javier-machine:~$ id
uid=1000(javier) gid=1000(javier) groups=1000(javier),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),122(lpadmin),135(lxd),136(sambashare),999(docker)

```

The id command in Linux is used to display the user and group IDs of the current user or a specified username. It provides information about the user's primary group and any supplementary groups they belong to.

The output of the id command includes the following information:

- uid (user ID): This is the numeric user ID of the user.
- gid (group ID): This is the numeric group ID of the user's primary group.
- groups: This lists the numeric IDs of any supplementary groups the user belongs to.

The id command can be useful for checking the permissions of a particular user and for troubleshooting permission issues.

Here's an example of how to use the id command:

```scss
$ id
uid=1000(username) gid=1000(username) groups=1000(username),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lpadmin),126(sambashare)
This output shows that the current user has a UID of 1000, a GID of 1000, and belongs to several groups including adm, sudo, and lpadmin.
```

### Directorios sobre usuarios y permisos

En Linux, la información sobre usuarios y permisos se almacena en varios archivos ubicados en el directorio /etc. Los archivos más importantes relacionados con usuarios y permisos son:

- /etc/passwd: Contiene información sobre los usuarios del sistema, como el nombre de usuario, UID, GID, directorio de inicio, shell predeterminada, etc.

- /etc/group: Contiene información sobre los grupos del sistema, como el nombre de grupo, GID y los miembros del grupo.

- /etc/shadow: Contiene las contraseñas encriptadas de los usuarios del sistema. Solo es accesible por el superusuario.

- /etc/sudoers: Contiene la configuración de sudo, que permite a los usuarios autorizados ejecutar comandos con privilegios de superusuario.
  Estos archivos se utilizan para gestionar la seguridad y los permisos de los usuarios en el sistema Linux.

Buscar un usuario concreto en etc/passwd

```bash
grep javi cat /etc/passwd
grep: cat: No such file or directory
/etc/passwd:javier:x:1000:1000:Javier,,,:/home/javier:/bin/bash

```

### shadow

```bash
sudo cat /etc/shadow
root:!:19452:0:99999:7:::
daemon:*:19411:0:99999:7:::
bin:*:19411:0:99999:7:::
sys:*:19411:0:99999:7:::
sync:*:19411:0:99999:7:::
games:*:19411:0:99999:7:::
man:*:19411:0:99999:7:::
lp:*:19411:0:99999:7:::
mail:*:19411:0:99999:7:::
news:*:19411:0:99999:7:::
uucp:*:19411:0:99999:7:::
proxy:*:19411:0:99999:7:::
www-data:*:19411:0:99999:7:::
backup:*:19411:0:99999:7:::
list:*:19411:0:99999:7:::
irc:*:19411:0:99999:7:::
gnats:*:19411:0:99999:7:::
nobody:*:19411:0:99999:7:::
systemd-network:*:19411:0:99999:7:::

```

## 51. Lectura, escritura y ejecuciń rwx

### Intro

En Linux, rwx es una abreviatura para referirse a los permisos de lectura (r), escritura (w) y ejecución (x) que se pueden asignar a archivos y directorios.

Cada archivo y directorio en Linux tiene permisos asociados que indican quién puede leer, escribir y ejecutarlos. Los permisos se dividen en tres categorías: usuario, grupo y otros.

- r (read): Permite leer el contenido del archivo o directorio. Por ejemplo, si tienes un archivo con permisos "r--", significa que el usuario propietario puede leer el archivo, pero no escribir ni ejecutarlo.

- w (write): Permite escribir en el archivo o directorio. Por ejemplo, si tienes un archivo con permisos "rw-", significa que el usuario propietario puede leer y escribir en el archivo, pero no ejecutarlo.

- x (execute): Permite ejecutar el archivo o acceder al contenido del directorio. Por ejemplo, si tienes un archivo con permisos "-wx", significa que el usuario propietario y los usuarios del mismo grupo pueden escribir y ejecutar el archivo, pero no leerlo.

Los permisos se representan en Linux con una serie de caracteres en el siguiente orden:

rwxrwxrwx

Los primeros tres caracteres corresponden a los permisos del usuario propietario, los siguientes tres al grupo y los últimos tres a otros usuarios.

Por ejemplo, si un archivo tiene permisos "rw-r--r--", significa que el usuario propietario puede leer y escribir en el archivo, los usuarios del mismo grupo pueden leer el archivo y los otros usuarios no tienen permisos sobre él.

Puedes modificar los permisos utilizando el comando chmod. Por ejemplo, si quieres dar permiso de lectura, escritura y ejecución a un archivo para el usuario propietario, puedes usar el siguiente comando:

chmod u+rwx archivo

Esto agrega permisos de lectura, escritura y ejecución para el usuario propietario.

### Explicación de permisos mediante ls -lh

```bash
javier@javier-machine:~$ ls -lh
total 90M
drwxrwxr-x  6 javier javier 4,0K abr 17 22:15 code
-rw-rw-r--  1 javier javier  141 abr  5 10:39 cv_debug.log
drwxr-xr-x  2 javier javier 4,0K abr  5 09:15 Desktop
drwxr-xr-x  3 javier javier 4,0K abr 14 17:36 Documents
drwxr-xr-x  4 javier javier 4,0K abr 18 10:21 Downloads
drwx------ 15 javier javier 4,0K abr 18 11:47 Dropbox
-rw-r--r--  1 root   root    90M mar 28 23:53 google-chrome-stable_current_amd64.deb
```

Permisos / userOwner / ownerGroup

### drwxrwxr-x

- 1: d-directorio, l-enlace simbólico, - fichero especial
- rwx: Permisos del dueño
- rwx: Permisos del grupo
- rwx: Permisos de otros usuarios

## 53. Root user

### Intro

El usuario root es el usuario administrador predeterminado en el sistema operativo Linux y otros sistemas similares a Unix. Este usuario tiene privilegios completos y sin restricciones en el sistema y puede realizar cualquier tarea, como instalar programas, crear y modificar usuarios y grupos, cambiar la configuración del sistema, y acceder a cualquier archivo o directorio.

La cuenta de usuario root es muy poderosa y debe usarse con precaución. Es recomendable utilizarla solo cuando sea necesario, y en su lugar, utilizar una cuenta de usuario con privilegios limitados para tareas diarias.

Para acceder a la cuenta root en Linux, se puede usar el comando su (switch user) en la terminal y luego ingresar la contraseña de root cuando se solicite. También se puede acceder directamente a la cuenta root iniciando sesión en el sistema operativo como root.

Es importante tener en cuenta que el acceso de usuario root puede ser peligroso si se utiliza de manera inapropiada. Por ejemplo, realizar cambios en los archivos del sistema sin comprender completamente el impacto podría generar problemas y afectar el funcionamiento del sistema. Por lo tanto, es recomendable siempre tener precaución y tomar las medidas de seguridad necesarias al utilizar la cuenta root.

```bash
cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
```

## 54. Modificación de permisos (chmod)

### Base octal explicación

En los permisos de archivo en sistemas operativos tipo Unix, la base octal se utiliza para representar los permisos de acceso a un archivo o directorio mediante la notación numérica. La base octal se utiliza porque cada bit de permiso se puede representar con un número en la base octal.

Los permisos de archivo en Unix se dividen en tres categorías: usuario propietario, grupo y otros. Cada categoría tiene tres permisos posibles: lectura (r), escritura (w) y ejecución (x). Cada uno de estos permisos se representa mediante un número en la base octal:

Lectura (r) = 4
Escritura (w) = 2
Ejecución (x) = 1
Así, cada combinación de permisos se representa con un número en la base octal, que se obtiene sumando los valores correspondientes a cada permiso. Por ejemplo, los permisos de lectura y escritura (r+w) se representan con el número 6 (4+2), los permisos de lectura y ejecución (r+x) se representan con el número 5 (4+1), y los permisos de lectura, escritura y ejecución (r+w+x) se representan con el número 7 (4+2+1).

Por lo tanto, si queremos establecer los permisos de un archivo en Unix utilizando el comando chmod, podemos utilizar la notación numérica en base octal para especificar los permisos de cada categoría. Por ejemplo, si queremos dar permiso de lectura y escritura al usuario propietario, y permiso de lectura a los demás usuarios, podemos utilizar el siguiente comando:

```bash
chmod 644 archivo.txt
```

En este caso, el primer dígito (6) indica los permisos del usuario propietario (lectura y escritura), el segundo dígito (4) indica los permisos del grupo (solo lectura) y el tercer dígito (4) indica los permisos de otros usuarios (solo lectura).

### Ejercicio

```bash
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ echo "i am a file" > file.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls lah
ls: cannot access 'lah': No such file or directory
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls -lh
total 4,0K
-rw-rw-r-- 1 javier javier 12 abr 18 22:26 file.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ chmod 700 file.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls -lh
total 4,0K
-rwx------ 1 javier javier 12 abr 18 22:26 file.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$

```

- r-x r-- r--

## 55. Modificación de permisos simbólica

### Explicación

La modificación de permisos simbólica es una forma de cambiar los permisos de un archivo o directorio utilizando letras y signos en lugar de números. La modificación de permisos simbólica se realiza utilizando el comando "chmod" en la terminal de Linux.

Los permisos se dividen en tres grupos: propietario, grupo y otros, y se representan por las letras "u" (propietario), "g" (grupo) y "o" (otros), respectivamente. Los permisos también se pueden representar por la letra "a", que significa "todos" (u, g y o).

Hay tres tipos de permisos: lectura (r), escritura (w) y ejecución (x). Los permisos también se pueden representar por números: r=4, w=2, x=1. Para obtener la suma de permisos, se suman los valores correspondientes de cada permiso.

Algunos ejemplos de modificación de permisos simbólica son:

Cambiar el permiso de escritura del propietario de un archivo:

chmod u+w file.txt

En este ejemplo, "u" representa al propietario del archivo y "+w" significa agregar el permiso de escritura. Por lo tanto, el propietario del archivo ahora tendrá permisos de lectura y escritura.

Cambiar el permiso de ejecución de todos los usuarios para un archivo:

chmod a+x file.txt

En este ejemplo, "a" representa a todos los usuarios y "+x" significa agregar el permiso de ejecución. Por lo tanto, todos los usuarios ahora tendrán permisos de lectura, escritura y ejecución.

Quitar el permiso de lectura del grupo de un archivo:

chmod g-r file.txt

En este ejemplo, "g" representa al grupo del archivo y "-r" significa quitar el permiso de lectura. Por lo tanto, el grupo del archivo ahora solo tendrá permisos de escritura y ejecución.

## 56. Permisos por defecto: unmask

En Linux, cuando se crea un archivo o directorio, se establecen permisos predeterminados para ese archivo o directorio. El "umask" es una configuración del sistema que determina qué permisos se quitarán de estos permisos predeterminados.

El valor "umask" es un valor octal que indica qué permisos se quitarán de los permisos predeterminados. Por ejemplo, si el valor de umask es 022, se quitará el permiso de escritura para el grupo y el usuario que no es el propietario.

Entonces, si los permisos predeterminados para un archivo son 666 (lectura y escritura para todos los usuarios), la umask de 022 quitará los permisos de escritura para grupo y otros, lo que dejará los permisos finales en 644 (lectura y escritura para el propietario, y solo lectura para grupo y otros).

Para cambiar el valor de umask, se puede utilizar el comando "umask" seguido del valor octal deseado. Por ejemplo, para establecer la umask en 027, se usaría el siguiente comando:

```bash
umask 027
```

Esto significa que se quitarán los permisos de escritura y lectura para grupo y otros, lo que dejará los permisos finales en 640 (lectura y escritura para el propietario, y ningún permiso para grupo y otros).

## 57. Setuid, setgid y sticky bit

En Linux, existen tres atributos especiales que se pueden establecer en un archivo o directorio, los cuales son setuid, setgid y sticky bit.

- Setuid (SUID): este atributo se puede establecer en un archivo ejecutable y permite que el usuario que lo ejecute obtenga los mismos permisos que el propietario del archivo. Por ejemplo, si el propietario de un archivo es el usuario "root" y el archivo tiene el bit SUID establecido, un usuario normal que ejecute el archivo tendrá temporalmente los mismos permisos que el usuario "root".

- Setgid (SGID): este atributo se puede establecer en un directorio y permite que los archivos creados en ese directorio adopten el grupo del directorio en lugar del grupo del usuario que lo crea. Por ejemplo, si el directorio "proyecto" tiene el bit SGID establecido con el grupo "desarrollo", cualquier archivo creado en ese directorio tendrá el grupo "desarrollo" en lugar del grupo del usuario que lo creó.

- Sticky bit: este atributo se puede establecer en un directorio y restringe la eliminación de archivos dentro de ese directorio a los propietarios de los archivos y al usuario root. Por ejemplo, si el directorio "/tmp" tiene el bit sticky bit establecido, los usuarios solo pueden eliminar los archivos que han creado ellos mismos y no pueden eliminar los archivos creados por otros usuarios.

Estos atributos especiales se establecen con el comando "chmod" en Linux. Por ejemplo, para establecer el bit SUID en un archivo llamado "programa", se puede utilizar el siguiente comando:

```bash
chmod u+s programa
```

Para establecer el bit SGID en un directorio llamado "proyecto", se puede utilizar el siguiente comando:

```bash
chmod g+s proyecto
```

Y para establecer el sticky bit en un directorio llamado "/tmp", se puede utilizar el siguiente comando:

```bash
chmod +t /tmp
```

### setuid

```bash
"Lesson 57" > file57.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls -la file57.txt
-rw-rw-r-- 1 javier javier 10 abr 19 15:50 file57.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ chmod 4770 file57.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls -la file57.txt
-rwsrwx--- 1 javier javier 10 abr 19 15:50 file57.txt
```

La s significa que tiene el setuid, es decir la identificacion del owner

### setgid

Es lo mismo pero para grupos

chmod 2770 file57.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls -la file57.txt
-rwxrws--- 1 javier javier 10 abr 19 15:50 file57.txt

### sticky

Ya no usa en ficheros y solo en directorios. Los directorios se tratarán de forma especial, por ejemplo renombrar archivos

```bash
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ mkdir testDir57
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ echo "newfile" > testDir57/newFile.txt
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls -lad testDir57/
drwxrwxr-x 2 javier javier 4096 abr 19 15:58 testDir57/
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ chmod 1770 testDir57/
javier@javier-machine:~/code/courses/linux-sh/s08-permissions/exercises$ ls -lad testDir57/
drwxrwx--T 2 javier javier 4096 abr 19 15:58 testDir57/
```

## 58. Cambio de identidad: su

### Explicación

El comando su es una abreviatura de "switch user" y permite cambiar de usuario en un sistema Linux. Por defecto, si se ejecuta sin argumentos, cambiará al usuario root. Para cambiar a otro usuario, se puede especificar el nombre de usuario como argumento: su nombredeusuario.

Para cambiar a un usuario con derechos de superusuario, es necesario tener privilegios de superusuario o conocer la contraseña del usuario al que se quiere cambiar. Si se tiene privilegios de superusuario, se puede ejecutar su sin especificar el nombre de usuario para cambiar al usuario root.

Una vez que se ha cambiado de usuario con su, se puede ejecutar comandos como si se hubiera iniciado sesión como ese usuario. Esto es útil para realizar tareas administrativas que requieren privilegios elevados.

Es importante tener en cuenta que su no es lo mismo que iniciar sesión directamente como otro usuario. Cuando se utiliza su, se cambia temporalmente de usuario, pero no se cambia de entorno de shell ni se cargan las variables de entorno del usuario. Por lo tanto, algunos comandos pueden no funcionar correctamente cuando se utilizan con su.

Para salir de una sesión de su, se puede utilizar el comando exit o presionar Ctrl+D. Esto volverá al usuario original.

### Crear un usuario

```bash
javier@javier-machine:~$ sudo adduser testuser2304
Adding user `testuser2304' ...
Adding new group `testuser2304' (1001) ...
Adding new user `testuser2304' (1001) with group `testuser2304' ...
Creating home directory `/home/testuser2304' ...
Copying files from `/etc/skel' ...
New password:
BAD PASSWORD: The password is shorter than 8 characters
Retype new password:
passwd: password updated successfully
Changing the user information for testuser2304
Enter the new value, or press ENTER for the default
	Full Name []: test user
	Room Number []:
	Work Phone []:
	Home Phone []:
	Other []:
Is the information correct? [Y/n] y

```

### Cambiar usuario

Existen 3 formas:

1. Interfaz gráfica: cerrar sesion y abrir
2. su

```bash
javier@javier-machine:~$ su testuser2304
Password:
testuser2304@javier-machine:/home/javier$ id
uid=1001(testuser2304) gid=1001(testuser2304) groups=1001(testuser2304)
testuser2304@javier-machine:/home/javier$
```

Con este usuario no puedo acceder a la info del otro

```bash
testuser2304@javier-machine:/home/javier$ ls
ls: cannot open directory '.': Permission denied

```

Se crea un área de trabajo:

```bash
testuser2304@javier-machine:/home$ ls
javier  testuser2304

```

Para salir exit

```bash
testuser2304@javier-machine:/home$ exit
exit
javier@javier-machine:~$

```

Para pasar directamente al directorio de trabajo del usuario

```bash
javier@javier-machine:~$ su - testuser2304
Password:
testuser2304@javier-machine:~$
```

Para ejecuar acciones omo otro usuario:
testuser2304@javier-machine:/home$ ls
javier testuser2304
testuser2304@javier-machine:/home$ su -c 'chmod o+r javier' javier
Password:

3. sudo

No nos podemos loguear con root, o si se puede pero no se recomienda, en su lugar se usa sudo

## 59. sudo

### Explicación

El comando sudo (abreviatura de "superuser do") en Linux es una herramienta que permite a un usuario ejecutar comandos o programas con los privilegios de otro usuario, generalmente el usuario "root" o "superusuario".

El comando sudo es útil para realizar tareas de administración del sistema que requieren permisos de root, como la instalación de software, la configuración de servicios, la modificación de archivos de configuración del sistema, entre otros. Al utilizar sudo, los usuarios pueden realizar estas tareas sin necesidad de iniciar sesión como root, lo que aumenta la seguridad del sistema.

Para utilizar sudo, los usuarios deben tener los permisos adecuados en el archivo /etc/sudoers, que es el archivo de configuración de sudo. Este archivo permite a los administradores del sistema especificar qué usuarios pueden utilizar sudo, qué comandos pueden ejecutar y con qué privilegios.

Para usar sudo, simplemente escriba el comando sudo seguido del comando o programa que se desea ejecutar. Por ejemplo, para instalar un paquete de software con el comando apt-get, se puede escribir:

```bash
sudo apt-get install nombre_del_paquete
```

El sistema le pedirá al usuario que ingrese su contraseña antes de ejecutar el comando con los privilegios de root. Si el usuario tiene permisos adecuados en /etc/sudoers, el comando se ejecutará con los privilegios de root y se realizará la tarea solicitada.

### sudo -i

Es una sección interactiva del usuario sudo.

## 60. sudoers

### Introducción

En Linux, sudoers es un archivo de configuración que se utiliza para controlar el acceso de los usuarios al comando sudo. Este archivo determina qué usuarios pueden utilizar el comando sudo, qué comandos están autorizados y en qué condiciones pueden ser ejecutados.

El archivo sudoers está ubicado en /etc/sudoers y sólo puede ser modificado por usuarios con privilegios de root. Es importante tener cuidado al editar este archivo, ya que cualquier error en su configuración puede dejar a los usuarios sin acceso al comando sudo.

Aquí hay algunos ejemplos prácticos de cómo se puede utilizar sudoers:

Permitir que un usuario ejecute cualquier comando con sudo sin necesidad de introducir su contraseña:

```bash
username ALL=(ALL) NOPASSWD: ALL
```

Con esta configuración, el usuario username podrá ejecutar cualquier comando con sudo sin necesidad de introducir su contraseña. Es importante tener en cuenta que esta configuración no es recomendada desde un punto de vista de seguridad, ya que cualquier persona que tenga acceso a la cuenta del usuario username también tendrá acceso a todos los comandos con sudo.

Permitir que un usuario ejecute sólo ciertos comandos con sudo:

```bash
username ALL=(root) /bin/ls, /bin/cat
```

Con esta configuración, el usuario username podrá ejecutar los comandos /bin/ls y /bin/cat como el usuario root utilizando sudo. Si el usuario intenta ejecutar cualquier otro comando con sudo, recibirá un mensaje de error.

Permitir que un grupo de usuarios ejecute ciertos comandos con sudo:

```shell
%groupname ALL=(ALL) /usr/sbin/useradd, /usr/sbin/userdel
```

Con esta configuración, todos los usuarios que pertenezcan al grupo groupname podrán ejecutar los comandos useradd y userdel con sudo. Es importante tener en cuenta que el grupo debe tener el símbolo % al principio de su nombre para indicar que es un grupo y no un usuario individual.

Estos son sólo algunos ejemplos de cómo se puede utilizar el archivo sudoers en Linux para controlar el acceso de los usuarios al comando sudo. Es importante tener en cuenta que la edición del archivo sudoers debe ser realizada con precaución para evitar errores de configuración que puedan comprometer la seguridad del sistema.

### visualizar el archivo sudoers

javier@javier-machine:~$ sudo cat /etc/sudoers

#

# This file MUST be edited with the 'visudo' command as root.

#

# Please consider adding local content in /etc/sudoers.d/ instead of

# directly modifying this file.

#

# See the man page for details on how to write a sudoers file.

#

Defaults env_reset
Defaults mail_badpass
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
Defaults use_pty

# This preserves proxy settings from user environments of root

# equivalent users (group sudo)

#Defaults:%sudo env_keep += "http_proxy https_proxy ftp_proxy all_proxy no_proxy"

# This allows running arbitrary commands, but so does ALL, and it means

# different sudoers have their choice of editor respected.

#Defaults:%sudo env_keep += "EDITOR"

# Completely harmless preservation of a user preference.

#Defaults:%sudo env_keep += "GREP_COLOR"

# While you shouldn't normally run git as root, you need to with etckeeper

#Defaults:%sudo env*keep += "GIT_AUTHOR*_ GIT*COMMITTER*_"

# Per-user preferences; root won't have sensible values for them.

#Defaults:%sudo env_keep += "EMAIL DEBEMAIL DEBFULLNAME"

# "sudo scp" or "sudo rsync" should be able to use your SSH agent.

#Defaults:%sudo env_keep += "SSH_AGENT_PID SSH_AUTH_SOCK"

# Ditto for GPG agent

#Defaults:%sudo env_keep += "GPG_AGENT_INFO"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification

root ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges

%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command

%sudo ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "@include" directives:

@includedir /etc/sudoers.d

---

### editar el archivo

```bash
sudo visudo /etc/sudoers
```

### Explicación de unas reglas

```bash
root ALL=(ALL:ALL) ALL
```

Este es un ejemplo de una línea en el archivo sudoers de Linux, que define un conjunto de permisos para el usuario root. Aquí está la explicación de los diferentes elementos de la línea:

- "root" es el usuario para el cual se están definiendo los permisos.
- "ALL" significa que los permisos se aplican a cualquier host. Si se especifica un host en particular, solo se aplicarán a ese host.
- "(ALL:ALL)" indica que los permisos se aplican a cualquier usuario y cualquier grupo. Si se especifica un usuario o grupo en particular, solo se aplicarán a ese usuario o grupo.
- "ALL" indica que se permiten todas las acciones, lo que significa que el usuario root puede ejecutar cualquier comando con privilegios de superusuario.

Por lo tanto, esta línea le da al usuario root acceso completo a todos los comandos de superusuario en cualquier host y para cualquier usuario o grupo. Es importante tener en cuenta que el archivo sudoers es muy sensible y cualquier error en su configuración puede tener consecuencias graves, por lo que es recomendable tener cuidado al editarlo.

## 61. Gestión de usuarios y grupos: useradd, groupadd, usermod y deluser

### Explicación

- useradd: Este comando se utiliza para crear una nueva cuenta de usuario en el sistema. Ejemplo: sudo useradd -m john creará una nueva cuenta de usuario llamada "john" con su directorio de inicio en /home/john.

- groupadd: Este comando se utiliza para crear un nuevo grupo en el sistema. Ejemplo: sudo groupadd mygroup creará un nuevo grupo llamado "mygroup".

- usermod: Este comando se utiliza para modificar una cuenta de usuario existente en el sistema. Algunos ejemplos son:

- sudo usermod -aG mygroup john: Agregará al usuario "john" al grupo "mygroup".
  sudo usermod -L john: Bloqueará la cuenta de usuario "john", impidiéndole iniciar sesión.

- deluser: Este comando se utiliza para eliminar una cuenta de usuario y su directorio de inicio del sistema. Ejemplo: sudo deluser john eliminará la cuenta de usuario "john" y su directorio de inicio.

## 62. Cambio de propietario: chown y chgrp

En Linux, el comando chown se utiliza para cambiar el propietario de un archivo o directorio, mientras que el comando chgrp se utiliza para cambiar el grupo propietario de un archivo o directorio.

La sintaxis básica para cambiar el propietario con chown es:

```bash
"chown [nuevo propietario] [archivo/directorio]"
```

Por ejemplo, si queremos cambiar el propietario del archivo "archivo.txt" a un usuario llamado "usuario1", usaríamos el siguiente comando:

```bash
chown usuario1 archivo.txt
```

La sintaxis básica para cambiar el grupo propietario con chgrp es:

```bash
chgrp [nuevo grupo] [archivo/directorio]
```

Por ejemplo, si queremos cambiar el grupo propietario del archivo "archivo.txt" a un grupo llamado "grupo1", usaríamos el siguiente comando:

```bash
chgrp grupo1 archivo.txt
```

Ambos comandos requieren permisos de superusuario (root) para ser ejecutados en archivos o directorios que no pertenecen al usuario actual o al grupo actual del usuario.

## 63. Caso práctico
