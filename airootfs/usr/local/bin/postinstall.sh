#!/bin/bash -e
#
##############################################################################
#
#  PostInstall is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your discretion) any later version.
#
#  PostInstall is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
##############################################################################

 name=$(ls -1 /home)
 REAL_NAME=/home/$name

# genfstab -U / > /etc/fstab

#cp /cinnamon-configs/cinnamon-stuff/bin/* /bin/
#cp /cinnamon-configs/cinnamon-stuff/usr/bin/* /usr/bin/
#cp -r /cinnamon-configs/cinnamon-stuff/usr/share/* /usr/share/

# Making necessary directories
mkdir /home/$name/.config
mkdir /home/$name/.local

# Copying Conf
cp -r acreetion-xfce-configs/.config/* /home/$name/.config/
cp -r acreetion-xfce-configs/.local/* /home/$name/.local/

# Making Autostart Directory
mkdir /home/$name/.config/autostart

#Copying DD to system
cp -r /dd/dd.desktop /home/$name/.config/autostart
cp -r /dd/dd.sh /home/$name/.config/autostart

chown -R $name:$name /home/$name/.config
chown -R $name:$name /middle.png
#mv /middle.png /home/$USER

# Copying bashrc over
cp -r /dd/.bashrc /home/$name/.bashrc
cp -r /dd/.bashrc /root


mv /resolv.conf /etc/resolv.conf
chattr +i /etc/resolv.conf
chattr +i /etc/os-release

cp /archiso.conf /etc/mkinitcpio.conf.d/archiso.conf
