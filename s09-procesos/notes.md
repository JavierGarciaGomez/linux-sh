# Section 09. Users and permissions

## 65. Procesos en Linux

En Linux, un proceso es una instancia de un programa en ejecución, el cual tiene su propio espacio de memoria y recursos asignados. Un proceso se inicia cuando se ejecuta un programa o comando, y se ejecuta de manera independiente del resto de los procesos del sistema.

Cada proceso en Linux tiene un identificador único llamado PID (Process ID o ID de proceso), que se utiliza para identificar el proceso y controlar su ejecución. El PID es asignado por el sistema operativo al iniciar el proceso y es único para cada proceso en ejecución. Los PIDs pueden ser consultados y administrados mediante el uso de comandos como ps y kill.

En resumen, los procesos son una parte fundamental del funcionamiento de Linux, ya que permiten la ejecución de múltiples programas y tareas simultáneamente, garantizando la estabilidad y el rendimiento del sistema.

### pidof command

Con este comando podemos detectar el pid de un proceso e incluso entrar a su directorio en proc

```bash
testuser2304@javier-machine:/$ pidof spotify
8165 8152 8147 7988 7960 7959 7866
testuser2304@javier-machine:/$ cd proc/8165
testuser2304@javier-machine:/proc/8165$ ls
ls: cannot read symbolic link 'cwd': Permission denied
ls: cannot read symbolic link 'root': Permission denied
ls: cannot read symbolic link 'exe': Permission denied
arch_status         cwd                maps           pagemap       stack
attr                environ            mem            patch_state   stat
autogroup           exe                mountinfo      personality   statm
auxv                fd                 mounts         projid_map    status
cgroup              fdinfo             mountstats     root          syscall
clear_refs          gid_map            net            sched         task
cmdline             io                 ns             schedstat     timens_offsets
comm                ksm_merging_pages  numa_maps      sessionid     timers
coredump_filter     limits             oom_adj        setgroups     timerslack_ns
cpu_resctrl_groups  loginuid           oom_score      smaps         uid_map
cpuset              map_files          oom_score_adj  smaps_rollup  wchan

```

## 66. Visualización estática de procesos

### Comando ps

El comando ps en Linux es una herramienta de línea de comandos que se utiliza para mostrar información sobre los procesos en ejecución del sistema. Con ps, puedes ver una lista de los procesos en ejecución, así como información detallada sobre cada proceso.

Algunos ejemplos de uso del comando ps son:

ps aux: muestra información detallada sobre todos los procesos en ejecución en el sistema.
ps -e: muestra una lista de todos los procesos en ejecución en el sistema.
ps -f: muestra una lista de todos los procesos en ejecución en formato de árbol.
ps -u: muestra información detallada sobre los procesos asociados con un usuario específico.
ps -p: muestra información detallada sobre un proceso específico, especificando su PID.
El PID o "Identificador de proceso" es un número que identifica de forma única cada proceso en el sistema. Es utilizado para identificar el proceso en cuestión y para realizar ciertas acciones en el mismo utilizando otros comandos como kill.

En resumen, el comando ps es una herramienta útil para monitorear los procesos en ejecución en el sistema y obtener información detallada sobre ellos.

### Ejecución del comando ps

```bash
ps
    PID TTY          TIME CMD
 162647 pts/10   00:00:00 bash
 409415 pts/10   00:00:00 ps
```

ps sin parámetros solo devuelve los procesos asociados a la terminal.

### ps x

```bash
javier@javier-machine:~$ ps x
    PID TTY      STAT   TIME COMMAND
   1576 ?        Ss     0:04 /lib/systemd/systemd --user
   1577 ?        S      0:00 (sd-pam)
   1585 ?        S<sl   0:00 /usr/bin/pipewire
```

Agrega la columna estado.

Abriendo emacs:

```bash
emacs
javier@javier-machine:~$ emacs &
[1] 411647
javier@javier-machine:~$ ps x
....
 411492 pts/3    Ss     0:00 bash
 411647 pts/3    Sl     0:00 emacs
```

