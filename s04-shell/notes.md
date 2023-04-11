# Section 04 Shell

## 9. Shell

## 10. Commands

```bash
javier@javier-machine:~$ clear
```

### Command types

```bash
javier@javier-machine:~$ type type
type is a shell builtin
javier@javier-machine:~$ type cp
cp is /usr/bin/cp
javier@javier-machine:~$ type ls
ls is aliased to `ls --color=auto'

```

### Argumentos y parametros

En el último caso Desktop es el argumento y -lah los parámetros

```bash
javier@javier-machine:~$ ls -l
total 91632
drwxrwxr-x  5 javier javier     4096 abr  5 22:15 code
-rw-rw-r--  1 javier javier      141 abr  5 10:39 cv_debug.log
drwxr-xr-x  2 javier javier     4096 abr  5 09:15 Desktop
drwxr-xr-x  2 javier javier     4096 abr  5 09:15 Documents

javier@javier-machine:~$ ls -lah
total 90M
drwxr-x--- 30 javier javier 4,0K abr  5 12:51 .
drwxr-xr-x  3 root   root   4,0K abr  5 09:07 ..
-rw-------  1 javier javier  12K abr  5 22:22 .bash_history
-rw-r--r--  1 javier javier  220 abr  5 09:07 .bash_logout


javier@javier-machine:~$ ls -lah Desktop
total 8,0K
drwxr-xr-x  2 javier javier 4,0K abr  5 09:15 .
drwxr-x--- 30 javier javier 4,0K abr  5 12:51 ..

```

## 11. Command information: Help man info whatis apropos

### Help

Lo que va entre corchetes es opcional el name es obligatorio y lo que va al final [name ...] es que podemos pedir información simultána acerca de varios comandos.

Luego viene la información de cada opción (parámetros) y al final los argumentos.

```bash
javier@javier-machine:~$ help type
type: type [-afptP] name [name ...]
    Display information about command type.

    For each NAME, indicate how it would be interpreted if used as a
    command name.

    Options:
      -a	display all locations containing an executable named NAME;
    		includes aliases, builtins, and functions, if and only if
    		the `-p' option is not also used
      -f	suppress shell function lookup


javier@javier-machine:~$ type help clear
help is a shell builtin
clear is hashed (/usr/bin/clear)
```

```bash
javier@javier-machine:~$ help help
help: help [-dms] [pattern ...]
    Display information about builtin commands.

    Displays brief summaries of builtin commands.  If PATTERN is
    specified, gives detailed help on all commands matching PATTERN,
    otherwise the list of help topics is printed.

    Options:
      -d	output short description for each topic
      -m	display usage in pseudo-manpage format
      -s	output only a short usage synopsis for each topic matching
    		PATTERN

    Arguments:
      PATTERN	Pattern specifying a help topic

    Exit Status:
    Returns success unless PATTERN is not found or an invalid option is given.

```

A veeces cuando son comandos externos no funciona, pero la mayoría de comandos externos implementa --help como parámetro

```bash
javier@javier-machine:~$ help ls
bash: help: no help topics match `ls'.  Try `help help' or `man -k ls' or `info ls'.
javier@javier-machine:~$ ls --help
Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

Mandatory arguments to long options are mandatory for short options too.

```

### man

javier@javier-machine:~$ type man
man is /usr/bin/man
javier@javier-machine:~$ man ls
javier@javier-machine:~$ man --help
Usage: man [OPTION...] [SECTION] PAGE...

-C, --config-file=FILE use this user configuration file
-d, --debug emit debugging messages
-D, --default reset all options to their default values
--warnings[=WARNINGS] enable warnings from groff

### whatis

```bash
javier@javier-machine:~$ type whatis
whatis is /usr/bin/whatis
javier@javier-machine:~$ whatis whatis
whatis (1)           - display one-line manual page descriptions

```

### info

Pagina interactiva como con man pero mucho más detallada

### apropos

Nos propone comandos a propósito del texto

```bash
avier@javier-machine:~$ apropos directory
adcli (8)            - Tool for performing actions on an Active Directory domain
alphasort (3)        - scan a directory for matching entries
basename (1)         - strip directory and suffix from filenames
bindtextdomain (3)   - set directory containing message catalogs

```

```bash
javier@javier-machine:~$ apropos 'list directory'
dir (1)              - list directory contents
ls (1)               - list directory contents
ntfsls (8)           - list directory contents on an NTFS filesystem
vdir (1)             - list directory contents

```

## 12. Manejo de comandos y expresiones

Usar una barra invertida

```bash
javier@javier-machine:~$ ls \
> -lah Desktop
total 8,0K
drwxr-xr-x  2 javier javier 4,0K abr  5 09:15 .
drwxr-x--- 30 javier javier 4,0K abr  5 23:05 ..
javier@javier-machine:~$

```

Comandos simultáneos

```bash
javier@javier-machine:~$ ls ; cd Desktop/
code          Downloads                               nohup.out  Templates
cv_debug.log  Dropbox                                 Pictures   Videos
Desktop       google-chrome-stable_current_amd64.deb  Public
Documents     Music                                   snap
javier@javier-machine:~/Desktop$

```

&& and ||

```bash
javier@javier-machine:~$ notExistent && ls
notExistent: command not found
javier@javier-machine:~$ notExistent || ls
notExistent: command not found
code          Downloads                               nohup.out  Templates
cv_debug.log  Dropbox                                 Pictures   Videos
Desktop       google-chrome-stable_current_amd64.deb  Public
Documents     Music                                   snap
javier@javier-machine:~$

```

## 13. Shell shortcuts

- Ctrl A: inicio de la linea
- Ctrl E: Fin de la linea
- Ctrl L: clear
- Ctrl P: último comando
- Ctrl R: Busqueda reversa de comandos anteriores
- !: Si no nos acordamos bien
- Flechas arriba abajo
- Alt + . : refeenciar argumento
- !$ lo mismo
- Tab: autocompletar comandos
- Ctrl K : Cortar (util ctrl a ctrl k y luego pegar ctrl y)
- Ruleta deel ratón: copiar y pegar

```bash
javier@javier-machine:~$ !yarn
yarn dev:ngrok
yarn run v1.22.19
error Couldn't find a package.json file in "/home/javier"
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.

javier@javier-machine:~$ cd Desktop
javier@javier-machine:~/Desktop$ !$
Desktop
Desktop: command not found
javier@javier-machine:~/Desktop$
```

## 14. Creando un comando alias

```bash
javier@javier-machine:~$ type clist
bash: type: clist: not found
javier@javier-machine:~$ alias clist='clear; ls'
javier@javier-machine:~$ type clist
clist is aliased to `clear; ls'

TO REMOVE:
unalias clist
```
