# Kickstart file for Kororaa Remix (KDE) x86_64
# To use this for 32bit build, :4,$s/x86_64/i386/g
# and build with 'setarch i686 livecd-creator ...'


%include /home/chris/code/kororaa/kickstart/fedora-live-base.ks

#version=DEVEL
install

#install system from the net, to get latest updates
#url --url=ftp://mirror.internode.on.net/pub/fedora/linux/releases/17/Fedora/x86_64/os/
url --url=ftp://mirror.internode.on.net/pub/fedora/linux/development/17/x86_64/os/

lang en_AU.UTF-8
keyboard us
#network --onboot yes --bootproto dhcp
timezone --utc Australia/Sydney
#rootpw  --iscrypted $6$D8V.j2ICJUxPjPEl$S.OjfjUxpIBfYKEMjSBolPPHGG1wLSIrihg75qvd1K34CUA7KfPC3fIzypVY/A4LSPs8uwG3joDXMiZ6vGaN40
selinux --enforcing
authconfig --enableshadow --passalgo=sha512 --enablefingerprint
firewall --enabled --service=ssh,mdns,ipp-client,samba-client
xconfig --startxonboot
services --enabled=NetworkManager --disabled=abrtd,abrt-ccpp,abrt-oops,abrt-vmcore,capi,iscsi,iscsid,isdn,netfs,network,nfs,nfslock,pcscd,rpcbind,rpcgssd,rpcidmapd,rpcsvcgssd,sendmail,sshd

#Partitioning, for Live CD
part / --size 7178 --fstype ext4


#Partitioning, for virtual machine testing
#clearpart --all --drives=sda
#
#part /boot --fstype=ext4 --size=512
#part pv.EaGFJm-w7pp-JMFF-02sd-ynAj-3bbx-Yj8Kfz --grow --size=512
#
#volgroup system --pesize=32768 pv.EaGFJm-w7pp-JMFF-02sd-ynAj-3bbx-Yj8Kfz
#logvol / --fstype=ext4 --name=root --vgname=system --grow --size=1024 --maxsize=20480
#logvol swap --name=swap --vgname=system --grow --size=1024 --maxsize=2048
#bootloader --location=mbr --driveorder=sda --append="rhgb quiet"

#Repos
repo --name="Adobe Systems Incorporated" --baseurl=http://linuxdownload.adobe.com/linux/x86_64/ --cost=1000
repo --name="Fedora 17 - x86_64" --baseurl=ftp://mirror.internode.on.net/pub/fedora/linux/releases/17/Everything/x86_64/os/ --cost=1000
#repo --name="Fedora 17 - x86_64 - Updates" --baseurl=ftp://mirror.internode.on.net/pub/fedora/linux/updates/17/x86_64/ --cost=1000
repo --name="Fedora 17 - x86_64 - Updates" --baseurl=http://download.fedoraproject.org/pub/fedora/linux/updates/17/x86_64/ --cost=1000
repo --name="Google Chrome" --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64/ --cost=1000
repo --name="Kororaa" --baseurl=file:///home/chris/repos/kororaa/releases/17/x86_64/ --cost=10
#repo --name="Kororaa Testing" --baseurl=file:///home/chris/repos/kororaa/testing/17/x86_64/ --cost=5
#repo --name="Ksplice Uptrack for Fedora" --baseurl=http://www.ksplice.com/yum/uptrack/fedora/17/x86_64/ --cost=1000
repo --name="RPMFusion Free" --baseurl=http://download1.rpmfusion.org/free/fedora/releases/17/Everything/x86_64/os/ --cost=1000
repo --name="RPMFusion Free - Updates" --baseurl=http://download1.rpmfusion.org/free/fedora/updates/17/x86_64/ --cost=1000
repo --name="RPMFusion Non-Free" --baseurl=http://download1.rpmfusion.org/nonfree/fedora/releases/17/Everything/x86_64/os/ --cost=1000
repo --name="RPMFusion Non-Free - Updates" --baseurl=http://download1.rpmfusion.org/nonfree/fedora/updates/17/x86_64/ --cost=1000
repo --name="VirtualBox" --baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/17/x86_64/ --cost=1000

%packages
@admin-tools
@base
@base-x
@british-support
@core
@dial-up
@fonts
@hardware-support
selinux-policy
selinux-policy-targeted
@kde-desktop
@printing