### STAT meaning in ps

When calling ps x, the STAT column shows the current status of the process. The different values that can appear in the STAT column are:

R - Running or runnable (on run queue).
S - Interruptible sleep (waiting for an event to complete).
D - Uninterruptible sleep (usually waiting for I/O to complete).
Z - Zombie (process terminated, but parent process has not yet waited for it to collect its exit status).
T - Stopped (process stopped by job control signal).
t - Tracing stop (process stopped by debugger during tracing).
W - Paging (process is partially swapped out).
X - Dead (should never be seen).
x - Dead (should never be seen).
K - Wakekill (process killed while waking up).
W - Waking (process is waking up).
P - Parked (process is parked).
These values provide information about the current state of the process, which can be useful for troubleshooting or performance monitoring purposes.

### ps aux

#### Concepto

ps aux es un comando de Linux que muestra información detallada sobre todos los procesos en ejecución del sistema. La salida del comando muestra una lista de todos los procesos del sistema, junto con información detallada como su PID (identificador de proceso), uso de CPU, uso de memoria, tiempo de ejecución, estado del proceso y otros detalles.

La opción "a" muestra los procesos de todos los usuarios y "u" muestra la información del propietario del proceso. La opción "x" muestra los procesos de usuarios que no tienen una terminal abierta. En conjunto, ps aux muestra todos los procesos en ejecución en el sistema, incluso los que no están asociados con una terminal. Este comando es muy útil para la administración de sistemas y para solucionar problemas de rendimiento en el sistema.

## 67. Visualización dinámica de procesos

### Comando top

El comando top es una herramienta de línea de comandos que permite ver los procesos en ejecución y el uso de recursos del sistema en tiempo real. A continuación se muestran algunos ejemplos de cómo utilizar el comando top.

1. Ejecutar top:
   Simplemente escribir top en la terminal y presionar Enter, lo que mostrará la lista de procesos en ejecución en el sistema, ordenados por uso de CPU.

```bash
$ top
```

2. Ordenar la lista de procesos por otros criterios:
   Por defecto, top ordena los procesos por uso de CPU, pero es posible cambiar el orden de clasificación. Por ejemplo, para ordenar los procesos por uso de memoria, se debe presionar la letra "m". Si se desea ordenar por el tiempo de ejecución, presionar "t".

3. Ver procesos de un usuario específico:
   Para ver solo los procesos de un usuario específico, se puede usar la opción -u seguida del nombre del usuario. Por ejemplo, para ver solo los procesos del usuario "johndoe":

```bash
$ top -u johndoe
```

4. Cambiar la frecuencia de actualización:
   Por defecto, top se actualiza cada 3 segundos. Si se desea cambiar la frecuencia, se puede usar la opción -d seguida del número de segundos entre actualizaciones. Por ejemplo, para actualizar cada segundo:

```bash
$ top -d 1
```

5. Obtener ayuda:
   Para obtener información detallada sobre las opciones disponibles para top, se puede utilizar la opción -h o --help:

```bash
$ top -h
```

### Explicación de la cabecera de top

La cabecera de top en Linux se refiere a la primera línea de información que aparece en la salida del comando. Esta línea proporciona una descripción general de la actividad del sistema. A continuación, se explican los elementos que componen la cabecera de top:

- top - Esta es la identificación del comando que se está ejecutando.

- up - Esta línea indica el tiempo transcurrido desde que se inició el sistema.

- load average - Indica la carga promedio del sistema durante los últimos 1, 5 y 15 minutos, respectivamente.

- tasks - Proporciona una vista general de los procesos que se están ejecutando en el sistema. Se muestra el número total de procesos en ejecución, el número de procesos en ejecución, el número de procesos suspendidos y el número de procesos zombies.

- %CPU - Esta columna indica el porcentaje de uso de CPU por parte de cada proceso.

- %MEM - Esta columna indica el porcentaje de memoria utilizada por cada proceso.

- Time+ - Esta columna indica la cantidad total de tiempo de CPU que ha utilizado cada proceso.

