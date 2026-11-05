#!/bin/bash
set -e
echo "[4/4] Menerapkan UI Minimalis & Mematikan Animasi..."

# 1. Pasang paket tema dan ikon sederhana
DEBIAN_FRONTEND=noninteractive apt-get install -y papirus-icon-theme yaru-theme-gtk yaru-theme-icon

# 2. Buat skema GSettings Override (Matikan animasi & set tema gelap sederhana)
mkdir -p /usr/share/glib-2.0/schemas/
cat <<EOF > /usr/share/glib-2.0/schemas/99_netlab_minimal_ui.gschema.override
[org.gnome.desktop.interface]
gtk-theme='Yaru-dark'
icon-theme='Papirus'
enable-animations=false

[org.gnome.desktop.wm.preferences]
theme='Yaru-dark'

[org.gnome.desktop.background]
color-shading-type='solid'
primary-color='#1E1E2E'
picture-options='none'
EOF

# Kompilasi skema sistem
glib-compile-schemas /usr/share/glib-2.0/schemas/

# 3. Matikan Efek Animasi & Compositor XFCE (Khusus Xubuntu/XFCE)
mkdir -p /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/
cat <<EOF > /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfwm4" version="1.0">
  <property name="general" type="empty">
    <property name="use_compositing" type="bool" value="false"/>
  </property>
</channel>
EOF

# 4. Perbarui identitas distro NetLab OS
cat <<EOF > /etc/os-release
NAME="NetLab OS"
VERSION="1.0 LTS (Network Lab Edition)"
ID=netlab
ID_LIKE=ubuntu
PRETTY_NAME="NetLab OS 1.0 LTS"
EOF

echo "Welcome to NetLab OS 1.0 LTS (Minimal Network UI)" > /etc/issue