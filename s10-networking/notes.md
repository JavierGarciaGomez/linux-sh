# Section 10. Networking

## 79. Interfaces de red

### ip command

El comando ip es una herramienta de línea de comandos en Linux que se utiliza para configurar y mostrar la información de red. Es una herramienta de utilidad para la gestión de redes y dispositivos de red en Linux. El comando ip es muy potente y versátil, y permite realizar una amplia variedad de operaciones relacionadas con la red.

A continuación se presentan algunos de los usos más comunes del comando ip:

Mostrar la información de configuración de red: ip address show o ip addr show. Esto muestra la información detallada sobre todas las interfaces de red configuradas en el sistema, incluyendo la dirección IP, la máscara de red, la dirección MAC y más.

Configurar la dirección IP de una interfaz de red: ip address add <address/mask> dev <interface>. Esto configura la dirección IP y la máscara de red de una interfaz de red específica.

Eliminar la dirección IP de una interfaz de red: ip address del <address/mask> dev <interface>. Esto elimina la dirección IP y la máscara de red de una interfaz de red específica.

Mostrar la información de enrutamiento: ip route show. Esto muestra la información de la tabla de enrutamiento actual, incluyendo las rutas predeterminadas y las rutas específicas.

Configurar una ruta específica: ip route add <destination> via <gateway> dev <interface>. Esto agrega una nueva ruta a la tabla de enrutamiento, especificando la dirección de destino, la puerta de enlace y la interfaz de red a utilizar.

Eliminar una ruta específica: ip route del <destination> via <gateway> dev <interface>. Esto elimina una ruta específica de la tabla de enrutamiento.

Configurar la tabla de enrutamiento predeterminada: ip route add default via <gateway>. Esto configura la ruta predeterminada para todas las conexiones salientes en el sistema.

Estos son solo algunos ejemplos de los usos del comando ip. El comando es muy potente y se puede utilizar para realizar muchas otras operaciones de red. Para obtener más información sobre el uso del comando ip, se puede consultar la página de manual usando man ip.

```bash
ip --help
Usage: ip [ OPTIONS ] OBJECT { COMMAND | help }
       ip [ -force ] -batch filename
where  OBJECT := { address | addrlabel | fou | help | ila | ioam | l2tp | link |
                   macsec | maddress | monitor | mptcp | mroute | mrule |
                   neighbor | neighbour | netconf | netns | nexthop | ntable |
                   ntbl | route | rule | sr | tap | tcpmetrics |
                   token | tunnel | tuntap | vrf | xfrm }
       OPTIONS := { -V[ersion] | -s[tatistics] | -d[etails] | -r[esolve] |
                    -h[uman-readable] | -iec | -j[son] | -p[retty] |
                    -f[amily] { inet | inet6 | mpls | bridge | link } |
                    -4 | -6 | -M | -B | -0 |
                    -l[oops] { maximum-addr-flush-attempts } | -br[ief] |
                    -o[neline] | -t[imestamp] | -ts[hort] | -b[atch] [filename] |
                    -rc[vbuf] [size] | -n[etns] name | -N[umeric] | -a[ll] |
                    -c[olor]}
```

### ip link (ip l)

#### help

```bash
ip link help
Usage: ip link add [link DEV | parentdev NAME] [ name ] NAME
		    [ txqueuelen PACKETS ]
		    [ address LLADDR ]
		    [ broadcast LLADDR ]
		    [ mtu MTU ] [index IDX ]
		    [ numtxqueues QUEUE_COUNT ]
		    [ numrxqueues QUEUE_COUNT ]
		    type TYPE [ ARGS ]

	ip link delete { DEVICE | dev DEVICE | group DEVGROUP } type TYPE [ ARGS ]

	ip link set { DEVICE | dev DEVICE | group DEVGROUP }
			[ { up | down } ]
			[ type TYPE ARGS ]
		[ arp { on | off } ]
		[ dynamic { on | off } ]
		[ multicast { on | off } ]
		[ allmulticast { on | off } ]
		[ promisc { on | off } ]
		[ trailers { on | off } ]
		[ carrier { on | off } ]
		[ txqueuelen PACKETS ]
		[ name NEWNAME ]
		[ address LLADDR ]
		[ broadcast LLADDR ]
		[ mtu MTU ]
		[ netns { PID | NAME } ]
		[ link-netns NAME | link-netnsid ID ]
		[ alias NAME ]
		[ vf NUM [ mac LLADDR ]
			 [ vlan VLANID [ qos VLAN-QOS ] [ proto VLAN-PROTO ] ]
			 [ rate TXRATE ]
			 [ max_tx_rate TXRATE ]
			 [ min_tx_rate TXRATE ]
			 [ spoofchk { on | off} ]
			 [ query_rss { on | off} ]
			 [ state { auto | enable | disable} ]
			 [ trust { on | off} ]
			 [ node_guid EUI64 ]
			 [ port_guid EUI64 ] ]
		[ { xdp | xdpgeneric | xdpdrv | xdpoffload } { off |
			  object FILE [ section NAME ] [ verbose ] |
			  pinned FILE } ]
		[ master DEVICE ][ vrf NAME ]
		[ nomaster ]
		[ addrgenmode { eui64 | none | stable_secret | random } ]
		[ protodown { on | off } ]
		[ protodown_reason PREASON { on | off } ]
		[ gso_max_size BYTES ] | [ gso_max_segs PACKETS ]

	ip link show [ DEVICE | group GROUP ] [up] [master DEV] [vrf NAME] [type TYPE]

	ip link xstats type TYPE [ ARGS ]

	ip link afstats [ dev DEVICE ]
	ip link property add dev DEVICE [ altname NAME .. ]
	ip link property del dev DEVICE [ altname NAME .. ]

	ip link help [ TYPE ]

TYPE := { bareudp | bond | bond_slave | bridge | bridge_slave |
          dummy | erspan | geneve | gre | gretap | ifb |
          ip6erspan | ip6gre | ip6gretap | ip6tnl |
          ipip | ipoib | ipvlan | ipvtap |
          macsec | macvlan | macvtap |
          netdevsim | nlmon | rmnet | sit | team | team_slave |
          vcan | veth | vlan | vrf | vti | vxcan | vxlan | wwan |
          xfrm }

```

