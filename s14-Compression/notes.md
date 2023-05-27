# Section 13. External drives

## 111. Montar y desmontar dispositivos

En Linux, el montaje y desmontaje de dispositivos se refiere al proceso de conectar y desconectar unidades de almacenamiento, como discos duros, particiones, unidades USB y sistemas de archivos de red, al sistema de archivos para que puedan ser accesibles y utilizables por el sistema operativo.

El montaje de un dispositivo implica asociar físicamente el dispositivo con un punto de montaje en el árbol de directorios del sistema de archivos. Una vez montado, el dispositivo se vuelve accesible a través del punto de montaje, y los archivos y directorios contenidos en él se pueden leer, escribir y manipular.

El desmontaje, por otro lado, es el proceso de desconectar un dispositivo previamente montado del sistema de archivos. Antes de desmontar un dispositivo, es importante asegurarse de que no haya procesos o aplicaciones que estén utilizando archivos en el dispositivo, ya que podría provocar la pérdida de datos o dañar los archivos.

A continuación, te mostraré algunos comandos comunes utilizados para el montaje y desmontaje de dispositivos en Linux:

mount: Este comando se utiliza para montar un dispositivo en un punto de montaje específico. Por ejemplo, para montar una unidad USB en el punto de montaje "/mnt/usb", puedes usar el siguiente comando:

```bash
mount /dev/sdb1 /mnt/usb
```

umount: Este comando se utiliza para desmontar un dispositivo previamente montado. Por ejemplo, para desmontar la unidad USB del punto de montaje "/mnt/usb", puedes usar el siguiente comando:

```bash
umount /mnt/usb
```

fdisk y parted: Estas son herramientas para administrar particiones en discos. Puedes utilizar estos comandos para crear, eliminar o redimensionar particiones en un disco.

blkid: Este comando muestra información sobre los dispositivos de bloque, como UUID, tipo de sistema de archivos, etiqueta, etc. Puede ser útil para identificar el dispositivo que deseas montar.

Es importante tener en cuenta que, en algunos casos, se requieren privilegios de superusuario (administrador) para montar y desmontar dispositivos. Puedes utilizar el comando sudo antes de los comandos mencionados para ejecutarlos con privilegios elevados.

Recuerda que el proceso exacto de montaje y desmontaje de dispositivos puede variar dependiendo del sistema operativo y la distribución de Linux que estés utilizando. Es recomendable consultar la documentación específica de tu distribución o buscar información adicional sobre los comandos y procedimientos específicos para tu caso.
