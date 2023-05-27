# Este programa parse los resultados de nmap y construye un documento html

TITULO="Resultados nmap"
FECHA_ACTUAL="$(date)"
TIMESTAMP="Informe generado el $FECHA_ACTUAL por el usuario $USERNAME"


nmap_exec () {
    echo "[INFO] Ejecutando nmap en la red $1, por favor espere unos segundos..."
    sudo nmap -sV $1 > $2
    echo "[OK] Fichero $2 generado correctamente"
    return 0
}

generar_html () {
cat <<EOF
<html>
    <head>
        <title>$TITULO</title>
   </head>
  <body>
    <h1>$TITULO</h1>
    <p1>$TIMESTAMP</p1>
  </body>
</html>

EOF
}

#Generamos el reporte raw con nmap
nmap_exec "192.168.239.0/24" "salida_nmap.raw"

# Generamos el reporte con los resultados de nmap en HTML
echo "[INFO] Generando reporte html..."
generar_html > resultados_nmap.html
echo "[OK] Reporte resultados_nmap.html generado correctamente"