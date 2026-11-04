echo "==> Mengatur Zona Waktu ke Asia/Jakarta..."
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

echo "==> Mengganti Repositori ke Mirror Indonesia (UGM)..."
cat <<EOF > /etc/apt/sources.list
deb http://mirror.ugm.ac.id/ubuntu/ noble main restricted universe multiverse
deb http://mirror.ugm.ac.id/ubuntu/ noble-updates main restricted universe multiverse
deb http://mirror.ugm.ac.id/ubuntu/ noble-backports main restricted universe multiverse
deb http://mirror.ugm.ac.id/ubuntu/ noble-security main restricted universe multiverse
EOF

apt-get update