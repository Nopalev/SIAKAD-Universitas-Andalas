-- This is the original DDL for this project
-- To apply any changes to the current database please create new DDL files with this format: DDL_<version>.sql

CREATE TABLE Dosen(
    dosen_id int NOT NULL AUTO_INCREMENT,
    dosen_name varchar(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT dosen_id PRIMARY KEY (dosen_id)
);

CREATE TABLE Administrator(
    admin_id int NOT NULL AUTO_INCREMENT,
    admin_name varchar(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT admin_id PRIMARY KEY (admin_id)
);

CREATE TABLE Mahasiswa(
    mahasiswa_id int NOT NULL AUTO_INCREMENT,
    mahasiswa_name varchar(50) NOT NULL,
    mahasiswa_angkatan int NOT NULL,
    mahasiswa_IPK decimal(1, 1) DEFAULT 0.0 CHECK (mahasiswa_IPK >= 0.0 && mahasiswa_IPK <= 4.0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT mahasiswa_id PRIMARY KEY (mahasiswa_id)
);

CREATE TABLE Modul(
    modul_id int NOT NULL AUTO_INCREMENT,
    modul_nama varchar(50) NOT NULL,
    modul_semester int NOT NULL,
    modul_lokasi varchar(50) NOT NULL,
    semester_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT modul_id PRIMARY KEY (modul_id)
);

CREATE TABLE Semester(
    semester_id int NOT NULL AUTO_INCREMENT,
    semester_nama varchar(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT semester_id PRIMARY KEY (semester_id)
);

CREATE TABLE IPS(
    IPS_id int NOT NULL AUTO_INCREMENT,
    IPS_nilai decimal(1,1) NOT NULL CHECK (IPS_nilai >= 0.0 && IPS_nilai <= 4.0),
    mahasiswa_id int,
    semester_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT IPS_id PRIMARY KEY (IPS_id)
);

CREATE TABLE Timeline(
    timeline_id int NOT NULL AUTO_INCREMENT,
    timeline_deskripsi varchar(100),
    timeline_submisi boolean NOT NULL DEFAULT false,
    timeline_deadline date,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT timeline_id PRIMARY KEY (timeline_id)
);

CREATE TABLE Tugas(
    tugas_id int NOT NULL AUTO_INCREMENT,
    tugas_nilai int NOT NULL,
    tugas_jenis varchar(20),
    dosen_id int,
    modul_id int,
    mahasiswa_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT tugas_id PRIMARY KEY (tugas_id)
);

CREATE TABLE LogBook(
    logbook_id int NOT NULL AUTO_INCREMENT,
    logbook_nilai int NOT NULL CHECK (logbook_nilai >= 0 && logbook_nilai <= 100),
    modul_id int,
    mahasiswa_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT logbook_id PRIMARY KEY (logbook_id)
);

CREATE TABLE Presensi(
    presensi_id int NOT NULL AUTO_INCREMENT,
    presensi_tanggal date NOT NULL,
    presensi_status boolean NOT NULL DEFAULT false,
    presensi_keterangan varchar(50),
    presensi_blokir boolean NOT NULL DEFAULT false,
    mahasiswa_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT presensi_id PRIMARY KEY (presensi_id)
);

CREATE TABLE ForumDiskusi(
    forum_id int NOT NULL AUTO_INCREMENT,
    forum_nama varchar(50),
    input_dosen varchar(500),
    input_mahasiswa varchar(500),
    forum_jawaban_akhir varchar(500),
    dosen_id int,
    mahasiswa_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT forum_id PRIMARY KEY (forum_id)
);

CREATE TABLE Dosen_Modul(
    dosen_modul_id int NOT NULL AUTO_INCREMENT,
    dosen_id int,
    modul_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT forum_id PRIMARY KEY (dosen_modul_id)
);

CREATE TABLE Dosen_Timeline(
    dosen_timeline_id int NOT NULL AUTO_INCREMENT,
    dosen_id int,
    timeline_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT forum_id PRIMARY KEY (dosen_timeline_id)
);

CREATE TABLE Mahasiswa_Modul(
    mahasiswa_modul_id int NOT NULL AUTO_INCREMENT,
    mahasiswa_id int,
    modul_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT forum_id PRIMARY KEY (mahasiswa_modul_id)
);

CREATE TABLE Mahasiswa_Timeline(
    mahasiswa_timeline_id int NOT NULL AUTO_INCREMENT,
    mahasiswa_id int,
    timeline_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT forum_id PRIMARY KEY (mahasiswa_timeline_id)
);

CREATE TABLE Timeline_Tugas(
    timeline_tugas_id int NOT NULL AUTO_INCREMENT,
    timeline_id int,
    tugas_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT forum_id PRIMARY KEY (timeline_tugas_id)
);

CREATE TABLE Timeline_LogBook(
    timeline_logbook_id int NOT NULL AUTO_INCREMENT,
    timeline_id int,
    logbook_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT forum_id PRIMARY KEY (timeline_logbook_id)
);

ALTER TABLE Modul ADD FOREIGN KEY (semester_id) REFERENCES Semester(semester_id);

ALTER TABLE IPS ADD FOREIGN KEY (mahasiswa_id) REFERENCES Mahasiswa(mahasiswa_id);

ALTER TABLE IPS ADD FOREIGN KEY (semester_id) REFERENCES Semester(semester_id);

ALTER TABLE Tugas ADD FOREIGN KEY (dosen_id) REFERENCES Dosen(dosen_id);

ALTER TABLE Tugas ADD FOREIGN KEY (modul_id) REFERENCES Modul(modul_id);

ALTER TABLE Tugas ADD FOREIGN KEY (mahasiswa_id) REFERENCES Mahasiswa(mahasiswa_id);

ALTER TABLE LogBook ADD FOREIGN KEY (modul_id) REFERENCES Modul(modul_id);

ALTER TABLE LogBook ADD FOREIGN KEY (mahasiswa_id) REFERENCES Mahasiswa(mahasiswa_id);

ALTER TABLE Presensi ADD FOREIGN KEY (mahasiswa_id) REFERENCES Mahasiswa(mahasiswa_id);

ALTER TABLE ForumDiskusi ADD FOREIGN KEY (dosen_id) REFERENCES Dosen(dosen_id);

ALTER TABLE ForumDiskusi ADD FOREIGN KEY (mahasiswa_id) REFERENCES Mahasiswa(mahasiswa_id);

ALTER TABLE Dosen_Modul ADD FOREIGN KEY (dosen_id) REFERENCES Dosen(dosen_id);

ALTER TABLE Dosen_Modul ADD FOREIGN KEY (modul_id) REFERENCES Modul(modul_id);

ALTER TABLE Dosen_Timeline ADD FOREIGN KEY (dosen_id) REFERENCES Dosen(dosen_id);

ALTER TABLE Dosen_Timeline ADD FOREIGN KEY (timeline_id) REFERENCES Timeline(timeline_id);

ALTER TABLE Mahasiswa_Modul ADD FOREIGN KEY (mahasiswa_id) REFERENCES Mahasiswa(mahasiswa_id);

ALTER TABLE Mahasiswa_Modul ADD FOREIGN KEY (modul_id) REFERENCES Modul(modul_id);

ALTER TABLE Mahasiswa_Timeline ADD FOREIGN KEY (mahasiswa_id) REFERENCES Mahasiswa(mahasiswa_id);

ALTER TABLE Mahasiswa_Timeline ADD FOREIGN KEY (timeline_id) REFERENCES Timeline(timeline_id);

ALTER TABLE Timeline_Tugas ADD FOREIGN KEY (timeline_id) REFERENCES Timeline(timeline_id);

ALTER TABLE Timeline_Tugas ADD FOREIGN KEY (tugas_id) REFERENCES Tugas(tugas_id);

ALTER TABLE Timeline_LogBook ADD FOREIGN KEY (timeline_id) REFERENCES Timeline(timeline_id);

ALTER TABLE Timeline_LogBook ADD FOREIGN KEY (logbook_id) REFERENCES LogBook(logbook_id);