#Needed apparently
kernel
kernel-modules-extra
memtest86+

# grub-efi and grub2 and efibootmgr so anaconda can use the right one on install.
grub-efi
grub2
efibootmgr

#Install 3rd party repo releases
adobe-release
google-chrome-release
#ksplice-uptrack
rpmfusion-free-release
rpmfusion-nonfree-release
virtualbox-release

#Rebranding
-fedora-logos
-fedora-release
-fedora-release-notes
kororaa-extras
kororaa-release
kororaa-logos
#kororaa-package-config-apt
kororaa-release-notes
adwaita-gtk3-theme

#Package for checksumming livecd on boot, installer, memtest
anaconda
isomd5sum

#Extra packages
#add-remove-extras
akmods
apper
backintime-kde
bash-completion
beesu
bluedevil
#bootconf-gui
btrfs-progs
calibre
choqok
cups-pdf
#deja-dup
desktop-backgrounds-basic
dolphin-root-actions
eekboard
elementary-icon-theme
elementary-gtk
expect
firefox
font-manager
fprintd-pam
frei0r-plugins
fuse
gimp
git
#gparted
-gnome-packagekit*
HandBrake-gui
htop
hugin-base
inkscape
jack-audio-connection-kit
java-1.7.0-openjdk
#java-1.7.0-openjdk-plugin
# jockey moved to end to work around selinux issue
jockey
jockey-kde
jockey-selinux
k3b-extras-freeworld
kamoso
kaudiocreator
kdeartwork
kdeartwork-wallpapers
kdebase-workspace-ksplash-themes
-kdeedu-marble
-kdegames
kdegames-minimal
kdenlive
#kde-partitionmanager #broken deps atm
kde-settings
-kde-settings-pulseaudio
kde-settings-ksplash
kde-settings-plasma
kdemultimedia-extras-freeworld
kdeplasma-addons
kipi-plugins
kde-plasma-networkmanagement-openvpn
kde-plasma-networkmanagement-pptp
kdiff3
-kdemultimedia-dragonplayer
konversation
kororaa-settings-kde
#kpackagekit
krename
krusader
libdvdcss
libdvdnav
libdvdread
libimobiledevice
libreoffice-calc
libreoffice-draw
libreoffice-emailmerge
libreoffice-graphicfilter
libreoffice-impress
libreoffice-kde
libreoffice-langpack-en
libreoffice-math
libreoffice-ogltrans
libreoffice-opensymbol-fonts
libreoffice-pdfimport
libreoffice-presenter-screen
libreoffice-report-builder
libreoffice-ure
libreoffice-writer
libreoffice-xsltfilter
linphone
liveusb-creator
mozilla-adblock-plus
mozilla-flashblock
mozilla-oxygen-kde
#mozilla-plasma-notify
mozilla-xclear
mozilla-downthemall
ntp
p7zip
p7zip-plugins
PackageKit-browser-plugin
PackageKit-command-not-found
planner
policycoreutils-gui
polkit-desktop-policy
pybluez
qtcurve-kde4
qtcurve-gtk2
samba
samba-winbind
sane-backends
screen
skanlite
-smolt-firstboot
-synaptic
system-config-lvm
system-config-printer
system-config-printer-kde
vim
vlc
vlc-extras
xine-lib-extras
xine-lib-extras-freeworld
xine-plugin
xorg-x11-apps
xscreensaver-gl-extras
xscreensaver-extras
xscreensaver-base
xorg-x11-resutils
yakuake
yumex
#yum-plugin-fastestmirror
yum-plugin-priorities
yum-plugin-security
yum-updatesd

#Multimedia (KDE will use Xine by default, but also suport Gstreamer)
audacity-freeworld
faac
flac
gstreamer-ffmpeg
gstreamer-plugins-bad
gstreamer-plugins-bad-free
gstreamer-plugins-bad-free-extras
gstreamer-plugins-bad-nonfree
gstreamer-plugins-good
gstreamer-plugins-ugly
kid3
lame
libmpg123
#Miro
PackageKit-gstreamer-plugin
pavucontrol
phonon-backend-vlc
vorbis-tools
xine-lib-extras
xine-lib-extras-freeworld

#Flash deps - new flash meta-rpm should take care of these
#pulseaudio-libs.i686
#alsa-plugins-pulseaudio.i686
#libcurl.i686
#nspluginwrapper.i686

