# Section 11. Packages

## 95. Gestión de paquetes

Explicaicón conceptual

## 96. Buscar, instalar y actualizar paquetes

### dpkg

El comando dpkg es una herramienta de gestión de paquetes en sistemas operativos basados en Debian, como Ubuntu. Permite instalar, desinstalar y administrar paquetes de software de forma individual. El archivo de paquete se encuentra en formato .deb y contiene información sobre los archivos del programa y cómo deben ser instalados en el sistema.

A continuación se muestran algunos ejemplos de cómo usar el comando dpkg:

Para instalar un paquete:

```bash
sudo dpkg -i nombre_del_paquete.deb
```

Para desinstalar un paquete:

```bash
sudo dpkg -r nombre_del_paquete
```

Para ver información sobre un paquete:

```bash
dpkg -s nombre_del_paquete
```

Para listar todos los paquetes instalados:

```bash
dpkg -l
```

Para buscar un paquete instalado:

```bash
dpkg -l | grep nombre_del_paquete
```

Es importante destacar que el comando dpkg no resuelve automáticamente las dependencias de los paquetes. Si se intenta instalar un paquete que depende de otros paquetes, dpkg mostrará un error. En estos casos, se recomienda utilizar herramientas como apt-get o aptitude, que resuelven las dependencias de forma automática.

### apt

APT (Advanced Package Tool) is a package management system used in various Linux distributions, including Ubuntu. It provides a command-line interface to manage software packages, including installation, upgrading, and removal.

Here are some key aspects of APT:

Package Repositories: APT uses package repositories to retrieve software packages. These repositories contain a collection of packages maintained by the distribution or third-party sources.

Package Index: APT maintains an index of available packages and their dependencies, which enables efficient package management.

Package Operations: APT provides commands to perform various operations on packages, such as:

apt-get: Used to install, upgrade, or remove packages. For example, apt-get install <package> installs a package, apt-get update updates the package index, and apt-get remove <package> removes a package.

apt-cache: Used to query package information from the local package cache. For example, apt-cache search <keyword> searches for packages containing a specific keyword, and apt-cache show <package> displays detailed information about a package.

Dependency Resolution: APT automatically resolves dependencies when installing or upgrading packages. It ensures that all required dependencies are satisfied, downloading and installing them if needed.

Repository Management: APT allows you to manage repositories, including adding, removing, or updating them. The configuration files for repositories are located in the /etc/apt/sources.list directory.

Updates and Upgrades: APT provides mechanisms for updating the package index and upgrading installed packages. The apt-get update command refreshes the package index, while apt-get upgrade upgrades installed packages to their latest available versions.

APT simplifies the process of managing software packages in Linux by providing a unified and powerful command-line interface. It helps users easily install, update, and remove software, ensuring efficient and reliable package management.

### Diferencias

DPKG and APT are both package management tools used in Debian-based Linux distributions, but they serve different purposes and have different functionalities. Here are the main differences between DPKG and APT:

DPKG (Debian Package): DPKG is the low-level package management tool that directly handles the installation, removal, and management of individual package files (.deb). It is a command-line tool that operates at the package level and doesn't resolve dependencies automatically.

DPKG commands: Some common DPKG commands include dpkg -i <package.deb> to install a package, dpkg -r <package> to remove a package, and dpkg -L <package> to list the files installed by a package.
APT (Advanced Package Tool): APT is a higher-level package management system that builds upon DPKG. It provides a user-friendly command-line interface and includes additional features like dependency resolution, automatic package retrieval from repositories, and package version tracking.

APT commands: APT uses commands like apt-get, apt-cache, and apt-add-repository to manage packages. For example, apt-get install <package> installs a package and resolves its dependencies, apt-cache search <keyword> searches for packages, and apt-add-repository adds a new repository.
Dependency Resolution: APT automatically resolves package dependencies by retrieving and installing all required packages. It ensures that the necessary dependencies are satisfied before installing or upgrading a package. DPKG, on the other hand, doesn't handle dependency resolution and relies on the user to manually install the required dependencies.

Package Retrieval: APT can retrieve packages from software repositories defined in /etc/apt/sources.list. It connects to remote repositories over the network, downloads packages, and installs them. DPKG, on the other hand, relies on pre-downloaded package files (.deb) and doesn't have built-in network support.