- PID - Esta columna indica el ID de proceso único para cada proceso.

- USER - Esta columna indica el nombre del usuario que inició el proceso.

- PR - Esta columna indica la prioridad de planificación del proceso.

- NI - Esta columna indica la "niceness" del proceso, lo que afecta a su prioridad en la planificación.

- VIRT - Esta columna indica la cantidad de memoria virtual utilizada por cada proceso.

- RES - Esta columna indica la cantidad de memoria física utilizada por cada proceso.

- SHR - Esta columna indica la cantidad de memoria compartida utilizada por cada proceso.

### top example

```bash
top - 11:03:09 up 3 days, 23:16,  1 user,  load average: 0,28, 0,46, 0,58
Tasks: 431 total,   1 running, 430 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2,1 us,  1,2 sy,  0,0 ni, 96,6 id,  0,0 wa,  0,0 hi,  0,0 si,  0,0 st
MiB Mem : 44,1/31999,0  [|||||||||||||||||||||||||||||                                    ]
MiB Swap: 17,1/1952,0   [|||||||||||                                                      ]

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   2060 javier    20   0 5227816 801632 111736 S   2,3   2,4 201:00.58 gnome-shell
 177402 javier    20   0   32,9g 552004 241544 S   1,9   1,7  56:25.72 chrome
   1639 javier    20   0 6790236 225448  66952 S   1,8   0,7  51:46.44 Xorg
 411469 javier    20   0  899284  55676  42416 S   1,8   0,2   0:05.17 gnome-terminal-
   5912 javier    20   0 1129,6g 419080  62044 S   1,1   1,3  85:17.59 slack
 177448 javier    20   0   34,9g 437764 185984 S   0,8   1,3 181:39.80 chrome
   2772 javier    20   0   32,4g 157412  64036 S   0,7   0,5  30:22.28 skypeforlinux
   2816 javier    20   0   41,0g 301324  96880 S   0,7   0,9  30:24.93 skypeforlinux
   4841 javier    20   0   54,5g 331152 103964 S   0,5   1,0  72:25.10 code
   1155 root     -51   0       0      0      0 S   0,4   0,0  70:15.36 irq/76-nvidia
   7866 javier    20   0 4678796 205780  63972 S   0,4   0,6  17:20.75 spotify
   5868 javier    20   0   32,6g 192792  60124 S   0,3   0,6  19:01.46 slack
   9626 javier    20   0   16,5g  35112  24440 S   0,3   0,1   3:11.95 postman
 177449 javier    20   0   32,4g 141560 100908 S   0,3   0,4  17:34.21 chrome
 177990 javier    20   0 1131,0g 990,0m 122192 S   0,3   3,1   8:16.19 chrome
 194094 javier    20   0 7377988 385228  80464 S   0,3   1,2   6:16.28 dropbox
 267660 javier    20   0 1133,1g   1,8g 130420 S   0,3   5,6  11:17.74 chrome
 408978 javier    20   0 1135,1g 431640 148844 S   0,3   1,3   3:21.72 chrome
   2795 javier    20   0   32,3g  34628  24480 S   0,1   0,1   3:08.69 skypeforlinux
   4124 root      30  10 1698012  72668  10232 S   0,1   0,2   3:42.82 osqueryd
   4785 javier    20   0   36,6g 154392  97248 S   0,1   0,5   6:24.87 code
   4814 javier    20   0   32,5g 151380  81840 S   0,1   0,5  14:16.86 code
   5814 javier    20   0 1121,6g 120644  49452 S   0,1   0,4   3:40.14 slack
   8152 javier    20   0 1290324  50696  28480 S   0,1   0,2   1:24.18 spotify
   9439 javier    20   0   20,8g 127100  44868 S   0,1   0,4  11:57.26 postman
   9655 javier    20   0   38,7g 391144  66660 S   0,1   1,2  28:41.21 postman
  63827 javier    20   0 1711476 111920  46504 S   0,1   0,3   1:42.97 nautilus
 346478 javier    20   0 1131,0g   1,1g 126560 S   0,1   3,6   6:45.24 chrome
 397331 root      20   0       0      0      0 I   0,1   0,0   0:02.00 kworker/u64:6-event+
 400414 javier    20   0 1132,9g 127900  87080 S   0,1   0,4   0:10.40 chrome
 408537 javier    20   0   36,4g 287480  69368 S   0,1   0,9   0:25.67 code
 408707 javier    20   0   36,4g  70388  54732 S   0,1   0,2   0:00.38 code
 412123 javier    20   0   40,4g 119508  74080 S   0,1   0,4   0:08.06 code
 412850 javier    20   0   22148   4756   3624 R   0,1   0,0   0:00.01 top
      1 root      20   0  167228  10960   6640 S   0,0   0,0   0:06.94 systemd
      2 root      20   0       0      0      0 S   0,0   0,0   0:00.27 kthreadd
      3 root       0 -20       0      0      0 I   0,0   0,0   0:00.00 rcu_gp
      4 root       0 -20       0      0      0 I   0,0   0,0   0:00.00 rcu_par_gp
      5 root       0 -20       0      0      0 I   0,0   0,0   0:00.00 slub_flushwq
      6 root       0 -20       0      0      0 I   0,0   0,0   0:00.00 netns
      8 root       0 -20       0      0      0 I   0,0   0,0   0:00.00 kworker/0:0H-events+
     10 root       0 -20       0      0      0 I   0,0   0,0   0:00.00 mm_percpu_wq
     11 root      20   0       0      0      0 I   0,0   0,0   0:00.00 rcu_tasks_kthread
```

