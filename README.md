# classroom
Выполнение одной или нескольких команд на группе компьютеров через SSH:

for i in `seq 13 17`; do ssh root@192.168.0.$i 'reboot'; done

Пример, обновление системы, установка Pov-Ray. Передаются параметры – enable-upgrade (разрешить обновление системы) и -y (согласится с установкой необходимых пакетов):
for i in `seq 3 17`; do ssh root@192.168.0.$i 'apt-get update && apt-get upgrade --enable-upgrade -y && apt-get install povray -y'; done

Та же команда, вместо IP адреса имя сервера:
for i in `seq 1 15`; do ssh root@student-$i.local 'apt-get update && apt-get upgrade --enable-upgrade -y && apt-get autoclean'; done


Скачать и установить PyCharm Community:
for i in `seq 1 15`; do ssh root@student-$i.local 'epm play pycharm'; done

for i in `seq 1 15`; do ssh user@student-$i.local 'cd /opt/pycharm-*/bin && sh pycharm.sh'; done

Установка среды разработки программного обеспечения (Geany):

apt-get install -y geany geany-plugins geany-plugins-common

Установка виртуального принтера Boomaga (поиск замены Bullzip PDF Printer):

apt-get install boomaga

после установки пакета из репозитория не работает печать из Okular - ошибка виртуального принтера, нужно разбираться как исправить

Настройка внешнего вида приложений GTK (Synaptic, Geany):

apt-get install -y plasma5-kde-gtk-config gtk-theme-breeze gtk-theme-breeze-education


Установка двухпанельного файлового менеджера (Krusader):

sudo apt-get update && sudo apt-get install -y kde5-krusader kde5-kget kdiff3 kde5-krename arj unarj lha unace mlocate

"Сменить рабочий стол" для пользователя:

ssh root@ip 'machinectl shell student@ /usr/bin/qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript \'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "/usr/share/wallpapers/MOS-new-year-2/contents/images/1920x1080.png")}\''

Установка архиватора RAR:

Для работы с RAR-архивами нужны утилиты rar для создания архивов и unrar для распаковки. Установить архиватор средствами стандартного пакетного менеджера нельзя , поэтому для установки проприетарной версии можно воспользоваться другим способом.

Скачиваем с официального сайта архив с бинарными файлами и извлекаем из него файлы rar и unrar, далее копируем их, например, в /usr/bin/, либо производим установку:

wget https://www.rarlab.com/rar/rarlinux-x64-612.tar.gz
tar xzf rarlinux-x64-612.tar.gz
cd rar
make install

Команда make install выполнит следующие действия согласно содержимому файла makefile:

mkdir -p /usr/local/bin
mkdir -p /usr/local/lib
cp rar unrar /usr/local/bin
cp rarfiles.lst /etc
cp default.sfx /usr/local/lib

Источник: https://firstvds.ru/technology/rabota-s-arkhivami-v-linux

Установка графического интерфейса к архиваторам (Ark):

sudo apt-get update && sudo apt-get install -y kde5-ark kde5-ark-common

Установка среды разработки (Kdevelop):

sudo apt-get install kdevelop5 kdevelop-pg-qt

Добавить пользователя (test):

useradd -m -G uucp,proc,cdrom,floppy,cdwriter,audio,radio,scanner,xgrp,video,camera,vboxusers test && usermod -p "" test

Удалить пользователя test с удалением каталога:

userdel -rf test


Размытые иконки в системном трее (нет решения):

Приложения часто используют библиотеку appindicator для добавления иконок в трей. Если они отображаются размытыми, проверьте установленную версию библиотеки в системе. В случае, если установлен только пакет libappindicator-gtk2, попробуйте также установить libappindicator-gtk3.
Разлогинить пользователя:

pkill -KILL -t tty1

Сделать паузу в скриптах:

sleep 30s

где:
s: секунды
m: минуты
h: часы
d: дни
С командой sleep можно использовать больше одного аргумента. Если два или больше чисел, задержка будет соответствовать их сумме.

Онлайн компилятор:

https://www.onlinegdb.com/online_pascal_compiler

Деление в Python:

https://all-python.ru/osnovy/delenie.html


KDE ассоциации с типами файлов:

https://www.linux.org.ru/forum/desktop/1717901

Что лучше использовать как аналог paint?
KolourPaint? Даже в учебнике Босовой по информатике он берется как аналог:


Вопрос по белым прометеивским доскам. В винде решение через реестр отключающий сенсорику. А в М ОС как её отключить? Не будет ли это влиять на сенсор мышки у ноута?:
Попробуйте так:
# apt-get remove xorg-drv-libinput
# apt-get install xinput

Введите 
xinput
И посмотрите как называется панель. Скопируйте название и вставьте полное название в файл ниже в MatchProduct

# kde5 kate /etc/X11/xorg.conf.d/99-calibration.conf

Вставьте:

Section "InputClass"
        Identifier      "calibration"
        MatchProduct    "TimeLink Inc. Multitouch TN86XX-AFSA0-r5 FW-v6.4.49.42 20 Po"
        Option "FingerLow" "5"
        Option "FingerHigh" "30"
EndSection

Заработает после перезагрузки. Попробуйте подбирать параметр FingerLow (после каждого изменения перезагрузить). Чем больше число тем меньше чувствительность (требуется большее пятно от пальца для реакции)
