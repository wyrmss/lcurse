#!/bin/bash

echo
echo "Instalando dependencias..."
echo
# Instalar las dependencias
sudo zypper ar  http://download.opensuse.org/repositories/home:/aboe76/openSUSE_Tumbleweed/ home:aboe76
sudo zypper refresh
sudo zypper in python3-pipenv python3-sip python3-qt5 git

echo
echo "Descargando el repositorio"
echo
git clone https://github.com/ephraim/lcurse.git
mv -i lcurse/ /home/$USER/bin/lcurse
cd /home/$USER/bin/lcurse
echo

# Pedir confirmación
while true; do
echo
read -p "¿Quiere realizar la instalación? " yn
case $yn in
si ) break;;
no ) exit;;
* ) echo "por favor responda si o no";;
esac
done

echo
echo "Si se ejecuta esto es que aceptaste"
echo
# Hacer una pausa hasta dar intro
echo "Presiona una tecla para continuar...";
read 
echo

echo "Instalando el programa..."
echo
pipenv install
echo
#Crear lanzador
echo "[Desktop Entry]
Comment[es_ES]=Guion de Python para tener un cliente compatible de "curse" para linux
Comment=Guion de Python para tener un cliente compatible de "curse" para linux
Exec=pipenv   run  ./lcurse
GenericName[es_ES]=Gestor de complementos de WoW
GenericName=Gestor de complementos de WoW
Icon=/home/$USER/bin/lcurse/media/icon.ico
MimeType=
Name[es_ES]=lcurse
Name=lcurse
Path=/home/$USER/bin/lcurse
StartupNotify=true
Terminal=true
TerminalOptions=\s--noclose
Type=Application
X-DBUS-ServiceName=
X-DBUS-StartupType=none
X-KDE-SubstituteUID=false
X-KDE-Username=" >> /home/$USER/Escritorio/lcurse

echo "Instalación terminada, se lanzara el programa."
echo
echo "Presiona una tecla para continuar...";
read 

# Ejecutar el programa
pipenv run ./lcurse
