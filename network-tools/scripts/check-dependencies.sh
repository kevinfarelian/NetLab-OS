#!/bin/bash

# Dependency Checker

echo "======================================"
echo "       DEPENDENCY CHECKER"
echo "======================================"

if [[ $EUID -ne 0 ]]; then
    echo "Jalankan menggunakan sudo!"
    exit 1
fi

echo ""
echo "[1] Checking broken dependencies..."

if apt-get check; then
    echo "[SUCCESS] Tidak ditemukan dependensi bermasalah."
else
    echo "[ERROR] Terdapat dependensi bermasalah."
    exit 1
fi

echo ""
echo "[2] Checking unfinished package configuration..."

if dpkg --audit; then
    echo "[SUCCESS] Pemeriksaan konfigurasi paket selesai."
else
    echo "[ERROR] Pemeriksaan konfigurasi gagal."
    exit 1
fi

echo ""
echo "[3] Checking package manager..."

if dpkg --configure -a; then
    echo "[SUCCESS] Konfigurasi paket selesai."
else
    echo "[ERROR] Konfigurasi paket bermasalah."
    exit 1
fi

echo ""
echo "======================================"
echo "Dependency checking completed!"
echo "======================================"