#### Usage

```bash
ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp9s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 24:4b:fe:49:2c:94 brd ff:ff:ff:ff:ff:ff
3: wlp8s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DORMANT group default qlen 1000
    link/ether b8:9a:2a:74:65:c6 brd ff:ff:ff:ff:ff:ff
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
    link/ether 02:42:62:f6:be:14 brd ff:ff:ff:ff:ff:ff
```

#### Explanation

¡Claro! El comando ip link es una herramienta que te permite manipular interfaces de red en Linux. Es especialmente útil para administrar conexiones de red en sistemas que utilizan múltiples interfaces.

Con el comando ip link, puedes ver una lista de todas las interfaces de red en tu sistema Linux y su estado actual. Para hacerlo, simplemente ejecuta el comando ip link show o ip link list en la terminal:

```bash
$ ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 08:00:27:bb:62:e8 brd ff:ff:ff:ff:ff:ff
3: wlp0s20f3: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DORMANT group default qlen 1000
    link/ether 80:70:1f:f7:12:11 brd ff:ff:ff:ff:ff:ff
```

Este resultado muestra tres interfaces de red:

- lo: la interfaz de loopback, que se utiliza para la comunicación local en el sistema.
- enp0s3: la interfaz Ethernet que está activa y tiene una dirección MAC 08:00:27:bb:62:e8.
- wlp0s20f3: una interfaz inalámbrica que está inactiva en este momento.

Con el comando ip link, también puedes cambiar el estado de una interfaz de red. Por ejemplo, para activar una interfaz de red, ejecuta el siguiente comando:

```bash
$ sudo ip link set enp0s3 up
```

Este comando activará la interfaz Ethernet enp0s3. Si quieres desactivar la interfaz, utiliza el comando sudo ip link set enp0s3 down.

Además de eso, también puedes utilizar el comando ip link para agregar o eliminar interfaces de red, cambiar sus configuraciones, configurar VLANs, entre otras cosas.

Espero que esta explicación te haya sido útil para entender cómo funciona el comando ip link en Linux.

#### ip -s link

El comando ip -s link en Linux muestra estadísticas detalladas de las interfaces de red del sistema. El resultado incluye información sobre la cantidad de bytes y paquetes transmitidos y recibidos a través de cada interfaz.

Aquí te dejo un ejemplo del comando ip -s link show ejecutado en una máquina Ubuntu:

```bash
ip -s link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    RX:  bytes packets errors dropped  missed   mcast
      33486098  446411      0       0       0       0
    TX:  bytes packets errors dropped carrier collsns
      33486098  446411      0       0       0       0
2: enp9s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 24:4b:fe:49:2c:94 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast
             0       0      0       0       0       0
    TX:  bytes packets errors dropped carrier collsns
             0       0      0       0       0       0
3: wlp8s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DORMANT group default qlen 1000
    link/ether b8:9a:2a:74:65:c6 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast
    2984090938 3095718      0       0       0       0
    TX:  bytes packets errors dropped carrier collsns
     401701953 1369579      0       0       0       0
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
    link/ether 02:42:62:f6:be:14 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast
             0       0      0       0       0       0
    TX:  bytes packets errors dropped carrier collsns
             0       0      0       0       0       0
```

En este ejemplo, se muestran dos interfaces de red: la interfaz de loopback lo y la interfaz Ethernet enp0s3. Junto a cada interfaz se muestran estadísticas detalladas de transmisión y recepción, incluyendo el número de bytes y paquetes recibidos y transmitidos.

La opción -s indica que queremos ver las estadísticas y detalles adicionales de cada interfaz de red. En resumen, el comando ip -s link es una herramienta útil para diagnosticar y monitorear el tráfico de red en Linux.

#### ip l ls up

El comando ip l ls up es una abreviatura de ip link list up en Linux.

ip es el comando para configurar y mostrar la red en Linux.
link se refiere a la capa 2 de la red, que se ocupa de la comunicación entre dispositivos de red en una red local (LAN).
list es la opción para mostrar información sobre las interfaces de red.
up es la opción para mostrar solo las interfaces de red que están activas (es decir, que se han activado con la opción up).
Por lo tanto, al ejecutar el comando ip l ls up, se mostrará una lista de todas las interfaces de red que están activas en el sistema.

