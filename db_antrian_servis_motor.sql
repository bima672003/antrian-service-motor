
CREATE DATABASE db_antrian_servis_motor;
USE db_antrian_servis_motor;

-- 1. Tabel pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    no_hp VARCHAR(15),
    alamat TEXT
);

-- 2. Tabel kendaraan
CREATE TABLE kendaraan (
    id_kendaraan INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    no_polisi VARCHAR(20),
    merk VARCHAR(50),
    tipe VARCHAR(50),
    tahun INT,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- 3. Tabel antrian_servis
CREATE TABLE antrian_servis (
    id_antrian INT AUTO_INCREMENT PRIMARY KEY,
    id_kendaraan INT,
    tanggal DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Dalam Antrian', 'Sedang Dikerjakan', 'Selesai') DEFAULT 'Dalam Antrian',
    FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan)
);

-- 4. Tabel transaksi_servis
CREATE TABLE transaksi_servis (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_antrian INT,
    total_biaya DECIMAL(10,2),
    metode_pembayaran ENUM('Tunai', 'Non-Tunai'),
    tanggal_bayar DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_antrian) REFERENCES antrian_servis(id_antrian)
);

-- 5. Tabel pekerjaan_servis
CREATE TABLE pekerjaan_servis (
    id_pekerjaan INT AUTO_INCREMENT PRIMARY KEY,
    id_antrian INT,
    deskripsi_pekerjaan TEXT,
    biaya DECIMAL(10,2),
    FOREIGN KEY (id_antrian) REFERENCES antrian_servis(id_antrian)
);
