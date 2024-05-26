-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table mobile_manager.cthoadon
CREATE TABLE IF NOT EXISTS `cthoadon` (
  `MaHD` int NOT NULL,
  `MaSP` int NOT NULL,
  `SoLuong` int NOT NULL,
  `DonGia` int NOT NULL,
  `ThanhTien` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.cthoadon: ~4 rows (approximately)
INSERT INTO `cthoadon` (`MaHD`, `MaSP`, `SoLuong`, `DonGia`, `ThanhTien`) VALUES
	(18, 114, 2, 159000, 318000),
	(18, 122, 3, 249000, 747000),
	(18, 124, 6, 19000, 114000),
	(18, 130, 2, 19000, 38000),
	(18, 132, 2, 25000, 50000),
	(58, 161, 1, 500, 500),
	(58, 145, 1, 40000000, 40000000),
	(59, 151, 1, 24000000, 24000000),
	(59, 145, 1, 40000000, 40000000),
	(59, 162, 1, 25000000, 25000000);

-- Dumping structure for table mobile_manager.ctphieunhap
CREATE TABLE IF NOT EXISTS `ctphieunhap` (
  `MaPN` int NOT NULL,
  `MaSP` int NOT NULL,
  `SoLuong` int NOT NULL,
  `DonGia` int NOT NULL,
  `ThanhTien` int NOT NULL,
  PRIMARY KEY (`MaPN`,`MaSP`),
  CONSTRAINT `ctphieunhap_ibfk_2` FOREIGN KEY (`MaPN`) REFERENCES `phieunhap` (`MaPN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.ctphieunhap: ~2 rows (approximately)
INSERT INTO `ctphieunhap` (`MaPN`, `MaSP`, `SoLuong`, `DonGia`, `ThanhTien`) VALUES
	(11, 145, 5000, 1000, 5000000),
	(12, 145, 10, 1000, 10000);

-- Dumping structure for table mobile_manager.giamgia
CREATE TABLE IF NOT EXISTS `giamgia` (
  `MaGiam` int NOT NULL AUTO_INCREMENT,
  `TenGiamGia` text NOT NULL,
  `PhanTramGiam` int NOT NULL,
  `DieuKien` int NOT NULL,
  `NgayBD` date NOT NULL,
  `NgayKT` date NOT NULL,
  PRIMARY KEY (`MaGiam`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.giamgia: ~4 rows (approximately)
INSERT INTO `giamgia` (`MaGiam`, `TenGiamGia`, `PhanTramGiam`, `DieuKien`, `NgayBD`, `NgayKT`) VALUES
	(1, 'Không giảm giá', 0, 0, '2020-01-01', '2042-12-31'),
	(2, 'Giảm 20% đơn hàng từ 150.000đ', 20, 5000000, '2024-04-22', '2025-05-13'),
	(4, 'Giảm 10% đơn hàng từ 80.000đ', 10, 800000, '2024-03-26', '2025-05-31'),
	(6, '30/04-01/05 giảm 30% đơn hàng từ 300.000đ', 30, 15000000, '2024-04-20', '2026-05-08');

-- Dumping structure for table mobile_manager.hoadon
CREATE TABLE IF NOT EXISTS `hoadon` (
  `MaHD` int NOT NULL AUTO_INCREMENT,
  `MaKH` int NOT NULL,
  `MaNV` int NOT NULL,
  `NgayLap` date NOT NULL,
  `TongTien` int NOT NULL,
  `GhiChu` text NOT NULL,
  PRIMARY KEY (`MaHD`),
  KEY `hoadon_ibfk_1` (`MaNV`),
  KEY `hoadon_ibfk_2` (`MaKH`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.hoadon: ~0 rows (approximately)
INSERT INTO `hoadon` (`MaHD`, `MaKH`, `MaNV`, `NgayLap`, `TongTien`, `GhiChu`) VALUES
	(18, 4, 3, '2024-01-18', 1013600, 'Đã thanh toán'),
	(58, 1, 0, '2024-05-15', 32000400, 'Đã thanh toán'),
	(59, 1, 0, '2024-05-15', 105249672, 'Đã thanh toán');

-- Dumping structure for table mobile_manager.khachhang
CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKH` int NOT NULL AUTO_INCREMENT,
  `Ho` varchar(255) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `GioiTinh` varchar(3) NOT NULL,
  `TongChiTieu` int NOT NULL DEFAULT '0',
  `TinhTrang` int NOT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.khachhang: ~4 rows (approximately)
INSERT INTO `khachhang` (`MaKH`, `Ho`, `Ten`, `GioiTinh`, `TongChiTieu`, `TinhTrang`) VALUES
	(1, 'Nhân Gian', 'Tư Vị', 'Nam', 141135285, 1),
	(2, 'Thiên ', 'Đạo', 'Nam', 27242, 1),
	(3, 'Lục Trường', ' Sinh', 'Nam', 16427, 1),
	(4, 'Nguyệt ', 'Nhi', 'Nữ', 14700, 1);

-- Dumping structure for table mobile_manager.loai
CREATE TABLE IF NOT EXISTS `loai` (
  `MaLoai` int NOT NULL AUTO_INCREMENT,
  `TenLoai` text NOT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.loai: ~3 rows (approximately)
INSERT INTO `loai` (`MaLoai`, `TenLoai`) VALUES
	(1, 'Oppo'),
	(2, 'IPhone'),
	(3, 'SamSung');

-- Dumping structure for table mobile_manager.nhacungcap
CREATE TABLE IF NOT EXISTS `nhacungcap` (
  `MaNCC` int NOT NULL AUTO_INCREMENT,
  `TenNCC` varchar(255) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `DienThoai` text NOT NULL,
  PRIMARY KEY (`MaNCC`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.nhacungcap: ~3 rows (approximately)
INSERT INTO `nhacungcap` (`MaNCC`, `TenNCC`, `DiaChi`, `DienThoai`) VALUES
	(1, ' Hon Hai Precision Industry (Foxconn)', 'trụ sở tại Tucheng, New Taipei, Đài Loan.', '0293849414'),
	(2, 'Samsung Electronics ', 'trụ sở tại Bắc Ninh', '0902669733'),
	(5, 'OPPO Electronics Corp', 'trụ sở đặt tại Đông Hoản, Quảng Đông, Trung Quốc.', '0393393892');

-- Dumping structure for table mobile_manager.nhanvien
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNV` int NOT NULL AUTO_INCREMENT,
  `Ho` varchar(255) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `GioiTinh` varchar(3) NOT NULL,
  `ChucVu` varchar(255) NOT NULL,
  PRIMARY KEY (`MaNV`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.nhanvien: ~6 rows (approximately)
INSERT INTO `nhanvien` (`MaNV`, `Ho`, `Ten`, `GioiTinh`, `ChucVu`) VALUES
	(0, 'Admin', '', '', 'Admin'),
	(1, 'Cố Trường', 'Sinh', 'Nam', 'Quản Lý'),
	(2, 'Đỗ', 'Khê', 'Nam', 'Quản Lý'),
	(3, 'Tô Trường', 'Ngự', 'Nam', 'Quản Lý'),
	(4, 'Đại Ái Tiên', 'Tôn', 'Nam', 'Nhân Viên'),
	(12, 'Nghịch', 'Lưu', 'Nữ', 'Nhân Viên');

-- Dumping structure for table mobile_manager.phanquyen
CREATE TABLE IF NOT EXISTS `phanquyen` (
  `Quyen` varchar(255) NOT NULL,
  `NhapHang` int NOT NULL,
  `QLSanPham` int NOT NULL,
  `QLNhanVien` int NOT NULL,
  `QLKhachHang` int NOT NULL,
  `ThongKe` int NOT NULL,
  PRIMARY KEY (`Quyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.phanquyen: ~0 rows (approximately)
INSERT INTO `phanquyen` (`Quyen`, `NhapHang`, `QLSanPham`, `QLNhanVien`, `QLKhachHang`, `ThongKe`) VALUES
	('Default', 0, 0, 0, 0, 0),
	('Nhân viên', 0, 0, 0, 1, 0),
	('Quản lý', 1, 0, 1, 1, 1),
	('Quản trị', 1, 1, 1, 1, 1);

-- Dumping structure for table mobile_manager.phieunhap
CREATE TABLE IF NOT EXISTS `phieunhap` (
  `MaPN` int NOT NULL AUTO_INCREMENT,
  `MaNCC` int NOT NULL,
  `MaNV` int NOT NULL,
  `NgayLap` date NOT NULL,
  `TongTien` int NOT NULL,
  PRIMARY KEY (`MaPN`),
  KEY `phieunhap_ibfk_1` (`MaNCC`),
  KEY `phieunhap_ibfk_2` (`MaNV`),
  CONSTRAINT `phieunhap_ibfk_1` FOREIGN KEY (`MaNCC`) REFERENCES `nhacungcap` (`MaNCC`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phieunhap_ibfk_2` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.phieunhap: ~0 rows (approximately)
INSERT INTO `phieunhap` (`MaPN`, `MaNCC`, `MaNV`, `NgayLap`, `TongTien`) VALUES
	(11, 1, 0, '2024-05-15', 5000000),
	(12, 1, 0, '2024-05-15', 10000);

-- Dumping structure for table mobile_manager.sanpham
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSP` int NOT NULL AUTO_INCREMENT,
  `TenSP` varchar(255) NOT NULL,
  `MaLoai` int NOT NULL,
  `SoLuong` int NOT NULL,
  `DonViTinh` varchar(255) NOT NULL,
  `HinhAnh` varchar(255) NOT NULL,
  `DonGia` int NOT NULL,
  PRIMARY KEY (`MaSP`),
  KEY `sanpham_ibfk_1` (`MaLoai`),
  CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaLoai`) REFERENCES `loai` (`MaLoai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bang San Pham';

-- Dumping data for table mobile_manager.sanpham: ~0 rows (approximately)
INSERT INTO `sanpham` (`MaSP`, `TenSP`, `MaLoai`, `SoLuong`, `DonViTinh`, `HinhAnh`, `DonGia`) VALUES
	(145, 'Iphone 15', 2, 5096, 'chiếc', 'iphone-15.png', 40000000),
	(146, 'Iphone 14', 2, 1984, 'chiếc', 'iphone-14.png', 35000000),
	(147, 'SamSung Galaxy A25', 3, 9957, 'chiếc', 'samsung-galaxy.png', 26000000),
	(148, 'Samsung Galaxy A55', 3, 500, 'chiếc', 'samsung-galaxy-a55.png', 15000000),
	(149, 'Oppo A18', 1, 600, 'chiếc', 'oppo-a18.png', 10000000),
	(150, 'Oppo A38', 1, 400, 'chiếc', 'oppo-a38.png', 3700000),
	(151, 'Oppo Reno10', 1, 198, 'chiếc', 'oppo-reno10.png', 24000000),
	(152, 'Oppo Reno 11', 1, 200, 'chiếc', 'oppo-reno-11.png', 25000000),
	(153, 'Iphone 6', 2, 198, 'chiếc', 'iphone 6.png', 3000000),
	(154, 'Iphone 7', 2, 299, 'chiếc', 'iphone7.png', 4000000),
	(156, 'Iphone 9', 2, 300, 'chiếc', 'iphone9.png', 8000000),
	(157, 'Iphone XS', 2, 299, 'chiếc', 'iphoneXS.png', 11000000),
	(158, 'Iphone 11', 2, 300, 'chiếc', 'iphone11.png', 17000000),
	(159, 'Oppo A16', 1, 1000, 'chiếc', 'OPA16.png', 7000000),
	(160, 'Oppo A18', 1, 998, 'chiếc', 'oppo-a18.png', 4400000),
	(161, 'Samsung S20', 3, 999, 'chiếc', 'samsungs20.png', 21000000),
	(162, 'Samsung S23', 3, 984, 'chiếc', 'ssS23.png', 25000000),
	(163, 'Samsung S22', 3, 999, 'chiếc', 'ssS22.png', 23000000),
	(164, 'Samsung S21', 3, 993, 'chiếc', 'ssS21.png', 22000000),
	(165, 'Samsung J6', 3, 999, 'chiếc', 'ssj6.png', 800000);

-- Dumping structure for table mobile_manager.taikhoan
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaNV` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(255) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `Quyen` varchar(255) NOT NULL,
  `TrangThai` int NOT NULL,
  PRIMARY KEY (`MaNV`),
  KEY `taikhoan_ibfk_2` (`Quyen`),
  CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `taikhoan_ibfk_2` FOREIGN KEY (`Quyen`) REFERENCES `phanquyen` (`Quyen`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mobile_manager.taikhoan: ~5 rows (approximately)
INSERT INTO `taikhoan` (`MaNV`, `TenDangNhap`, `MatKhau`, `Quyen`, `TrangThai`) VALUES
	(0, 'admin', 'admin', 'Quản trị', 1),
	(1, 'ql01', 'ql01', 'Quản lý', 1),
	(2, 'ql02', 'ql02', 'Quản lý', 1),
	(3, 'ql03', 'ql03', 'Quản lý', 1),
	(4, 'nv01', 'nv01', 'Nhân viên', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