## 68. Interrupción de procesos

## 69. Procesos en segundo plano

El segundo plano en Linux es un estado en el que se ejecuta un proceso sin la necesidad de mantener una ventana o terminal abierta. Esto permite al usuario ejecutar varias tareas simultáneamente y mejorar la eficiencia en el uso del sistema.

Para ejecutar un proceso en segundo plano, se puede agregar el caracter "&" al final del comando. Por ejemplo:

```bash
$ sleep 60 &
```

Este comando ejecuta el comando "sleep 60" en segundo plano, lo que significa que el proceso se ejecutará durante 60 segundos en segundo plano.

Para ver los procesos en segundo plano que se están ejecutando, se puede utilizar el comando "jobs". Por ejemplo:

```bash
$ jobs
[1]+  Running                 sleep 60 &
```

Este comando muestra información sobre el proceso en segundo plano, incluyendo su ID y estado.

Para reanudar un proceso en segundo plano que se ha detenido o suspendido, se puede utilizar el comando "bg" seguido del ID del proceso. Por ejemplo:

```bash
$ bg %1
[1]+ sleep 60 &
```

Este comando reanuda el proceso en segundo plano con el ID 1 que se ha detenido o suspendido.

En resumen, el segundo plano es una función importante en Linux que permite ejecutar tareas en segundo plano sin la necesidad de mantener una ventana o terminal abierta, lo que mejora la eficiencia del uso del sistema.

## 70. Señales (signals)

En Linux, las señales son una forma de comunicación entre procesos o entre el kernel y los procesos. Las señales son una forma de notificar a un proceso que ocurrió un evento, como una interrupción o una interacción del usuario. Algunas señales también pueden ser usadas para controlar el comportamiento de los procesos, como interrumpirlos, detenerlos o reiniciarlos.

Algunos ejemplos de señales comunes incluyen:

SIGINT (señal 2): Esta señal se envía cuando el usuario presiona la combinación de teclas "Ctrl + C" en la terminal. Es comúnmente utilizada para interrumpir un proceso.

SIGKILL (señal 9): Esta señal fuerza la terminación inmediata de un proceso y no puede ser ignorada. Es una señal de último recurso para procesos que no responden a otras señales.

SIGTERM (señal 15): Esta señal se utiliza para solicitar la terminación ordenada de un proceso. El proceso puede realizar algunas operaciones finales antes de salir.