Aquí hay un ejemplo de la salida del comando en una máquina Ubuntu:

```bash
$ ip l ls up
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
```

En este ejemplo, la interfaz de loopback (lo) y la interfaz Ethernet (enp0s3) están activas y, por lo tanto, se muestran en la salida del comando. La opción UP indica que ambas interfaces están activadas. Además, la salida muestra información adicional sobre cada interfaz, como el tamaño máximo de transmisión de unidad (mtu), el algoritmo de encolamiento utilizado (qdisc) y el estado actual de la interfaz (state).

#### ip l set {nw} down

Para desactivar una interfaz de red en Linux, podemos usar el comando ip con la opción link set seguida del nombre de la interfaz y la opción down. Por ejemplo, si queremos desactivar la interfaz Ethernet eth0, podemos ejecutar el siguiente comando:

```bash
sudo ip link set eth0 down
```

Este comando desactivará la interfaz eth0.

La utilidad de desactivar una interfaz de red puede ser variada. Por ejemplo, puede ser útil para solucionar problemas de conectividad de red, como un conflicto de direcciones IP o problemas de enrutamiento. También puede ser útil en situaciones en las que se requiere cambiar la configuración de red de un sistema, como cambiar la dirección IP de una interfaz de red.

Otra posible utilidad es para la seguridad de la red. Si una interfaz de red no está en uso, desactivarla puede ayudar a evitar ataques a la red desde esa interfaz. Por lo tanto, si una interfaz de red no se utiliza o no se necesita, es recomendable desactivarla para mejorar la seguridad de la red.

En general, es importante tener en cuenta que la desactivación de una interfaz de red puede interrumpir la conectividad de red de un sistema, por lo que se debe hacer con precaución y solo cuando sea necesario.

## 80. Direcciones IP

### Diferencias ip a e ip link

`ip a` y `ip link` son dos comandos diferentes que se utilizan para mostrar información de configuración de red en Linux.

`ip a` muestra la información de la capa 3 de la red, es decir, información sobre las direcciones IP de las interfaces de red, incluyendo la dirección IP, la máscara de red, la dirección MAC y otros detalles relacionados con la configuración de la capa 3 de la red.

Por otro lado, `ip link` muestra la información de la capa 2 de la red, es decir, información sobre las interfaces de red, incluyendo el nombre de la interfaz, el estado actual (activado/desactivado), el tipo de interfaz (Ethernet, loopback, etc.), y otros detalles relacionados con la configuración de la capa 2 de la red.

Entonces, la diferencia principal entre ip a y ip link es que el primero muestra información de la capa 3 de la red (direcciones IP), mientras que el segundo muestra información de la capa 2 de la red (interfaces de red).

En resumen, ip a es útil para mostrar información relacionada con las direcciones IP, mientras que ip link es útil para mostrar información relacionada con las interfaces de red.

### ip a usage

```bash
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp9s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 24:4b:fe:49:2c:94 brd ff:ff:ff:ff:ff:ff
3: wlp8s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether b8:9a:2a:74:65:c6 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.209/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp8s0
       valid_lft 85951sec preferred_lft 85951sec
    inet6 2a0c:5a81:d602:2b00:6df2:a984:3f97:8ff0/64 scope global mngtmpaddr noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fe80::810f:1f74:771c:2b3a/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:62:f6:be:14 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
```

### ip a content

El comando ip a se utiliza para mostrar la información de configuración de las interfaces de red en un sistema Linux. Esta información incluye las direcciones IP, las máscaras de red y otras configuraciones relacionadas con la capa de red (capa 3 del modelo OSI). A continuación se muestra un ejemplo de la salida del comando ip a:

```bash
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
inet 127.0.0.1/8 scope host lo
valid_lft forever preferred_lft forever
inet6 ::1/128 scope host
valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
link/ether 52:54:00:d4:85:d4 brd ff:ff:ff:ff:ff:ff
inet 192.168.1.10/24 brd 192.168.1.255 scope global dynamic eth0
valid_lft 3540sec preferred_lft 3540sec
inet6 fe80::5054:ff:fed4:85d4/64 scope link
valid_lft forever preferred_lft forever
Cada sección de la salida de ip a se refiere a una interfaz de red en el sistema. En este ejemplo, se muestran dos interfaces de red: lo (que representa la interfaz de bucle local) y eth0 (que representa una interfaz Ethernet). A continuación se explica el contenido de cada sección:
```

1. El primer número es el índice de la interfaz de red.
2. El nombre de la interfaz de red.
3. La información del estado de la interfaz, como si está activa o no (UP o DOWN), si está conectada o no (LOWER_UP o LOWER_DOWN), si es una interfaz de difusión (BROADCAST) y si es una interfaz multicast (MULTICAST).
4. La MTU de la interfaz, que representa la máxima cantidad de datos que se pueden transmitir a través de la interfaz en una sola transmisión.
5. El qdisc (disciplina de cola) utilizado para la interfaz, que determina cómo se manejan los paquetes entrantes y salientes en la cola de la interfaz.
6. El estado de la interfaz (state), que puede ser UNKNOWN, UP o DOWN.
7. El grupo (group) al que pertenece la interfaz.
8. La longitud de la cola (qlen) de la interfaz.
9. La información de la capa 2 de la interfaz, como la dirección MAC (link/ether) y la dirección de difusión (brd).
10. La información de la capa 3 de la interfaz, como la dirección IP (inet) y la máscara de red, junto con la dirección de difusión (brd).
11. La validez (valid_lft) y la preferencia (preferred_lft) de la dirección IP, es decir, cuánto tiempo se utilizará la dirección IP y cuál es la preferencia

