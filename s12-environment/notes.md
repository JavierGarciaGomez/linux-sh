# 12. Linux environment

## 103. El entorno de linux

Las variables de entorno en Linux son valores configurables a nivel del sistema operativo que afectan el comportamiento y la configuración de los programas y aplicaciones en ejecución. Estas variables se utilizan para proporcionar información importante, como rutas de búsqueda, configuraciones específicas del usuario, ubicaciones de archivos y más.

Las variables de entorno están disponibles para todos los procesos en el sistema y se utilizan para proporcionar información global y consistente. Algunas variables de entorno comunes incluyen:

PATH: Define las rutas de búsqueda para los ejecutables del sistema. Permite que los programas se ejecuten simplemente escribiendo su nombre, sin necesidad de especificar la ruta completa del archivo ejecutable.
HOME: Indica el directorio de inicio del usuario actual.
USER: Representa el nombre de usuario del usuario actual.
LANG o LC\_\*: Definen el idioma y las configuraciones regionales utilizadas por el sistema y las aplicaciones.
PWD: Indica el directorio de trabajo actual.
Puedes ver y configurar las variables de entorno en Linux utilizando el comando env para mostrar todas las variables existentes, y el comando export para establecer o modificar el valor de una variable de entorno. También puedes definir variables de entorno en el archivo ~/.bashrc o ~/.bash_profile para que estén disponibles automáticamente cada vez que inicies una sesión de terminal.

Las variables de entorno son importantes para personalizar y ajustar el comportamiento del sistema y las aplicaciones según las necesidades de cada usuario.

### printenv

```bash
printenv
SHELL=/bin/bash
SESSION_MANAGER=local/javier-machine:@/tmp/.ICE-unix/1878,unix/javier-machine:/tmp/.ICE-unix/1878
QT_ACCESSIBILITY=1
COLORTERM=truecolor
XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
SSH_AGENT_LAUNCHER=gnome-keyring
NVM_INC=/home/javier/.nvm/versions/node/v18.0.0/include/node
XDG_MENU_PREFIX=gnome-
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
GTK_IM_MODULE=ibus
TERMINATOR_DBUS_PATH=/net/tenshu/Terminator2
MANDATORY_PATH=/usr/share/gconf/ubuntu.mandatory.path
LC_ADDRESS=es_ES.UTF-8
GNOME_SHELL_SESSION_MODE=ubuntu
LC_NAME=es_ES.UTF-8
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
TERMINATOR_UUID=urn:uuid:ccef5006-4268-4c5f-a1e5-a47ede9ade1f
XMODIFIERS=@im=ibus
DESKTOP_SESSION=ubuntu
LC_MONETARY=es_ES.UTF-8
GTK_MODULES=gail:atk-bridge
PWD=/home/javier
XDG_SESSION_DESKTOP=ubuntu
LOGNAME=javier
XDG_SESSION_TYPE=x11
GPG_AGENT_INFO=/run/user/1000/gnupg/S.gpg-agent:0:1
SYSTEMD_EXEC_PID=2172
XAUTHORITY=/run/user/1000/gdm/Xauthority
WINDOWPATH=2
HOME=/home/javier
USERNAME=javier
LC_PAPER=es_ES.UTF-8
LANG=en_US.UTF-8
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
XDG_CURRENT_DESKTOP=ubuntu:GNOME
VTE_VERSION=6800
INVOCATION_ID=00c70ec0a58946b9a9c333c6d492f04d
TERMINATOR_DBUS_NAME=net.tenshu.Terminator21a9d5db22c73a993ff0b42f64b396873
MANAGERPID=1529
NVM_DIR=/home/javier/.nvm
LESSCLOSE=/usr/bin/lesspipe %s %s
XDG_SESSION_CLASS=user
IBUS_DISABLE_SNOOPER=1
TERM=xterm-256color
LC_IDENTIFICATION=es_ES.UTF-8
DEFAULTS_PATH=/usr/share/gconf/ubuntu.default.path
LESSOPEN=| /usr/bin/lesspipe %s
USER=javier
DISPLAY=:0
SHLVL=1
NVM_CD_FLAGS=
LC_TELEPHONE=es_ES.UTF-8
QT_IM_MODULE=ibus
LC_MEASUREMENT=es_ES.UTF-8
XDG_RUNTIME_DIR=/run/user/1000
LC_TIME=es_ES.UTF-8
JOURNAL_STREAM=8:33723
XDG_DATA_DIRS=/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
PATH=/home/javier/.nvm/versions/node/v18.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
GDMSESSION=ubuntu
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
NVM_BIN=/home/javier/.nvm/versions/node/v18.0.0/bin
GIO_LAUNCHED_DESKTOP_FILE_PID=88193
LC_NUMERIC=es_ES.UTF-8
_=/usr/bin/printenv

```