SIGSTOP (señal 19): Esta señal detiene temporalmente un proceso. El proceso puede ser reanudado más tarde con la señal SIGCONT.

SIGCONT (señal 18): Esta señal reanuda un proceso que fue detenido previamente con la señal SIGSTOP.

Por ejemplo, para enviar la señal SIGINT a un proceso con PID 1234, se puede utilizar el siguiente comando:

```bash
kill -2 1234
```

Otro ejemplo es enviar la señal SIGTERM a un proceso con PID 5678, se puede utilizar el siguiente comando:

```bash
kill -15 5678
```

Es importante tener en cuenta que no todos los procesos pueden ser interrumpidos o controlados por señales. Algunos procesos pueden ignorar ciertas señales o tener un comportamiento diferente al recibir una señal.

### kill command

El comando kill en Linux se utiliza para enviar una señal a un proceso en ejecución. La señal por defecto que se envía al proceso es la señal TERM (15), lo que significa que el proceso será terminado de forma segura. Sin embargo, se pueden enviar diferentes señales para realizar diferentes acciones, como detener el proceso (SIGSTOP), continuar el proceso detenido (SIGCONT), forzar el proceso a terminar (SIGKILL) y más.

La sintaxis básica del comando es la siguiente:

```bash
kill [opciones] PID
```

Donde PID es el ID del proceso que se desea enviar la señal. Aquí hay algunos ejemplos:

Para enviar una señal TERM (15) a un proceso con PID 1234, se puede ejecutar:

```bash
kill 1234
```

Para enviar una señal SIGKILL (9) a un proceso con PID 5678, se puede ejecutar:

```bash
kill -9 5678
```

Para detener temporalmente un proceso con PID 9012, se puede ejecutar:

```bash
kill -STOP 9012
```

Para reanudar un proceso detenido con PID 9012, se puede ejecutar:

```bash
kill -CONT 9012
```

También hay otras opciones disponibles, como -l para listar las señales disponibles y sus nombres, y -s para especificar una señal por su nombre en lugar de su número de señal.

### kill -l

```bash
javier@javier-machine:~$ kill -l
 1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL	 5) SIGTRAP
 6) SIGABRT	 7) SIGBUS	 8) SIGFPE	 9) SIGKILL	10) SIGUSR1
11) SIGSEGV	12) SIGUSR2	13) SIGPIPE	14) SIGALRM	15) SIGTERM
16) SIGSTKFLT	17) SIGCHLD	18) SIGCONT	19) SIGSTOP	20) SIGTSTP
21) SIGTTIN	22) SIGTTOU	23) SIGURG	24) SIGXCPU	25) SIGXFSZ
26) SIGVTALRM	27) SIGPROF	28) SIGWINCH	29) SIGIO	30) SIGPWR
31) SIGSYS	34) SIGRTMIN	35) SIGRTMIN+1	36) SIGRTMIN+2	37) SIGRTMIN+3
38) SIGRTMIN+4	39) SIGRTMIN+5	40) SIGRTMIN+6	41) SIGRTMIN+7	42) SIGRTMIN+8
43) SIGRTMIN+9	44) SIGRTMIN+10	45) SIGRTMIN+11	46) SIGRTMIN+12	47) SIGRTMIN+13
48) SIGRTMIN+14	49) SIGRTMIN+15	50) SIGRTMAX-14	51) SIGRTMAX-13	52) SIGRTMAX-12
53) SIGRTMAX-11	54) SIGRTMAX-10	55) SIGRTMAX-9	56) SIGRTMAX-8	57) SIGRTMAX-7
58) SIGRTMAX-6	59) SIGRTMAX-5	60) SIGRTMAX-4	61) SIGRTMAX-3	62) SIGRTMAX-2
63) SIGRTMAX-1	64) SIGRTMAX
```

### most popular signals

Aquí están las 10 señales más populares en Linux y su código numérico, junto con una breve explicación:

