# Section 05. File System

## 18. File system in Linux.

Tree

```bash
javier@javier-machine:~/code/courses$ tree
.
└── linux-sh
    ├── Indice+curso+Linux.pdf
    ├── README.md
    ├── s04-shell
    │   └── notes.md
    └── s05-fileSystem
        └── notes.md

3 directories, 4 files

```

Tree first level

```bash
javier@javier-machine:~/code/courses$ tree -L 1
.
└── linux-sh

1 directory, 0 files

```

## 19. Navigation

### pwd

```bash
javier@javier-machine:~/code/courses$ pwd
/home/javier/code/courses
javier@javier-machine:~/code/courses$ help pwd
pwd: pwd [-LP]
    Print the name of the current working directory.
```

### ls

```bash
javier@javier-machine:~/code/courses$ ls --help; ls
Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

Mandatory arguments to long options are mandatory for short options too.
-t                         sort by time, newest first; see --time

-l                         use a long listing format

-h, --human-readable       with -l and -s, print sizes like 1K 234M 2G etc.

-a, --all                  do not ignore entries starting with .
```

### cd

```bash
javier@javier-machine:~$ help cd
cd: cd [-L|[-P [-e]] [-@]] [dir]
    Change the shell working directory.

    Change the current directory to DIR.  The default DIR is the value of the
    HOME shell variable.

```

### absolute and relative routes

### shortcuts

cd: without arguments goes to user dir
cd ~: the same
cd -: last working directory

## 21. Ficheros en Linux

## 22. File creation and editors

### mkdir

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ mkdir --help
Usage: mkdir [OPTION]... DIRECTORY...
Create the DIRECTORY(ies), if they do not already exist.
```

Es Case sensitive

### text editors

- pico
- nano
- VIM
- emacs

## 23. File and directory visualization

### file command

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ file myPicoFile.txt
myPicoFile.txt: ASCII text
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ file --help
Usage: file [OPTION...] [FILE...]
Determine type of FILEs.

```

### cat

Volcar la info de un fichero

### more

Similar but by page

### less

More improvement

## 24. File and directory manipulation

### cp

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ cp --help
Usage: cp [OPTION]... [-T] SOURCE DEST
  or:  cp [OPTION]... SOURCE... DIRECTORY
  or:  cp [OPTION]... -t DIRECTORY SOURCE...
Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.
```

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ cp filte.txt file2.txt
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ ls
file2.txt  filte.txt  help  info  myPicoFile.txt  newDirectory
```

### copy full directory -r (recursive)

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ cp -r newDirectory newerDirectory
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ ls
file2.txt  filte.txt  help  info  myPicoFile.txt  newDirectory  newerDirectory

```

### mv (move and/or rename)

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ type mv
mv is hashed (/usr/bin/mv)
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ mv --help
Usage: mv [OPTION]... [-T] SOURCE DEST
  or:  mv [OPTION]... SOURCE... DIRECTORY
  or:  mv [OPTION]... -t DIRECTORY SOURCE...
Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.
```

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ mv newDirectory/
a.txt  b.txt
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ mv newDirectory/a.txt renamed.txt
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ ls
file2.txt  help  myPicoFile.txt  newerDirectory
filte.txt  info  newDirectory    renamed.txt
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ cd newDirectory/
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises/newDirectory$ ls
b.txt
```

Parameters

```bash
  -u, --update                 move only when the SOURCE file is newer
                                 than the destination file or when the
                                 destination file is missing

```

### rm (delete)

Delete, delete simultaneously

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ touch filetodelete
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ rm filetodelete; rm fil
file2.txt     filetodelete  filetodlete   filte.txt
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ rm filetodelete filetodlete
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ ls
file2.txt  help  myPicoFile.txt  newerDirectory
filte.txt  info  newDirectory    renamed.txt
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$
```

Remove a directory rm -r

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ cp newDirectory dirtodelete -r
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ rm dirtodelete
rm: cannot remove 'dirtodelete': Is a directory
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ rm dirtodelete -r
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ ls
file2.txt  help  myPicoFile.txt  newerDirectory
filte.txt  info  newDirectory    renamed.txt
```

Remove -rf: Force the delete

## 25. Search files and directories

### find

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ sudo find / -name b.txt
/home/javier/code/apideck/unify/node_modules/help-me/fixture/dir/a/b.txt
/home/javier/code/apideck/unify/node_modules/pino-pretty/node_modules/help-me/fixture/dir/a/b.txt
/home/javier/code/courses/linux-sh/s04-shell/exercises/newDirectory/b.txt
/home/javier/code/courses/linux-sh/s04-shell/exercises/newerDirectory/b.txt
find: ‘/run/user/1000/doc’: Permission denied
find: ‘/run/user/1000/gvfs’: Permission denied
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$
```

