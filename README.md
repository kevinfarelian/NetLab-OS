# NetLab OS

NetLab OS adalah distro Linux hasil remastering untuk **praktikum jaringan komputer dan keamanan sistem**. Seluruh alat analisis dan administrasi jaringan yang dibutuhkan praktikum sudah terpasang dan dikonfigurasi, sehingga lingkungan praktikum siap dipakai tanpa instalasi satu per satu.

Proyek ini dibuat untuk Tugas Akhir Mata Kuliah Sistem Operasi (Remastering Sistem Operasi Linux), Kelompok 9, Program Studi Teknik Informatika, Universitas Negeri Semarang.

## Sasaran Pengguna

Mahasiswa dan siswa laboratorium jaringan komputer yang mempelajari analisis lalu lintas data dan administrasi server dasar.

## Spesifikasi

| Komponen | Keterangan |
|---|---|
| Distro dasar | Xubuntu 24.04 LTS |
| Lingkungan desktop | XFCE |
| Alat remastering | Cubic |
| Zona waktu | Asia/Jakarta |
| Repositori paket | Mirror lokal Indonesia (Data Utama atau UGM) |

## Paket Utama

| Paket | Fungsi |
|---|---|
| Wireshark | Analisis lalu lintas jaringan secara grafis |
| Nmap | Pemindaian host dan port |
| traceroute | Menelusuri jalur paket |
| net-tools | Perintah jaringan klasik (ifconfig, netstat) |
| iperf3 | Pengukuran throughput jaringan |
| tcpdump | Penangkapan paket lewat terminal |
| dnsutils | Pengujian DNS (dig, nslookup) |
| OpenVPN | Klien VPN |
| PuTTY | Klien SSH |
| cURL | Pengujian HTTP dan transfer data |

## Fitur Unggulan

1. Dilengkapi beragam alat analisis dan administrasi jaringan untuk praktikum.
2. Memakai zona waktu Indonesia (Asia/Jakarta) dan repositori lokal Indonesia.
3. Wireshark dikonfigurasi agar bisa dipakai tanpa akses root oleh pengguna baru.
4. Tampilan XFCE minimalis dan bebas animasi agar ringan di mesin virtual.
5. Identitas visual sendiri (logo dan wallpaper NetLab OS).

## Struktur Repositori

| Folder/Berkas | Isi |
|---|---|
| `scripts/` | Skrip dan konfigurasi yang dipakai saat remastering |
| `PANDUAN_PRAKTIKUM.md` | Panduan penggunaan NetLab OS untuk praktikum |
| `README.md` | Halaman ini |

## Cara Membangun Ulang ISO (Ringkas)

1. Unduh ISO Xubuntu 24.04 LTS dan verifikasi checksum-nya.
2. Pasang Cubic di Ubuntu, lalu buat proyek baru dengan ISO tersebut.
3. Di terminal chroot Cubic, hapus paket yang tidak diperlukan dan pasang paket utama di atas.
4. Terapkan konfigurasi zona waktu, repositori lokal, Wireshark non-root, dan branding.
5. Generate ISO, lalu buat checksum SHA256.

Detail langkah ada di laporan tugas akhir kelompok.

## Anggota Kelompok 9

- Kevin Farelian
- Adrian Fausta
- bimaa
- Fikri Purnama Adi