#Development tools for out of tree modules
gcc
kernel-devel
dkms
time

#Out of kernel GPL drivers
#akmod-rt2860
#akmod-rt2870
#akmod-rt3070
#akmod-VirtualBox-OSE
#VirtualBox-OSE-guest
#akmod-wl #(I don't think this is GPLv2!)
#kmod-staging
#mesa-dri-drivers-experimental

%end

#%post --nochroot
#umount $INSTALL_ROOT/var/cache/yum
#%end

%post

echo -e "\n*****\nPOST SECTION\n*****\n"

#Set resolv.conf
echo "nameserver 192.168.28.1" >> /etc/resolv.conf

#Build out of kernel modules (so it's not done on first boot)
echo "****BUILDING AKMODS****"
/usr/sbin/akmods --force

#Import keys
for x in fedora ksplice kororaa livna adobe-linux rpmfusion-free-fedora-14-primary rpmfusion-nonfree-fedora-14-primary rpmfusion-free-fedora-15-primary rpmfusion-nonfree-fedora-15-primary rpmfusion-free-fedora-17-primary rpmfusion-nonfree-fedora-17-primary ; do rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-$x ; done
#Chrome (this should prob just go in the repo file instead)
wget https://dl-ssl.google.com/linux/linux_signing_key.pub
rpm --import linux_signing_key.pub
rm linux_signing_key.pub
#VirtualBox
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
rpm --import oracle_vbox.asc
rm oracle_vbox.asc

#KDE - stop Klipper from starting
sed -i 's/AutoStart:true/AutoStart:false/g' /usr/share/autostart/klipper.desktop

#Start yum-updatesd
systemctl enable yum-updatesd.service

#Update locate database
/usr/bin/updatedb

#Rebuild initrd to remove Generic branding (necessary?)
#/sbin/dracut -f

#Let's run prelink
/usr/sbin/prelink -av -mR -q

# create /etc/sysconfig/desktop (needed for installation)
cat > /etc/sysconfig/desktop <<EOF
DESKTOP="KDE"
DISPLAYMANAGER="KDE"
EOF

# make oxygen-gtk the default GTK+ 2 theme for root (see #683855, #689070)
cat > /root/.gtkrc-2.0 << EOF
include "/usr/share/themes/oxygen-gtk/gtk-2.0/gtkrc"
include "/etc/gtk-2.0/gtkrc"
gtk-theme-name="oxygen-gtk"
EOF

#LiveCD stuff (like creating user) is done by fedora-live-base.ks
#Modify LiveCD stuff, i.e. set autologin, enable installer (this is done in /etc/rc.d/init.d/livesys)
cat >> /etc/rc.d/init.d/livesys << EOF
# make liveuser use KDE
echo "startkde" > /home/liveuser/.xsession
chmod a+x /home/liveuser/.xsession
chown liveuser:liveuser /home/liveuser/.xsession

# set up autologin for user liveuser
sed -i 's/#AutoLoginEnable=true/AutoLoginEnable=true/' /etc/kde/kdm/kdmrc
sed -i 's/#AutoLoginUser=fred/AutoLoginUser=liveuser/' /etc/kde/kdm/kdmrc

# set up user liveuser as default user and preselected user
sed -i 's/#PreselectUser=Default/PreselectUser=Default/' /etc/kde/kdm/kdmrc
sed -i 's/#DefaultUser=johndoe/DefaultUser=liveuser/' /etc/kde/kdm/kdmrc

# show liveinst.desktop on desktop and in menu
sed -i 's/NoDisplay=true/NoDisplay=false/g' /usr/share/applications/liveinst.desktop

# chmod +x ~/Desktop/liveinst.desktop to disable KDE's security warning
chmod +x /usr/share/applications/liveinst.desktop

# copy over the icons for liveinst to hicolor
cp /usr/share/icons/gnome/16x16/apps/system-software-install.png /usr/share/icons/hicolor/16x16/apps/
cp /usr/share/icons/gnome/22x22/apps/system-software-install.png /usr/share/icons/hicolor/22x22/apps/
cp /usr/share/icons/gnome/24x24/apps/system-software-install.png /usr/share/icons/hicolor/24x24/apps/
cp /usr/share/icons/gnome/32x32/apps/system-software-install.png /usr/share/icons/hicolor/32x32/apps/
cp /usr/share/icons/gnome/48x48/apps/system-software-install.png /usr/share/icons/hicolor/48x48/apps/
cp /usr/share/icons/gnome/256x256/apps/system-software-install.png /usr/share/icons/hicolor/256x256/apps/
touch /usr/share/icons/hicolor/

