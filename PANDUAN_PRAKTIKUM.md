# Panduan Praktikum NetLab OS

Panduan singkat memakai alat jaringan yang sudah terpasang di NetLab OS. Semua perintah dijalankan di Terminal.

> **Aturan penting:** pemindaian (Nmap) dan penangkapan paket (Wireshark, tcpdump) hanya boleh dilakukan di jaringan laboratorium sendiri atau dengan izin pemilik jaringan. Jangan dipakai di jaringan orang lain.

## 1. Persiapan

1. Jalankan NetLab OS dalam mode live atau setelah diinstal di mesin virtual (VirtualBox/VMware).
2. Pastikan koneksi jaringan aktif. Pada VM, adaptor jaringan sebaiknya diatur ke **NAT** atau **Bridged** sesuai arahan dosen.
3. Cek alamat IP komputer:

```bash
ip a
```

## 2. Menguji Konektivitas

**ping**: mengecek apakah host tujuan bisa dijangkau.

```bash
ping -c 4 8.8.8.8
```

**traceroute**: melihat jalur paket menuju tujuan.

```bash
traceroute 8.8.8.8
```

**net-tools**: menampilkan konfigurasi antarmuka dan koneksi.

```bash
ifconfig
netstat -tuln
```

## 3. Menguji DNS dan HTTP

**dnsutils**: mencari alamat IP dari nama domain.

```bash
dig example.com
nslookup example.com
```

**cURL**: melihat respons server web.

```bash
curl -I https://example.com
```

## 4. Memindai Jaringan dengan Nmap

Mencari host yang aktif di jaringan lab (ganti alamat sesuai jaringan lab):

```bash
nmap -sn 192.168.1.0/24
```

Memeriksa port tertentu pada satu host:

```bash
nmap -p 22,80,443 192.168.1.10
```

## 5. Menangkap dan Menganalisis Paket

**tcpdump**: menangkap 10 paket lewat Terminal.

```bash
sudo tcpdump -i any -c 10
```

**Wireshark** (bisa dijalankan tanpa root):

1. Buka Wireshark dari menu aplikasi.
2. Klik dua kali antarmuka jaringan yang aktif untuk mulai menangkap.
3. Gunakan filter di bagian atas, misalnya:

| Filter | Fungsi |
|---|---|
| `dns` | Hanya paket DNS |
| `http` | Hanya paket HTTP |
| `icmp` | Hanya paket ping |
| `tcp.port == 80` | Lalu lintas ke port 80 |

4. Klik tombol stop (kotak merah) untuk menghentikan penangkapan.

## 6. Mengukur Kecepatan Jaringan dengan iperf3

Butuh dua komputer (atau dua VM). Di komputer pertama jalankan sebagai server:

```bash
iperf3 -s
```

Di komputer kedua jalankan sebagai klien (ganti dengan IP server):

```bash
iperf3 -c 192.168.1.10
```

## 7. Akses Jarak Jauh dan VPN

**PuTTY**: buka dari menu aplikasi, isi alamat host, pilih jenis koneksi **SSH**, lalu klik Open.

**OpenVPN**: jalankan dengan berkas konfigurasi `.ovpn` dari dosen.

```bash
sudo openvpn --config nama-file.ovpn
```

## 8. Pemecahan Masalah Singkat

| Masalah | Cek dulu |
|---|---|
| Tidak ada internet | `ip a` dan `ping 8.8.8.8` |
| Nama domain tidak ditemukan | `dig example.com` (cek DNS) |
| Wireshark tidak menampilkan antarmuka | Pastikan user sudah masuk grup `wireshark`, lalu login ulang |
| Perintah `sudo` diminta password | Pakai password akun yang dibuat saat instalasi |
