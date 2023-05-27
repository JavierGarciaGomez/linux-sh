# Section 14. Compression

## 115. Compressing and uncompressing

La compresión de archivos en Linux es un proceso que reduce el tamaño de los archivos o directorios para ahorrar espacio de almacenamiento y facilitar su transferencia. La compresión se realiza mediante algoritmos de compresión que eliminan redundancias y comprimen los datos.

En Linux, hay varias herramientas de compresión disponibles que permiten comprimir y descomprimir archivos. Algunas de las herramientas de compresión más comunes son:

gzip: Esta es una herramienta popular que utiliza el algoritmo de compresión gzip. Comprime un solo archivo y añade la extensión ".gz" al archivo comprimido. Por ejemplo, para comprimir un archivo llamado "archivo.txt", puedes usar el siguiente comando:

```bash
gzip archivo.txt
```

Esto creará un archivo comprimido llamado "archivo.txt.gz".

bzip2: Esta herramienta utiliza el algoritmo de compresión bzip2. Al igual que gzip, comprime un solo archivo, pero proporciona una mayor relación de compresión a costa de un mayor tiempo de compresión. Puedes comprimir un archivo usando el siguiente comando:

```bash
bzip2 archivo.txt
```

Esto creará un archivo comprimido llamado "archivo.txt.bz2".

zip: Esta herramienta permite comprimir varios archivos y directorios en un único archivo comprimido. Proporciona una compatibilidad amplia y se puede utilizar para crear archivos zip que se pueden extraer en sistemas operativos Windows y otros. Para comprimir un archivo o directorio, puedes usar el siguiente comando:

```bash
zip archivo.zip archivo1.txt directorio1
```

Esto creará un archivo comprimido llamado "archivo.zip" que contiene el archivo "archivo1.txt" y el directorio "directorio1".

tar: Aunque no es una herramienta de compresión en sí misma, se utiliza comúnmente junto con otras herramientas de compresión como gzip o bzip2 para crear archivos comprimidos. El comando tar se utiliza para empaquetar archivos y directorios en un solo archivo, y luego se puede combinar con gzip o bzip2 para comprimirlo. Por ejemplo, para crear un archivo comprimido utilizando gzip, puedes usar el siguiente comando:

```bash
tar czf archivo.tar.gz archivo1.txt directorio1
```

Esto creará un archivo llamado "archivo.tar.gz" que contiene los archivos "archivo1.txt" y el directorio "directorio1" comprimidos con gzip.

Para descomprimir archivos comprimidos, se utilizan comandos específicos para cada formato de compresión. Por ejemplo, para descomprimir un archivo comprimido con gzip, puedes usar el siguiente comando:

```bash
gzip -d archivo.txt.gz
```

Esto descomprimirá el archivo y lo dejará como "archivo.txt".

Recuerda que la elección de la herramienta de compresión depende del formato deseado, la relación de compresión requerida y la compatibilidad con otros sistemas operativos. Puedes consultar la documentación y los manuales de cada herramienta para obtener más información sobre las opciones y características específicas que ofrecen.
