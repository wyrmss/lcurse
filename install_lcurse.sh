#!/bin/bash

# menú
clear
while :
do
echo
echo " Escoja una opción "
echo "1. Instalar dependencias"
echo "2. Instalar"
echo "3. Crear un acceso directo al escritorio"
echo "4. Desinstalar"
echo "5. Salir"
echo -n "Seleccione una opción [1 - 5]"
read opcion
case $opcion in
1) echo "Instalando...:";
echo
echo "Instalando dependencias..."
echo
# Instalar las dependencias
sudo zypper ar  http://download.opensuse.org/repositories/home:/aboe76/openSUSE_Tumbleweed/ home:aboe76
sudo zypper refresh
sudo zypper in python3-pipenv python3-sip python3-qt5 git python3-lxml python3-cfscrape kdelibs4support python3-virtualenv python3-virtualenv-clone
;;

2) echo
echo "Descargando el repositorio";
echo
rm -rf /home/$USER/bin/lcurse/
git clone https://github.com/ephraim/lcurse.git
mv -i lcurse/ /home/$USER/bin/lcurse/
rm /home/$USER/bin/lcurse/Pipfile
cp Pipfile /home/$USER/bin/lcurse/Pipfile

echo
echo "Instalando el programa..."
echo

echo "Si no funciona cambiar en el archivo pipfile a la versión de python de vuestro sistema, intro para continuar"
read
cd /home/$USER/bin/lcurse
pipenv install
echo
echo "Instalación terminada, se lanzara el programa."
echo
echo "Presiona una tecla para continuar...";
read 

# Ejecutar el programa
pipenv run ./lcurse
;;
3) echo "Creando acceso directo";
#Crear lanzador
cp lcurse.desktop /home/$USER/Escritorio/lcurse.desktop
;;
4) pip uninstall pipenv
rm -vrf /home/$USER/.local/share/virtualenvs/
rm -vrf /home/$USER/.lcurse/
rm -vrf /home/$USER/bin/lcurse/
rm -f /home/$USER/Escritorio/lcurse
sudo zypper rr http://download.opensuse.org/repositories/home:/aboe76/openSUSE_Tumbleweed/ home:aboe76
sudo zypper remove python3-pipenv python3-virtualenv python3-virtualenv-clone
sudo zypper refresh
echo
echo "Desinstalación terminada"
exit 1
;;
5) echo "chao";
exit 1;;
*) echo "$opc es una opción invalida. Es tan dificil?";
echo "Presiona una tecla para continuar...";
read foo;;
esac
done