### imprimir variables

```bash
echo $PATH
/home/javier/.nvm/versions/node/v18.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin

```

## 104. Cómo se establece el entorno

### /etc/environment

El archivo /etc/environment es un archivo de configuración en Linux que se utiliza para establecer variables de entorno globales para todos los usuarios del sistema. A diferencia de las variables de entorno definidas por el usuario en la sesión actual, las variables definidas en /etc/environment estarán disponibles de forma permanente para todos los usuarios y procesos del sistema.

Aquí tienes algunas características importantes sobre el archivo /etc/environment:

Sintaxis: El archivo /etc/environment utiliza una sintaxis simple de asignación de variables, donde cada línea contiene una variable y su valor separados por un signo de igual (=). Por ejemplo:

```bash
VARIABLE=valor
```

Sin espacios ni comillas: A diferencia de los scripts de shell, no se permiten espacios ni comillas alrededor del signo de igual (=) en /etc/environment. Por lo tanto, no se deben incluir comillas al asignar valores que contengan espacios o caracteres especiales.

Variables de entorno globales: Las variables definidas en /etc/environment se consideran variables de entorno globales y estarán disponibles para todos los usuarios y procesos en el sistema.

Reinicio necesario: Después de realizar cambios en el archivo /etc/environment, es necesario reiniciar el sistema o iniciar sesión nuevamente para que los cambios surtan efecto. Esto se debe a que el archivo se lee al inicio del sistema y las variables se cargan en el entorno en ese momento.

Es importante tener en cuenta que el archivo /etc/environment es de solo lectura para los usuarios regulares y solo puede ser modificado por el superusuario (root). Esto garantiza que las variables de entorno definidas en el archivo sean consistentes y no puedan ser modificadas accidentalmente por usuarios no autorizados.

En resumen, el archivo /etc/environment es utilizado para establecer variables de entorno globales en Linux, asegurando que estén disponibles para todos los usuarios y procesos del sistema. Es un archivo de solo lectura y requiere un reinicio del sistema para que los cambios surtan efecto.

### /etc/profile

El archivo /etc/profile es un archivo de script de inicio en Linux que se ejecuta al iniciar sesión de cualquier usuario. Su objetivo principal es configurar el entorno de inicio y establecer variables de entorno globales que estarán disponibles para todos los usuarios.

Aquí hay algunas características importantes sobre el archivo /etc/profile:

Configuración del entorno global: El archivo /etc/profile se utiliza para configurar el entorno de inicio global del sistema. Esto implica la configuración de variables de entorno, rutas de búsqueda y otros ajustes que afectan a todos los usuarios.

Variables de entorno globales: Al igual que en /etc/environment, puedes definir variables de entorno globales en /etc/profile. Estas variables estarán disponibles para todos los usuarios después de iniciar sesión.

Script de shell: /etc/profile es un script de shell, por lo general escrito en Bash, que contiene comandos y asignaciones de variables. Puedes utilizar la sintaxis de asignación de variables (VAR=valor) para establecer variables de entorno.

Archivo de inicio de sesión: El contenido de /etc/profile se ejecuta al iniciar sesión de cualquier usuario en el sistema. Esto incluye tanto las sesiones de inicio de sesión en terminales virtuales como las sesiones de inicio de sesión gráfico (GUI).

Orden de ejecución: Es importante tener en cuenta que /etc/profile se ejecuta antes de los archivos de perfil de usuario individuales, como ~/.bash_profile o ~/.profile. Esto significa que las configuraciones y variables definidas en /etc/profile pueden ser modificadas o anuladas por los archivos de perfil de usuario.

Requisitos de superusuario: Para modificar /etc/profile, se requieren privilegios de superusuario (root). Esto garantiza que las configuraciones del entorno global sean controladas y gestionadas por administradores del sistema.

En resumen, /etc/profile es un archivo de script de inicio que se ejecuta al iniciar sesión de cualquier usuario en el sistema. Se utiliza para configurar el entorno global y establecer variables de entorno globales que estarán disponibles para todos los usuarios. Este archivo juega un papel importante en la configuración inicial del entorno de Linux.