Higher-level Functionality: APT provides additional features like package version tracking, automatic updates, upgrade management, and repository management. It simplifies package management tasks by automating many common operations.

In summary, DPKG is the low-level package management tool responsible for handling individual package files, while APT is a higher-level package management system that builds upon DPKG and provides additional functionality like dependency resolution, package retrieval from repositories, and higher-level package management operations. APT is more user-friendly and widely used for day-to-day package management in Debian-based systems.

### sudo-apt-update

El comando sudo apt update se utiliza en sistemas Linux basados en Debian, como Ubuntu, para actualizar la lista de paquetes disponibles en los repositorios configurados en el sistema. A continuación se explica su funcionamiento con un ejemplo:

Ejecutar sudo apt update:

```bash
$ sudo apt update
```

El comando se ejecuta con privilegios de superusuario utilizando sudo para garantizar los permisos necesarios.

El sistema se conecta a los repositorios configurados en el archivo /etc/apt/sources.list y en los archivos dentro del directorio /etc/apt/sources.list.d/.

El sistema comprueba si hay actualizaciones disponibles para los paquetes que se encuentran en los repositorios. Esto implica verificar si hay nuevas versiones de los paquetes o si hay cambios en la estructura de los repositorios.

Si se encuentran actualizaciones, se descarga y se actualiza la lista local de paquetes disponibles en el sistema. Esto permitirá que el sistema pueda conocer las últimas versiones de los paquetes y sus dependencias.

Se muestra en la salida del comando el progreso de la actualización y cualquier mensaje relevante, como información sobre nuevos repositorios agregados o actualizaciones realizadas.

Una vez completada la actualización, el sistema está listo para utilizar el comando sudo apt upgrade o sudo apt dist-upgrade para instalar las actualizaciones disponibles en el sistema.

Es importante destacar que el comando sudo apt update no realiza actualizaciones de paquetes en sí mismo, solo actualiza la lista local de paquetes disponibles. Para instalar las actualizaciones, se debe utilizar el comando sudo apt upgrade o sudo apt dist-upgrade.

Recuerda que es recomendable ejecutar periódicamente sudo apt update para mantener la lista de paquetes actualizada y poder instalar las últimas versiones y correcciones de seguridad en el sistema.

### apt

Aquí tienes una explicación de los principales comandos de apt:

apt update: Actualiza la lista de paquetes disponibles en los repositorios configurados en el sistema. Este comando no instala ni actualiza los paquetes en sí, solo actualiza la información sobre las últimas versiones disponibles. Se ejecuta de la siguiente manera:

```bash
$ sudo apt update
```

apt upgrade: Actualiza los paquetes instalados en el sistema a sus últimas versiones disponibles. Si hay nuevas versiones de los paquetes, se descargan y se instalan. Se recomienda ejecutar apt update antes de apt upgrade para asegurarse de tener la información de la última versión de los paquetes. Se ejecuta de la siguiente manera:

```bash
$ sudo apt upgrade
```

apt install: Instala uno o varios paquetes en el sistema. Puedes especificar el nombre de un paquete o una lista de paquetes separados por espacio. apt se encargará de resolver las dependencias necesarias y descargar e instalar los paquetes solicitados. Se ejecuta de la siguiente manera:

```bash
$ sudo apt install nombre_paquete
```

apt search: Busca paquetes disponibles en los repositorios configurados según los términos de búsqueda proporcionados. Puedes utilizar palabras clave o patrones de búsqueda para encontrar paquetes relacionados. apt mostrará una lista de paquetes que coincidan con los términos de búsqueda. Se ejecuta de la siguiente manera:

```bash
$ apt search término_de_búsqueda
```

Estos son solo algunos ejemplos de los comandos más utilizados en apt. Hay otros comandos disponibles, como apt remove para desinstalar paquetes, apt autoremove para eliminar paquetes huérfanos, entre otros. Puedes consultar la documentación oficial o ejecutar apt --help para obtener más información y opciones sobre cada comando.

### 97. Instalación manual de paquetes

### 98. Eliminar, listar y buscar paquetes

### 99. Actualizar la distro

### 100. Añadir repositorios de paquetes
