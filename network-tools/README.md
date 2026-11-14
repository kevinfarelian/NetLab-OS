# Network Tools

## 1. Deskripsi Project
Network Tools merupakan project berbasis Linux Ubuntu yang berisi kumpulan tools untuk membantu pengguna melakukan pemeriksaan, pemantauan, dan pengelolaan jaringan komputer.

## 2. Tujuan Project
- Mempermudah pemeriksaan koneksi jaringan.
- Membantu menganalisis kondisi jaringan.
- Menyediakan tools administrasi jaringan dalam satu project.
- Mempermudah proses instalasi dan verifikasi tools.

## 3. Daftar Tools

| No. | Tools | Fungsi |
|---|---|---|
| 1 | Nmap | Pemindaian jaringan |
| 2 | Traceroute | Melacak jalur koneksi jaringan |
| 3 | Net-tools | Informasi konfigurasi jaringan |
| 4 | Iperf3 | Pengujian performa jaringan |
| 5 | Tcpdump | Analisis paket jaringan |
| 6 | OpenVPN | Koneksi jaringan VPN |
| 7 | PuTTY | SSH dan koneksi jarak jauh |
| 8 | Curl | Transfer data melalui URL |

## 4. Struktur Project

```text
network-tools/
├── reports/
│   └── installation-report.txt
├── scripts/
│   ├── check-dependencies.sh
│   ├── install.sh
│   └── verify-tools.sh
├── .gitignore
├── README.md
└── TO DO TASK
```

## 5. Cara Menjalankan Project

Masuk ke direktori project:

```bash
cd ~/NetLab-OS/network-tools
```

Jalankan script instalasi:

```bash
bash scripts/install.sh
```

Jalankan verifikasi:

```bash
bash scripts/verify-tools.sh
```

## 6. Laporan Instalasi

Hasil verifikasi disimpan secara otomatis pada:

```text
reports/installation-report.txt
```

Hasil pengujian terakhir:
- Total packages: 8
- Installed: 8
- Failed: 0

## 7. Status Pengembangan

Delapan tools utama telah berhasil diinstal dan diverifikasi.

DNS utilities (`bind9-dnsutils`) masih ditunda dan akan ditambahkan pada tahap pengembangan berikutnya.