# Set akonadi backend
mkdir -p /home/liveuser/.config/akonadi
cat > /home/liveuser/.config/akonadi/akonadiserverrc << AKONADI_EOF
[%General]
Driver=QSQLITE3
AKONADI_EOF

# Disable the update notifications of kpackagekit
cat > /usr/share/kde-settings/kde-profile/default/share/config/KPackageKit << KPACKAGEKIT_EOF
[CheckUpdate]
autoUpdate=0
interval=0

[Notify]
notifyLongTasks=2
notifyUpdates=0
KPACKAGEKIT_EOF

# Disable the update notifications of apper 
cat > /home/liveuser/.kde/share/config/apper << APPER_EOF
[CheckUpdate]
autoUpdate=0
interval=0
APPER_EOF

# Disable kres-migrator
cat > /usr/share/kde-settings/kde-profile/default/share/config/kres-migratorrc << KRES_EOF
[Migration]
Enabled=false
KRES_EOF

# Disable nepomuk
cat > /usr/share/kde-settings/kde-profile/default/share/config/nepomukserverrc << NEPOMUK_EOF
[Basic Settings]
Start Nepomuk=false

[Service-nepomukstrigiservice]
autostart=false
NEPOMUK_EOF

# don't use prelink on a running KDE live image
#sed -i 's/PRELINKING=yes/PRELINKING=no/' /etc/sysconfig/prelink #this doesn't stop prelink, in fact it forces it to run to undo prelinking (see /etc/sysconfig/prelink)
mv /usr/sbin/prelink /usr/sbin/prelink-disabled
rm /etc/cron.daily/prelink

#un-mute sound card (fixes some issues reported)
amixer set Master 85% unmute 2>/dev/null
amixer set PCM 85% unmute 2>/dev/null
pactl set-sink-mute 0 0
pactl set-sink-volume 0 50000


#Disable screensaver on live system
mkdir -p /home/liveuser/.kde/share/config
cat > /home/liveuser/.kde/share/config/kscreensaverrc << SCREEN_EOF
[ScreenSaver]
Enabled=false
Lock=false
LockGrace=60000
PlasmaEnabled=false
Timeout=60
SCREEN_EOF

#Disable screen lock
cat > /home/liveuser/.kde/share/config/powerdevilrc << LOCK_EOF
[General]
configLockScreen=false
LOCK_EOF

#set permissions
chown -Rf liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser/

# small hack to enable plasma-netbook workspace on boot
if strstr "\`cat /proc/cmdline\`" netbook ; then
   mv /usr/share/autostart/plasma-desktop.desktop /usr/share/autostart/plasma-netbook.desktop
   sed -i 's/desktop/netbook/g' /usr/share/autostart/plasma-netbook.desktop
fi

#disable yumupdatesd on live CD
#service yum-updatesd stop
systemctl stop yum-updatesd.service

#disable jockey from autostarting in live CD
rm /etc/xdg/autostart/jockey*

# Turn off PackageKit-command-not-found in live CD
if [ -f /etc/PackageKit/CommandNotFound.conf ]; then
        sed -i -e 's/^SoftwareSourceSearch=true/SoftwareSourceSearch=false/' /etc/PackageKit/CommandNotFound.conf
fi

# Turn on liveinst file
sed -i s/NoDisplay=true/NoDisplay=false/g /usr/local/share/applications/liveinst.desktop

EOF

#yum check-update
#yum -y update
#yum -y reinstall kororaa-extras kororaa-settings-kde
#yum -y reinstall jockey jockey-kde jockey-selinux
#rm -f /var/log/yum.log

#build yum db
#yum clean all
#yum check-update
#yum -y update
#yum provides */fake123
#rm -f /var/log/yum.log

pkcon get-packages
pkcon get-categories

echo waiting...
sleep 30

#Finally, clean up resolv.conf hack
echo "" > /etc/resolv.conf

%end

#%post --nochroot
#mount --bind /var/cache/yum $INSTALL_ROOT/var/cache/yum
#
#%end
