CREATE DATABASE DB_Ban_Hang
use DB_Ban_Hang 
CREATE TABLE san_pham (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_san_pham VARCHAR(255) ,
        ten_san_pham VARCHAR(255) ,
        trang_thai VARCHAR(50), -- or INT, depending on how you represent status
        ngay_tao DATETIME ,
        ngay_sua DATETIME
        );
        CREATE TABLE mau_sac (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_mau VARCHAR(255),
        ten_mau VARCHAR(255),
        trang_thai VARCHAR(50), -- or INT, based on your status representation
        ngay_sua DATETIME,
        ngay_tao DATETIME
        );
        CREATE TABLE size (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_size VARCHAR(255),
        ten_size VARCHAR(255),
        trang_thai VARCHAR(50), -- or INT, based on your status representation
        ngay_sua DATETIME,
        ngay_tao DATETIME
        );
        CREATE TABLE danh_muc (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ma_danh_muc VARCHAR(255),
        ten_danh_muc VARCHAR(255),
        trang_thai VARCHAR(50), -- Adjust based on how you plan to represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME
        );
        CREATE TABLE khach_hang (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ho_ten NVARCHAR(255),
        dia_chi NVARCHAR(255),
        sdt VARCHAR(20),
        trang_thai VARCHAR(50), -- Adjust based on how you plan to represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME
        );
		INSERT INTO khach_hang (ho_ten, dia_chi, sdt, trang_thai, ngay_tao, ngay_sua)
VALUES 
(N'Nguyễn Văn A', N'123 Đường ABC, Hà Nội', '0912345678', N'Hoạt động', '2024-10-01 10:00:00', '2024-10-01 10:00:00'),
(N'Trần Thị B', N'456 Đường XYZ, TP.HCM', '0987654321', N'Hoạt động', '2024-10-01 10:00:00', '2024-10-01 10:00:00'),
(N'Lê Văn C', N'789 Đường DEF, Đà Nẵng', '0901234567', N'Không hoạt động', '2024-10-02 11:00:00', '2024-10-02 11:00:00'),
(N'Phạm Thị D', N'321 Đường GHI, Cần Thơ', '0938765432', N'Hoạt động', '2024-10-02 11:30:00', '2024-10-02 11:30:00'),
(N'Hoàng Văn E', N'654 Đường JKL, Huế', '0923456789', N'Không hoạt động', '2024-10-03 12:00:00', '2024-10-03 12:00:00');
	select * from khach_hang
        CREATE TABLE ctsp (
        id INT IDENTITY(1,1) PRIMARY KEY,
        id_sp INT NULL,
        id_mau_sac INT NULL,
        id_size INT NULL,
        gia_ban DECIMAL(18, 2),
        so_luong_ton INT,
        trang_thai VARCHAR(50), -- Adjust based on your representation of status
        ngay_tao DATETIME,
        ngay_sua DATETIME,
        CONSTRAINT fk_sp FOREIGN KEY (id_sp) REFERENCES san_pham(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_mau_sac FOREIGN KEY (id_mau_sac) REFERENCES mau_sac(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_size FOREIGN KEY (id_size) REFERENCES size(id) ON UPDATE CASCADE ON DELETE CASCADE,
        );
	
        CREATE TABLE hoa_don (
        id INT IDENTITY(1,1) PRIMARY KEY,
        id_khach_hang INT NULL,
        trang_thai VARCHAR(50), -- Adjust based on how you represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME,
        dia_chi NVARCHAR(255),
        so_dien_thoai VARCHAR(20),
        CONSTRAINT fk_khach_hang FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id) ON UPDATE CASCADE ON DELETE CASCADE,
        );

        CREATE TABLE hdct (
        id INT IDENTITY(1,1) PRIMARY KEY,
        id_hoa_don INT NULL,
        id_ctsp INT NULL,
        so_luong_mua INT,
        gia_ban DECIMAL(18, 2),
        tong_tien DECIMAL(18, 2),
        trang_thai VARCHAR(50), -- Adjust based on how you represent the status
        ngay_tao DATETIME,
        ngay_sua DATETIME,
        CONSTRAINT fk_hoa_don FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_ctsp FOREIGN KEY (id_ctsp) REFERENCES ctsp(id) ON UPDATE CASCADE ON DELETE CASCADE,
        );
        ALTER TABLE san_pham
        ADD id_danh_muc INT NULL;

        ALTER TABLE san_pham
        ADD CONSTRAINT fk_san_pham_danh_muc
        FOREIGN KEY (id_danh_muc) REFERENCES danh_muc(id) ON UPDATE CASCADE ON DELETE CASCADE;

			/*
		create datebase sof3021_jpa_ve_nha12
go 
use sof3021_jpa_ve_nha12
go
USE [sof3021_jpa_ve_nha12]
GO
/****** Object:  Table [dbo].[lop_hoc]    Script Date: 10/1/2024 2:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop_hoc](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[dia_diem_lop_hoc] [varchar](100) NULL,
 CONSTRAINT [lop_hoc_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinh_vien]    Script Date: 10/1/2024 2:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinh_vien](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lop_hoc_id] [bigint] NULL,
	[name] [varchar](100) NULL,
	[mssv] [varchar](100) NULL,
	[dia_chi] [varchar](100) NULL,
 CONSTRAINT [phong_hoc_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[lop_hoc] ON 

INSERT [dbo].[lop_hoc] ([id], [name], [dia_diem_lop_hoc]) VALUES (1, N'SD18401', N'P306 Kieu Mai')
INSERT [dbo].[lop_hoc] ([id], [name], [dia_diem_lop_hoc]) VALUES (2, N'SD18402', N'P308 Kieu Mai')
INSERT [dbo].[lop_hoc] ([id], [name], [dia_diem_lop_hoc]) VALUES (3, N'SD18403', N'P310 Kieu Mai')
SET IDENTITY_INSERT [dbo].[lop_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[sinh_vien] ON 

INSERT [dbo].[sinh_vien] ([id], [lop_hoc_id], [name], [mssv], [dia_chi]) VALUES (1, 1, N'fd', N'gd', N'FDS')
INSERT [dbo].[sinh_vien] ([id], [lop_hoc_id], [name], [mssv], [dia_chi]) VALUES (2, 1, N'FSD', N'FSD', N'FSD')
SET IDENTITY_INSERT [dbo].[sinh_vien] OFF
GO
ALTER TABLE [dbo].[sinh_vien]  WITH CHECK ADD  CONSTRAINT [sinh_vien_FK] FOREIGN KEY([lop_hoc_id])
REFERENCES [dbo].[lop_hoc] ([id])
GO
ALTER TABLE [dbo].[sinh_vien] CHECK CONSTRAINT [sinh_vien_FK]
GO
		*/