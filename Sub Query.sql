ALTER TABLE karyawan ADD COLUMN gaji_pokok NUMERIC(50);

INSERT INTO karyawan 
VALUE ('N09', 'Raka', 'D03', 'N06', '2000000');

UPDATE `data_perusahaan`.`karyawan` SET `gaji_pokok` = '2500000' WHERE (`nik` = 'N02');
UPDATE `data_perusahaan`.`karyawan` SET `gaji_pokok` = '2400000' WHERE (`nik` = 'N03');
UPDATE `data_perusahaan`.`karyawan` SET `sup_nik` = 'N01', `gaji_pokok` = '3000000' WHERE (`nik` = 'N04');
UPDATE `data_perusahaan`.`karyawan` SET `sup_nik` = 'N01', `gaji_pokok` = '2800000' WHERE (`nik` = 'N05');
UPDATE `data_perusahaan`.`karyawan` SET `gaji_pokok` = '2100000' WHERE (`nik` = 'N06');
UPDATE `data_perusahaan`.`karyawan` SET `sup_nik` = 'N06', `gaji_pokok` = '5000000' WHERE (`nik` = 'N07');
UPDATE `data_perusahaan`.`karyawan` SET `sup_nik` = 'N06', `gaji_pokok` = '4000000' WHERE (`nik` = 'N08');
UPDATE `data_perusahaan`.`karyawan` SET `gaji_pokok` = '2000000' WHERE (`nik` = 'N01');


SELECT k.nik, k.nama, d.nama AS nama_departemen
FROM karyawan k
JOIN departemen d ON k.id_dept = d.id_dept
WHERE d.id_dept = (
    SELECT id_dept
    FROM karyawan
    WHERE nama = 'Dika'
);

SELECT *
FROM karyawan
WHERE gaji_pokok > (
    SELECT AVG(gaji_pokok)
    FROM karyawan)
ORDER BY gaji_pokok DESC;

SELECT k.nik, k.nama
FROM karyawan k
WHERE k.id_dept IN (
    SELECT id_dept
    FROM karyawan
    WHERE nama LIKE '%K%'
);

SELECT k.nik, k.nama, d.nama AS nama_departemen
FROM karyawan k
JOIN departemen d ON k.id_dept = d.id_dept
WHERE d.id_p = (
    SELECT id_p
    FROM perusahaan
    WHERE nama = 'Kantor Pusat'
);

SELECT k.nik, k.nama
FROM karyawan k
WHERE k.id_dept IN (
    SELECT id_dept
    FROM karyawan
    WHERE nama LIKE '%K%'
)
AND k.gaji_pokok > (
    SELECT AVG(gaji_pokok)
    FROM karyawan
);