- SIGHUP (1) - Esta señal se utiliza para indicar a un proceso que se cierre limpiamente y que vuelva a cargar su configuración.

- SIGINT (2) - Esta señal se utiliza para interrumpir un proceso. Es la señal que se envía cuando se pulsa Ctrl+C en la terminal.

- SIGQUIT (3) - Esta señal se utiliza para forzar la salida de un proceso y obtener un volcado de núcleo para fines de depuración.

- SIGKILL (9) - Esta señal se utiliza para matar un proceso de forma inmediata y sin darle oportunidad de realizar ninguna acción de limpieza.

- SIGTERM (15) - Esta señal se utiliza para indicar a un proceso que se cierre limpiamente.

- SIGSTOP (19) - Esta señal se utiliza para detener un proceso.

- SIGTSTP (20) - Esta señal se utiliza para suspender un proceso, similar a Ctrl+Z en la terminal.

- SIGCONT (18) - Esta señal se utiliza para reanudar la ejecución de un proceso que ha sido detenido o suspendido.

- SIGUSR1 (10) - Esta señal se utiliza para que un proceso realice una acción definida por el usuario.

- SIGUSR2 (12) - Esta señal se utiliza para que un proceso realice otra acción definida por el usuario.

## 71. Init, demonios y servicios

### Init

En Linux, Init es el proceso principal o padre que se ejecuta al inicio del sistema operativo y es el encargado de iniciar todos los demás procesos y servicios. El proceso init tiene un ID de proceso (PID) de 1 y es el primer proceso que se inicia durante el arranque del sistema.

El proceso Init es responsable de la gestión del cambio de nivel de ejecución (runlevel) del sistema, que se refiere a un estado específico del sistema operativo que determina qué servicios, procesos y configuraciones están activos o inactivos en un momento dado.

El sistema Init en Linux ha evolucionado a lo largo del tiempo. Inicialmente, el sistema usaba el SysV Init, que utiliza scripts de inicio almacenados en diferentes directorios para iniciar procesos y servicios. Sin embargo, en versiones más recientes de Linux, se ha adoptado el sistema systemd, que es un init system más moderno y avanzado que reemplaza a SysV Init y proporciona una gestión de servicios más rápida y eficiente.

En resumen, el proceso Init en Linux es el proceso principal que se encarga de iniciar todos los demás procesos y servicios y de gestionar el nivel de ejecución del sistema. Es un componente crítico del sistema operativo que asegura que todo funcione correctamente desde el inicio del sistema.

### Demonio

En Linux, un demonio (también conocido como servicio o daemon en inglés) es un programa que se ejecuta en segundo plano de forma continua, sin la necesidad de una interacción directa con el usuario. Los demonios son programas diseñados para realizar tareas específicas en el sistema, como gestionar servicios de red, realizar tareas de mantenimiento, enviar correos electrónicos, realizar copias de seguridad, etc.

Los demonios se ejecutan independientemente de la sesión de usuario y no están asociados con una ventana gráfica ni con un terminal. Estos programas se ejecutan automáticamente al inicio del sistema y continúan funcionando hasta que se detienen manualmente o se apaga el sistema.

Algunos ejemplos de demonios populares en Linux son: el servidor web Apache, el servidor de correo Postfix, el servidor de bases de datos MySQL, el demonio de impresión CUPS, entre otros.

### Servicios

En el contexto de Linux, un servicio es un programa que se ejecuta en segundo plano y proporciona una funcionalidad específica a otros programas o usuarios del sistema. Por ejemplo, un servicio podría ser un servidor web que proporciona contenido web a los usuarios o un servicio de base de datos que almacena y administra los datos del sistema.

La diferencia entre un servicio y un demonio es que los servicios suelen ser programas que se ejecutan automáticamente al iniciar el sistema y que proporcionan una funcionalidad específica, mientras que los demonios son procesos que se ejecutan en segundo plano y realizan tareas periódicas o continuas sin intervención del usuario.