## 82. Routing

En Linux, el routing es el proceso mediante el cual se determina la ruta que debe seguir un paquete de red desde su origen hasta su destino a través de una o varias redes interconectadas. El routing se basa en la tabla de routing del sistema, que contiene información sobre las redes y las rutas disponibles.

La tabla de routing se compone de varias entradas, cada una de las cuales describe una red o un host, junto con la interfaz de red que se utiliza para llegar a ese destino y la métrica de esa ruta. La métrica se utiliza para determinar la mejor ruta en caso de que haya varias rutas posibles para llegar a un destino.

Cuando un paquete de red llega a una interfaz de red en el sistema, se examina la dirección de destino del paquete y se busca en la tabla de routing para determinar la mejor ruta para enviar el paquete. Si se encuentra una ruta, el paquete se envía a través de la interfaz de red especificada en la tabla de routing. Si no se encuentra una ruta, el paquete se descarta.

El comando "ip route" se utiliza para ver y configurar la tabla de routing del sistema en Linux. También se puede utilizar el comando "route" para ver la tabla de routing, aunque este comando está siendo reemplazado por "ip route".

### Traceroute

El comando traceroute en Linux es una herramienta de diagnóstico de red que se utiliza para rastrear la ruta que sigue un paquete de datos desde un host de origen a un host de destino. Esta herramienta permite identificar los puntos de enrutamiento de la red donde se producen retrasos, errores o fallos en la transmisión de los paquetes.

El funcionamiento del comando traceroute se basa en el envío de paquetes con un TTL (Time to Live) decreciente, que se van reenviando de nodo en nodo hasta que llegan al host de destino. Cada nodo en la ruta envía un mensaje ICMP (Internet Control Message Protocol) al host de origen indicando que el paquete ha sido recibido y, a continuación, el host de origen utiliza esta información para reconstruir la ruta que ha seguido el paquete.

El comando traceroute se ejecuta desde la línea de comandos y se utiliza con la sintaxis "traceroute [opciones] host". Algunas de las opciones más comunes son:

-n: muestra las direcciones IP en lugar de los nombres de host
-m max_ttl: especifica el número máximo de saltos que se pueden realizar antes de que el paquete sea descartado
-w timeout: especifica el tiempo de espera máximo para recibir una respuesta de cada nodo en la ruta
El resultado de la ejecución de traceroute es una lista de nodos que muestra la dirección IP o el nombre de host de cada nodo en la ruta seguida por el paquete, el tiempo de respuesta de cada nodo y la dirección IP del host de origen y de destino.

En resumen, el comando traceroute es una herramienta útil para diagnosticar problemas en la conexión de red entre dos hosts, ya que permite identificar los nodos que están causando problemas y evaluar el rendimiento de la red.

### useCase

```bash
javier@javier-machine:~$ sudo traceroute -T www.google.es
traceroute to www.google.es (216.58.209.67), 30 hops max, 60 byte packets
 1  _gateway (192.168.1.1)  0.982 ms  4.359 ms  4.472 ms
 2  10.0.0.1 (10.0.0.1)  4.611 ms  4.721 ms  4.838 ms
 3  172.16.8.33 (172.16.8.33)  6.649 ms  6.637 ms  6.626 ms
 4  10.220.115.238 (10.220.115.238)  15.599 ms  15.589 ms 10.220.101.202 (10.220.101.202)  10.751 ms
 5  81.196.118.208 (81.196.118.208)  10.910 ms 10.220.107.40 (10.220.107.40)  21.410 ms  21.400 ms
 6  81.196.118.208 (81.196.118.208)  21.801 ms 91.232.81.211 (91.232.81.211)  8.217 ms 74.125.119.226 (74.125.119.226)  8.331 ms
 7  74.125.242.177 (74.125.242.177)  9.465 ms  10.430 ms  10.422 ms
 8  74.125.242.177 (74.125.242.177)  21.222 ms  21.618 ms  21.610 ms
 9  142.250.46.167 (142.250.46.167)  20.662 ms  20.654 ms waw02s06-in-f67.1e100.net (216.58.209.67)  9.700 ms
```

Este es un resultado del comando traceroute que muestra la ruta que los paquetes de red están tomando para llegar al servidor web de Google (www.google.es) desde tu computadora. En este caso, el comando traceroute está enviando paquetes con una técnica de sondeo para medir los tiempos de respuesta y obtener información de los enrutadores o nodos de red intermedios que se encuentran en la ruta hacia el servidor.

El resultado muestra los saltos (hops) que los paquetes realizan, desde tu gateway (puerta de enlace) hasta llegar a la dirección IP del servidor de Google. Cada línea muestra el número de salto, la dirección IP del nodo de red intermedio y el tiempo de respuesta en milisegundos. El tiempo de respuesta aumenta a medida que se avanza en la ruta y se agregan más saltos y más tiempo de procesamiento.

