#!/bin/bash
# Skrip Konfigurasi APT Mirror Indonesia (Data Utama / UGM)

echo "[*] Mengonfigurasi /etc/apt/sources.list ke mirror lokal Indonesia..."

# Backup sources.list lama
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Menulis konfigurasi mirror Data Utama (atau sesuaikan dengan UGM: repo.ugm.ac.id)
cat << 'EOF' > /etc/apt/sources.list
deb https://kartolo.sby.datautama.net.id/ubuntu/ focal main restricted universe multiverse
deb https://kartolo.sby.datautama.net.id/ubuntu/ focal-updates main restricted universe multiverse
deb https://kartolo.sby.datautama.net.id/ubuntu/ focal-security main restricted universe multiverse
EOF

echo "[*] Memperbarui daftar paket (apt-get update)..."
apt-get update -y
echo "[+] Konfigurasi mirror selesai!"
