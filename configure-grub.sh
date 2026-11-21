#!/bin/bash
set -e

echo "[*] Memastikan paket GRUB tersedia..."
apt-get update -y
apt-get install -y grub-pc-bin grub-efi-amd64-bin grub2-common

GRUB_DEFAULT_FILE="/etc/default/grub"
if [ -f "$GRUB_DEFAULT_FILE" ]; then
    echo "[*] Mengatur timeout dan tampilan menu GRUB..."
    cp "$GRUB_DEFAULT_FILE" "${GRUB_DEFAULT_FILE}.bak"
    sed -i 's/^#*GRUB_TIMEOUT=.*/GRUB_TIMEOUT=5/' "$GRUB_DEFAULT_FILE"
    sed -i 's/^#*GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=menu/' "$GRUB_DEFAULT_FILE"
fi

if command -v update-grub &> /dev/null; then
    update-grub || true
fi

echo "[+] Konfigurasi GRUB selesai."