En general, la información que proporciona el comando traceroute es útil para depurar problemas de conexión a Internet y para optimizar la configuración de red, ya que permite identificar dónde pueden ocurrir cuellos de botella o retrasos en la red.

## 83. Sniffers: wireshark y tcpdump

En Linux, un sniffer es un programa que se utiliza para capturar y analizar el tráfico de red. Los sniffers se utilizan a menudo para diagnosticar problemas de red, detectar actividades sospechosas en la red, y para monitorear el tráfico de red en tiempo real. Un sniffer puede capturar todo el tráfico de red que pasa a través de un adaptador de red determinado, o se puede configurar para capturar sólo ciertos tipos de tráfico, como el tráfico de correo electrónico, el tráfico de Web, o el tráfico de VoIP. Los sniffers pueden ser programas de línea de comandos o programas con interfaces gráficas de usuario, y pueden tener diversas funcionalidades como filtros de paquetes, estadísticas de tráfico y decodificación de protocolos. Los sniffers también se conocen como analizadores de protocolos o sniffers de paquetes.

### wireshark y tcpdump

Wireshark y tcpdump son herramientas de análisis de red utilizadas en sistemas operativos Linux y otros sistemas operativos. Ambas herramientas permiten a los administradores de red examinar el tráfico de red en detalle, lo que puede ser útil para solucionar problemas de red, detectar ataques de seguridad y optimizar el rendimiento de la red.

Wireshark es una herramienta de análisis de red con interfaz gráfica de usuario (GUI) que permite a los usuarios capturar y examinar el tráfico de red en tiempo real o desde archivos de captura previamente guardados. Wireshark es muy popular y ampliamente utilizado debido a su funcionalidad y facilidad de uso.

Tcpdump, por otro lado, es una herramienta de línea de comando que captura y examina el tráfico de red. A diferencia de Wireshark, tcpdump no tiene una interfaz gráfica de usuario y solo muestra los datos capturados en la terminal. Aunque tcpdump puede ser más difícil de usar que Wireshark, es una herramienta muy poderosa y flexible que es muy útil para la solución de problemas de red avanzados.

Ambas herramientas son ampliamente utilizadas por los administradores de red y los profesionales de seguridad de la información para analizar el tráfico de red y detectar posibles problemas y amenazas.

## 84. Examinando la red ping y Nmap

### Explicación general

El comando ping es una herramienta muy útil para comprobar si una computadora o un dispositivo de red (como un router o un servidor) está en línea y es accesible a través de la red. La utilidad básica de ping es enviar paquetes de datos a una dirección IP específica y esperar una respuesta. Si la respuesta llega en un tiempo determinado, se considera que el dispositivo está en línea y responde a las solicitudes. Si no se recibe ninguna respuesta, se considera que el dispositivo no está disponible o no está respondiendo.

Por ejemplo, para comprobar la conectividad a un servidor web en la dirección IP 192.168.1.10, puedes usar el siguiente comando:

```bash
ping 192.168.1.10
```

Si el servidor web está en línea y responde a las solicitudes de ping, deberías ver una salida similar a esta:

```bash
PING 192.168.1.10 (192.168.1.10) 56(84) bytes of data.
64 bytes from 192.168.1.10: icmp_seq=1 ttl=64 time=0.637 ms
64 bytes from 192.168.1.10: icmp_seq=2 ttl=64 time=0.479 ms
64 bytes from 192.168.1.10: icmp_seq=3 ttl=64 time=0.422 ms
...
```

En cambio, si el servidor web no responde a las solicitudes de ping, es posible que veas un mensaje similar a este:

```bash

PING 192.168.1.10 (192.168.1.10) 56(84) bytes of data.
From 192.168.1.11 icmp_seq=1 Destination Host Unreachable
From 192.168.1.11 icmp_seq=2 Destination Host Unreachable
From 192.168.1.11 icmp_seq=3 Destination Host Unreachable
...
```

Por otro lado, **`nmap`** es una herramienta que se utiliza para escanear redes y descubrir los dispositivos y servicios que se ejecutan en ellas. nmap se utiliza principalmente para detectar los puertos abiertos en una computadora o dispositivo de red, lo que indica qué servicios están disponibles en esa máquina. Esto puede ser útil para fines de seguridad y administración de redes, ya que permite identificar y solucionar problemas de conectividad y configuración de red.

Por ejemplo, para escanear una red y detectar los dispositivos que están en línea, puedes usar el siguiente comando:

```bash
nmap -sP 192.168.1.0/24
```

Este comando enviará un paquete de solicitud a todas las direcciones IP en la red 192.168.1.x y esperará una respuesta. Si un dispositivo está en línea, responderá con un mensaje que nmap registrará. La salida del comando puede ser similar a la siguiente:

```bash
Starting Nmap 7.60 ( https://nmap.org ) at 2023-05-03 11:50 CDT
Nmap scan report for 192.168.1.1
Host is up (0.0027s latency).
Nmap scan report for 192.168.1.2
Host is up (0.0061s latency).
Nmap scan report for 192.168.1.10
Host is up (0.0057s latency).
Nmap scan report for 192.168.1.12
Host is up (0.011
```

### failure and succesful request

Succesful

```bash
ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=3.11 ms
64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=3.36 ms
64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=0.973 ms
^C
--- 192.168.1.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 0.973/2.481/3.361/1.071 ms
```