Remove errors 2> /dev/null

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ sudo find / -name b.txt 2> /dev/null
/home/javier/code/apideck/unify/node_modules/help-me/fixture/dir/a/b.txt
/home/javier/code/apideck/unify/node_modules/pino-pretty/node_modules/help-me/fixture/dir/a/b.txt
/home/javier/code/courses/linux-sh/s04-shell/exercises/newDirectory/b.txt
/home/javier/code/courses/linux-sh/s04-shell/exercises/newerDirectory/b.txt
```

more info -ls

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ sudo find / -name b.txt 2> /dev/null -ls
  2129935      0 -rw-rw-r--   1 javier   javier          0 abr  5 21:16 /home/javier/code/apideck/unify/node_modules/help-me/fixture/dir/a/b.txt
  2106412      0 -rw-rw-r--   1 javier   javier          0 abr  5 21:16 /home/javier/code/apideck/unify/node_modules/pino-pretty/node_modules/help-me/fixture/dir/a/b.txt
  1223886      0 -rw-rw-r--   1 javier   javier          0 abr  6 10:35 /home/javier/code/courses/linux-sh/s04-shell/exercises/newDirectory/b.txt
  1486023      0 -rw-rw-r--   1 javier   javier          0 abr  6 10:36 /home/javier/code/courses/linux-sh/s04-shell/exercises/newerDirectory/b.txt

```

current directory .

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ sudo find . -name b.txt 2> /dev/null -ls
  1223886      0 -rw-rw-r--   1 javier   javier          0 abr  6 10:35 ./newDirectory/b.txt
  1486023      0 -rw-rw-r--   1 javier   javier          0 abr  6 10:36 ./newerDirectory/b.txt

```

find by directory name

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ find . -name newDirectory -type d
./newDirectory

```

find files created by user

```bash
javier@javier-machine:~/code/courses/linux-sh/s04-shell/exercises$ find . -name '*' -user javier
.
./filte.txt
./info
./help
./myPicoFile.txt
./newDirectory
./newDirectory/b.txt
./renamed.txt
./newerDirectory
./newerDirectory/b.txt
./newerDirectory/a.txt
./file2.txt

```

## 26. Main folders in Linux
/bin
The /bin directory contains binary executable files that are necessary for the system to function properly. These files are available to all users and include common utilities such as "ls", "cp", and "mkdir".

/boot
The /boot directory contains files necessary for booting the system, including the Linux kernel, initial RAM disk (initrd), and boot loader configuration files.

/dev
The /dev directory contains device files, which represent physical and virtual devices on the system. These files are used to communicate with hardware devices, such as hard drives and network interfaces.

/etc
The /etc directory contains system configuration files. These files control system behavior and settings, such as user accounts, network configuration, and system services.

/home
The /home directory contains user home directories. Each user on the system has a subdirectory within /home that contains their personal files and settings.

/lib
The /lib directory contains shared libraries that are used by system programs and utilities. These libraries provide common functionality and allow programs to share code.

/mnt
The /mnt directory is used as a mount point for temporary file systems, such as external hard drives or network file systems.

/opt
The /opt directory is used for optional software packages. Third-party software may be installed in subdirectories within /opt.

/proc
The /proc directory contains virtual files that represent system processes and system information. These files can be read to obtain information about the system's current state.

/root
The /root directory is the home directory for the root user, which is the superuser with full administrative privileges.

/sbin
The /sbin directory contains binary executable files that are necessary for system administration. These files are typically only available to the root user.

/tmp
The /tmp directory is used for temporary files. Files in /tmp may be deleted automatically by the system, and should not be relied upon for long-term storage.

/usr
The /usr directory contains user binaries, libraries, documentation, and other non-essential files. It is typically mounted as a separate file system.

/var
The /var directory contains variable data files, such as log files, email messages, and printer spools. These files are expected to change in size and content over time.