Los servicios se administran en el sistema utilizando herramientas como el comando systemctl, que permite iniciar, detener y reiniciar servicios en el sistema. Los demonios, por otro lado, suelen ser administrados mediante scripts de inicio del sistema, que se ejecutan automáticamente al inicio del sistema y que controlan el comportamiento del demonio.

## 72. Gestión de servicios: init.d, systemctl, service

### init.d

El directorio "init.d" en Linux es un directorio que contiene los scripts de inicio de los servicios en el sistema. Estos scripts suelen ser escritos en shell y son utilizados para iniciar, detener o reiniciar servicios del sistema operativo.

Los scripts en el directorio "init.d" son ejecutados por el sistema init, que es el primer proceso que se ejecuta al iniciar el sistema. El sistema init es responsable de iniciar todos los procesos y servicios necesarios para que el sistema operativo funcione correctamente.

Los scripts en el directorio "init.d" suelen tener nombres que comienzan con la letra "S" o "K". Los scripts que comienzan con la letra "S" son ejecutados al iniciar el sistema y se utilizan para iniciar servicios. Los scripts que comienzan con la letra "K" son ejecutados al detener el sistema y se utilizan para detener servicios.

Para listar los servicios que se están ejecutando en el sistema, se puede utilizar el comando "service" en sistemas basados en systemd o el comando "chkconfig" en sistemas basados en SysVinit. También se puede listar los servicios utilizando el comando "ps" y buscando los procesos correspondientes a los servicios en ejecución.

```bash
javier@javier-machine:/etc/init.d$ ./apparmor status
● apparmor.service - Load AppArmor profiles
     Loaded: loaded (/lib/systemd/system/apparmor.service; enabled; vendor preset: enabled)
     Active: active (exited) since Tue 2023-04-18 11:47:04 CEST; 4 days ago
       Docs: man:apparmor(7)
             https://gitlab.com/apparmor/apparmor/wikis/home/
    Process: 947 ExecStart=/lib/apparmor/apparmor.systemd reload (code=exited, status=0/SUCCESS)
   Main PID: 947 (code=exited, status=0/SUCCESS)
        CPU: 70ms

abr 18 11:47:04 javier-machine systemd[1]: Starting Load AppArmor profiles...
abr 18 11:47:04 javier-machine apparmor.systemd[947]: Restarting AppArmor
abr 18 11:47:04 javier-machine apparmor.systemd[947]: Reloading AppArmor profiles
abr 18 11:47:04 javier-machine apparmor.systemd[983]: Skipping profile in /etc/apparmor…logd
abr 18 11:47:04 javier-machine systemd[1]: Finished Load AppArmor profiles.
Hint: Some lines were ellipsized, use -l to show in full.

```

### Systemctl

systemctl es un comando utilizado en sistemas operativos Linux modernos, como Ubuntu, CentOS, Fedora, y otros, que permite la administración de los servicios del sistema, así como el control del sistema, unidades de sockets, dispositivos y otros objetos del sistema.

Con systemctl podemos iniciar, detener, reiniciar, habilitar y deshabilitar servicios del sistema. También permite obtener información sobre los servicios, ver su estado y registro de eventos.

Por ejemplo, para iniciar el servicio Apache en Ubuntu, utilizamos el comando:

```bash
sudo systemctl start apache2
```

Este comando iniciará el servicio Apache. Para detener el servicio, podemos usar:

```bash
sudo systemctl stop apache2
```

Para reiniciar el servicio, podemos utilizar:

```bash
sudo systemctl restart apache2
```

Además, podemos habilitar el servicio para que se inicie automáticamente al arrancar el sistema con el siguiente comando:

```bash
sudo systemctl enable apache2
```

Para listar los servicios en ejecución, podemos usar:

```bash
sudo systemctl list-units --type=service
```

Esto nos dará una lista de todos los servicios que están actualmente en ejecución.

## 73. Las seis etapas del proceso de arranque de Linux

En general, los sistemas basados en Linux siguen un proceso de arranque en seis etapas, también conocidas como niveles de ejecución (runlevels). A continuación se describen brevemente las seis etapas:

Nivel de ejecución 0: se utiliza para detener el sistema. Al cambiar al nivel 0, se detienen todos los servicios y se apaga el sistema.

Nivel de ejecución 1: también conocido como modo monousuario. Se utiliza para realizar tareas de mantenimiento, reparación y diagnóstico. En este nivel, solo se inicia un shell de root y no se ejecutan servicios en segundo plano.

Nivel de ejecución 2: modo multiusuario sin soporte de red. Este nivel es similar al nivel de ejecución 3, pero no inicia los servicios de red.

Nivel de ejecución 3: modo multiusuario con soporte de red. En este nivel, se inician todos los servicios necesarios para ejecutar un sistema Linux completamente funcional, incluidos los servicios de red.

Nivel de ejecución 4: este nivel no se utiliza de manera predeterminada en la mayoría de las distribuciones de Linux. Los usuarios y administradores pueden personalizar este nivel según sea necesario.

Nivel de ejecución 5: modo gráfico o entorno de escritorio. Este nivel inicia un entorno gráfico para que los usuarios puedan interactuar con el sistema a través de una interfaz gráfica de usuario (GUI).

Es importante tener en cuenta que estos niveles pueden variar ligeramente según la distribución de Linux y su configuración.

## 74. Apagado del sistema: halt, poweroff, reboot, shutdown

Los comandos halt, poweroff, reboot y shutdown se utilizan en Linux para apagar o reiniciar el sistema. Aunque todos estos comandos realizan acciones similares, tienen diferencias sutiles entre sí.

halt: detiene el sistema operativo y lo deja en un estado en el que la energía puede ser apagada de forma segura. Los procesos y servicios se detienen y el sistema no se reinicia automáticamente. Ejemplo:

```bash
sudo halt
```

poweroff: detiene el sistema operativo y apaga la alimentación del sistema, lo que significa que la energía se corta de inmediato. Los procesos y servicios se detienen y el sistema no se reinicia automáticamente. Ejemplo:

```bash
sudo poweroff
```

reboot: detiene el sistema operativo y lo reinicia automáticamente. Todos los procesos y servicios se detienen y el sistema se reinicia. Ejemplo:

```bash
sudo reboot
```

shutdown: detiene el sistema operativo y proporciona un mensaje al usuario indicando que el sistema se apagará o reiniciará. Los procesos y servicios se detienen y el sistema se apaga o reinicia según las opciones especificadas.

```bash
sudo shutdown -h now
```

La opción -h indica que se debe apagar el sistema, y now indica que se debe hacer de inmediato.

En resumen, halt y poweroff apagan el sistema sin reiniciarlo, reboot reinicia el sistema y shutdown proporciona opciones para apagar o reiniciar el sistema con un mensaje al usuario.

## 75. Cambio de prioridad: nice, renice

En Linux, los procesos tienen una prioridad que determina su posición en la cola de planificación del sistema. La prioridad se representa mediante un número entero conocido como "valor nice", que varía de -20 (la prioridad más alta) a +19 (la prioridad más baja). Por defecto, los procesos se ejecutan con una prioridad de 0.

El comando nice se utiliza para cambiar la prioridad de un proceso en ejecución o para iniciar un nuevo proceso con una prioridad diferente. Por ejemplo, para iniciar un nuevo proceso con una prioridad de -10, se podría ejecutar el siguiente comando:

```bash
nice -n -10 comando
```

El comando renice se utiliza para cambiar la prioridad de un proceso que ya está en ejecución. Por ejemplo, para cambiar la prioridad del proceso con PID 1234 a -5, se podría ejecutar el siguiente comando:

```bash
renice -n -5 1234
```

Es importante tener en cuenta que el cambio de prioridad puede afectar al rendimiento del sistema, por lo que es recomendable utilizarlo con cuidado y solo en situaciones específicas en las que se necesita ajustar el rendimiento.

Además, es importante destacar que el cambio de prioridad solo puede ser realizado por usuarios con permisos de administrador (root).

## 76. Caso práctico