```bash
ping 192.168.1.2
PING 192.168.1.2 (192.168.1.2) 56(84) bytes of data.
From 192.168.1.209 icmp_seq=1 Destination Host Unreachable
From 192.168.1.209 icmp_seq=2 Destination Host Unreachable
From 192.168.1.209 icmp_seq=3 Destination Host Unreachable
^C
--- 192.168.1.2 ping statistics ---
4 packets transmitted, 0 received, +3 errors, 100% packet loss, time 3071ms
pipe 3
```

### nmap

```bash
javier@javier-machine:~$ sudo nmap -sS 192.168.1.0/24
Starting Nmap 7.80 ( https://nmap.org ) at 2023-04-29 13:02 CEST
Nmap scan report for _gateway (192.168.1.1)
Host is up (0.0034s latency).
Not shown: 991 closed ports
PORT      STATE    SERVICE
21/tcp    open     ftp
22/tcp    filtered ssh
23/tcp    filtered telnet
53/tcp    open     domain
80/tcp    open     http
443/tcp   open     https
2601/tcp  open     zebra
49152/tcp open     unknown
49153/tcp open     unknown
MAC Address: FC:22:F4:06:91:60 (Unknown)

Nmap scan report for 192.168.1.163
Host is up (0.030s latency).
All 1000 scanned ports on 192.168.1.163 are filtered
MAC Address: 70:2C:09:EB:7A:75 (Nintendo)

Nmap scan report for 192.168.1.167
Host is up (0.030s latency).
All 1000 scanned ports on 192.168.1.167 are filtered
MAC Address: B8:8A:60:90:1D:6B (Intel Corporate)

Nmap scan report for 192.168.1.193
Host is up (0.0041s latency).
All 1000 scanned ports on 192.168.1.193 are closed
MAC Address: 82:DE:36:49:78:2F (Unknown)

Nmap scan report for 192.168.1.210
Host is up (0.054s latency).
All 1000 scanned ports on 192.168.1.210 are closed
MAC Address: 84:E6:57:67:5A:1F (Unknown)

Nmap scan report for javier-machine (192.168.1.209)
Host is up (0.0000070s latency).
All 1000 scanned ports on javier-machine (192.168.1.209) are closed

Nmap done: 256 IP addresses (6 hosts up) scanned in 47.35 seconds

```

## 85. DHCP y DNS

DHCP (Dynamic Host Configuration Protocol) y DNS (Domain Name System) son dos tecnologías fundamentales en el funcionamiento de redes de computadoras.

DHCP es un protocolo que se encarga de asignar de manera dinámica direcciones IP a dispositivos de una red. En lugar de configurar manualmente una dirección IP en cada dispositivo, DHCP automatiza este proceso, lo que hace que sea mucho más fácil y rápido configurar una red. Cuando un dispositivo se conecta a una red con DHCP habilitado, el servidor DHCP asigna automáticamente una dirección IP disponible en el rango de direcciones que se ha configurado.

Por otro lado, DNS es un sistema que permite traducir nombres de dominio, como www.ejemplo.com, en direcciones IP, como 192.168.1.1. En lugar de tener que recordar direcciones IP complejas, los usuarios pueden simplemente escribir nombres de dominio que son más fáciles de recordar. Cuando un usuario escribe un nombre de dominio en su navegador web, el servidor DNS resuelve la dirección IP correspondiente y permite al usuario conectarse al servidor de la página web.

En resumen, DHCP se encarga de asignar direcciones IP y DNS se encarga de traducir nombres de dominio en direcciones IP. Ambos son importantes en el funcionamiento de redes de computadoras y permiten que los dispositivos se comuniquen entre sí y con los servidores de internet de manera efectiva.

## 86. curl y wget

### curl

Curl es una herramienta de línea de comandos que se utiliza para transferir datos desde y hacia un servidor, utilizando diferentes protocolos de red, como HTTP, FTP, SMTP, etc.

Por ejemplo, si deseas obtener el contenido de una página web, puedes usar curl de la siguiente manera:

```bash
curl https://www.ejemplo.com
```

Este comando enviará una solicitud HTTP GET al servidor de ejemplo.com y recibirá la respuesta en la línea de comandos. Si deseas guardar la respuesta en un archivo, puedes agregar el parámetro -o seguido del nombre del archivo de salida:

```bash
curl https://www.ejemplo.com -o respuesta.html
```

En este ejemplo, la respuesta de la solicitud HTTP GET será guardada en un archivo llamado respuesta.html. Puedes usar la opción -O (mayúscula) en lugar de -o (minúscula) para guardar el archivo con el mismo nombre que el recurso solicitado en la URL.

También puedes enviar datos a un servidor utilizando el método HTTP POST. Por ejemplo, para enviar un formulario HTML con dos campos llamados "nombre" y "email", puedes hacer lo siguiente:

```bash
curl -X POST -d "nombre=Juan&email=juan@example.com" https://www.ejemplo.com/procesar.php
```

Este comando enviará una solicitud HTTP POST al archivo procesar.php en el servidor de ejemplo.com, con los datos del formulario en el cuerpo de la solicitud.

### wget

El comando wget es una herramienta de línea de comandos que permite descargar archivos desde Internet utilizando el protocolo HTTP, HTTPS y FTP. Aquí te dejo un ejemplo de cómo usar el comando wget:

Supongamos que queremos descargar un archivo llamado "archivo.zip" que se encuentra en la siguiente URL: https://ejemplo.com/archivo.zip

Para descargar este archivo, abrimos una terminal y escribimos el siguiente comando:

```bash
wget https://ejemplo.com/archivo.zip
```

Esto descargará el archivo "archivo.zip" en el directorio actual. Si queremos descargarlo en un directorio específico, podemos usar la opción "-P" seguida de la ruta del directorio. Por ejemplo:

```bash
wget -P /home/javier/descargas https://ejemplo.com/archivo.zip
```

Esto descargará el archivo "archivo.zip" en el directorio "/home/javier/descargas".

Además, el comando wget tiene muchas opciones que permiten personalizar la descarga, como por ejemplo:

"-c" para reanudar la descarga interrumpida de un archivo.
"-r" para descargar de forma recursiva todo un sitio web.
"-np" para no subir a un nivel superior al descargar de forma recursiva un sitio web.
"-q" para ejecutar wget en modo silencioso, sin mostrar mensajes en la terminal.
Espero que esto te haya ayudado a entender cómo usar el comando wget.

## 87. Conexiones remotas ssh

Las conexiones remotas SSH (Secure Shell) son una forma segura de conectarse a un servidor o dispositivo de red a través de una red, como Internet. SSH permite a los usuarios iniciar sesión y trabajar en el servidor o dispositivo remoto como si estuvieran físicamente presentes en él.

Para conectarse a un servidor remoto a través de SSH, necesitarás una aplicación cliente SSH, como PuTTY en Windows o la terminal en Linux y macOS. Luego, deberás conocer la dirección IP del servidor y las credenciales de inicio de sesión, como un nombre de usuario y contraseña o una clave privada SSH.

Una vez que te hayas conectado a través de SSH, podrás ejecutar comandos y realizar tareas en el servidor remoto, transferir archivos entre el servidor y tu computadora local, y más. La conexión SSH cifra todo el tráfico entre tu computadora y el servidor remoto, lo que significa que la información que envías y recibes está protegida de posibles ataques de hackers o interceptaciones no autorizadas.

## 88. Intercambio de ficheros (FTP)

FTP (File Transfer Protocol) es un protocolo utilizado para transferir archivos de un sistema a otro a través de una red, como Internet. En Linux, existen varios servidores FTP disponibles, tales como vsftpd, proftpd, y pure-ftpd, entre otros.

Para utilizar FTP en Linux, debemos instalar un cliente de FTP en nuestra máquina y conectarnos a un servidor FTP. Podemos utilizar el cliente de línea de comandos "ftp" o un cliente gráfico como FileZilla.

Para conectarnos a un servidor FTP con el cliente de línea de comandos "ftp", primero debemos abrir una terminal y escribir "ftp" seguido del nombre del servidor FTP al que queremos conectarnos. Por ejemplo:

```bash
ftp ftp.example.com
```

Luego, se nos pedirá que ingresemos nuestro nombre de usuario y contraseña para autenticarnos en el servidor FTP. Una vez autenticados, podemos utilizar una serie de comandos de FTP para transferir archivos entre nuestra máquina y el servidor FTP.

Algunos de los comandos más comunes de FTP son:

ls: muestra una lista de los archivos y directorios en el directorio actual del servidor FTP.
cd: cambia el directorio actual del servidor FTP.
get: descarga un archivo del servidor FTP y lo guarda en nuestra máquina.
put: sube un archivo de nuestra máquina al servidor FTP.
bye: cierra la conexión FTP.
Es importante tener en cuenta que FTP no es un protocolo seguro, ya que la información de autenticación y los archivos transferidos se envían en texto plano a través de la red. Por lo tanto, se recomienda utilizar SFTP (Secure File Transfer Protocol) o FTPS (FTP sobre SSL) para transferencias de archivos seguras.

## 89. SFTP

SFTP (Secure File Transfer Protocol) es un protocolo de transferencia de archivos seguro que se utiliza para transferir archivos de forma segura entre sistemas remotos. A diferencia del FTP tradicional, que transmite información en texto plano y es vulnerable a ataques de sniffing, el SFTP utiliza una conexión cifrada y autenticación de claves públicas/privadas para proteger los datos de la transferencia.

SFTP utiliza el mismo puerto que SSH (22) y, como resultado, requiere que el servidor remoto tenga un servidor SSH instalado y configurado. Una vez que se establece la conexión SFTP, se puede transferir archivos de forma segura entre el cliente y el servidor remoto.

Para utilizar SFTP en Linux, se puede utilizar la herramienta de línea de comandos "sftp", que viene con la mayoría de las distribuciones de Linux. Para conectarse a un servidor SFTP remoto, simplemente se debe ingresar el comando "sftp" seguido del nombre de usuario y la dirección IP o nombre de host del servidor remoto. Luego, se puede interactuar con el servidor remoto de forma similar a como se hace con un shell de Linux, utilizando comandos como "ls", "cd" y "get" para moverse por el sistema de archivos remoto y transferir archivos de ida y vuelta.

Por ejemplo, para conectarse a un servidor SFTP remoto y transferir un archivo llamado "archivo.txt" desde el servidor remoto al directorio actual del cliente, se puede ingresar los siguientes comandos en la terminal de Linux:

```bash
sftp usuario@direccion_ip_servidor
get archivo.txt
```

El archivo se descargará del servidor y se guardará en el directorio actual del cliente.

### test

```bash
javier@javier-machine:~$ sftp demo@test.rebex.net
The authenticity of host 'test.rebex.net (194.108.117.16)' can't be established.
ED25519 key fingerprint is SHA256:d7Te2DHmvBNSWJNBWik2KbDTjmWtYHe2bvXTMM9lVg4.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added 'test.rebex.net' (ED25519) to the list of known hosts.
(demo@test.rebex.net) Password:
Connected to test.rebex.net.
sftp> ls
pub          readme.txt
```

## 90. Visualizando conexiones activas: SS

### Explicación

"SS" es un comando en la línea de comandos de Linux que permite visualizar las conexiones de red activas en el sistema. El comando "SS" muestra información detallada sobre las conexiones de red TCP y UDP que están abiertas en el sistema, así como el estado actual de esas conexiones.

Al ejecutar el comando "SS" en la terminal de Linux, se muestran varias columnas de información, como el estado de la conexión, la dirección IP y el puerto de origen y destino. También se pueden filtrar los resultados para mostrar solo ciertos tipos de conexiones, como conexiones TCP o UDP.

La utilidad del comando "SS" radica en que permite a los usuarios de Linux monitorear y diagnosticar problemas de red en tiempo real, lo que es útil para la administración del sistema y la resolución de problemas de conectividad.

### ejemplo

```bash
ss
Netid   State        Recv-Q   Send-Q                                                         Local Address:Port                                                       Peer Address:Port                         Process
u_dgr   ESTAB        0        0                                               /run/systemd/journal/dev-log 29820                                                                 * 0
u_seq   ESTAB        0        0                                                                     @253c9 731531                                                                * 731532
u_dgr   ESTAB        0        0                                                /run/systemd/journal/socket 29822                                                                 * 0
u_seq   ESTAB        0        0                                                                     @443d2 703899                                                                * 703900
u_seq   ESTAB        0        0                                                                     @082c2 45418                                                                 * 45419
u_dgr   ESTAB        0        0                                              /run/user/1000/systemd/notify 37626                                                                 * 0
u_seq   ESTAB        0        0                                                                     @569f4 34661                                                                 * 34662
u_seq   ESTAB        0        0                                                                     @4cdac 703896                                                                * 703895
u_seq   ESTAB        0        0                                                                     @716cd 733506                                                                * 733505
u_seq   ESTAB        0        0                                                                     @b77a7 181487                                                                * 181488
u_seq   ESTAB        0        0                                                                     @3cd64 41489                                                                 * 41490
u_seq   ESTAB        0        0                                                                     @1a2e1 180180                                                                * 180179
u_seq   ESTAB        0        0                                                                     @fb122 731533                                                                * 731534
u_seq   ESTAB        0        0                                                                     @6cb13 703895                                                                * 703896
u_seq   ESTAB        0        0                                                                     @c02f7 181485                                                                * 181486
u_seq   ESTAB        0        0                                                                     @98b3f 187831                                                                * 187832
u_seq   ESTAB        0        0                                                                     @f2ca1 34662                                                                 * 34661
```

Cada columna en la salida del comando SS tiene un significado específico:

- Netid: indica el tipo de socket (por ejemplo, u_dgr para socket de datagrama Unix, u_seq para socket de secuencia Unix, tcp para socket TCP, etc.).
- State: el estado de la conexión (por ejemplo, ESTAB para establecido, TIME-WAIT para esperando el tiempo de espera, LISTEN para esperando una conexión, etc.).
- Recv-Q: la cantidad de bytes en cola para ser recibidos.
- Send-Q: la cantidad de bytes en cola para ser enviados.
- Local Address:Port: la dirección IP y el puerto local al que está conectado el socket.
- Peer Address:Port: la dirección IP y el puerto remoto al que está conectado el socket.
- Process: el nombre del proceso asociado con la conexión (si se conoce).

## 91. Netstat

Netstat (network statistics) es una herramienta de línea de comandos que se utiliza para visualizar el estado y las estadísticas de la red en un sistema operativo. El comando netstat muestra una variedad de información sobre las conexiones de red, las tablas de rutas, las estadísticas de la interfaz y más.

Cuando se ejecuta el comando netstat sin argumentos, muestra todas las conexiones activas en el sistema. Por ejemplo:

```bash
$ netstat
```

Muestra una salida similar a esta:

```bash
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 localhost:49773         localhost:mysql         TIME_WAIT
tcp        0      0 localhost:49774         localhost:mysql         TIME_WAIT
```

Cada columna representa diferentes aspectos de las conexiones, aquí te explico cada uno de ellos:

- Proto: El protocolo utilizado (TCP o UDP)
- Recv-Q: La cantidad de datos recibidos y sin leer en bytes.
- Send-Q: La cantidad de datos enviados y no confirmados en bytes.
- Local Address: La dirección IP y puerto del host local.
- Foreign Address: La dirección IP y puerto del host remoto.
- State: El estado de la conexión.
  Además, hay muchos argumentos y opciones que se pueden utilizar con el comando netstat para visualizar información más detallada sobre las conexiones de red.
