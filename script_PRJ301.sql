USE [master]
GO
/****** Object:  Database [PRJ301_SE1625]    Script Date: 10/29/2022 9:30:45 PM ******/
CREATE DATABASE [PRJ301_SE1625]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_SE1625', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_SE1625.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_SE1625_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_SE1625_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_SE1625] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SE1625].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SE1625] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SE1625] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SE1625] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1625] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1625] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SE1625] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SE1625] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SE1625] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SE1625] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SE1625] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_SE1625] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_SE1625] SET QUERY_STORE = OFF
GO
USE [PRJ301_SE1625]
GO
/****** Object:  Table [dbo].[Account_HE161055]    Script Date: 10/29/2022 9:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_HE161055](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[isAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_HE161055]    Script Date: 10/29/2022 9:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_HE161055](
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_HE161055]    Script Date: 10/29/2022 9:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_HE161055](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[totalPrice] [int] NULL,
	[note] [nvarchar](255) NULL,
	[created_date] [date] NULL,
	[shipping_id] [int] NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail_HE161055]    Script Date: 10/29/2022 9:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail_HE161055](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [int] NULL,
	[quantity] [int] NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_HE161055]    Script Date: 10/29/2022 9:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_HE161055](
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[ImageURL] [varchar](255) NULL,
	[CreatedDate] [date] NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping_HE161055]    Script Date: 10/29/2022 9:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping_HE161055](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account_HE161055] ON 

INSERT [dbo].[Account_HE161055] ([id], [username], [password], [displayName], [address], [email], [phone], [isAdmin]) VALUES (1, N'admin', N'12345', N'Admin', N'Hà Nội', N'hellohi@gmail.com', N'0879125456', 1)
INSERT [dbo].[Account_HE161055] ([id], [username], [password], [displayName], [address], [email], [phone], [isAdmin]) VALUES (2, N'linh', N'000', N'Linh', N'Hải Dương', N'linhlinh@gmail.com', N'0986453121', 0)
INSERT [dbo].[Account_HE161055] ([id], [username], [password], [displayName], [address], [email], [phone], [isAdmin]) VALUES (3, N'ducanh', N'666', N'Anh', N'Hồ Chí Minh', N'anhh@gmail.com', N'0123456789', 0)
INSERT [dbo].[Account_HE161055] ([id], [username], [password], [displayName], [address], [email], [phone], [isAdmin]) VALUES (4, N'minh', N'999', N'Minh', N'Thái Bình', N'muynh@gmail.com', N'0456123890', 0)
INSERT [dbo].[Account_HE161055] ([id], [username], [password], [displayName], [address], [email], [phone], [isAdmin]) VALUES (5, N'trang', N'123', N'Trang', N'Hải Phòng', N'changgg12@gmail.com', N'0965345123', 0)
INSERT [dbo].[Account_HE161055] ([id], [username], [password], [displayName], [address], [email], [phone], [isAdmin]) VALUES (6, N'manh', N'124', N'Manh', N'Bắc Kạn', N'manhcute@gmail.com', N'0897452111', 0)
SET IDENTITY_INSERT [dbo].[Account_HE161055] OFF
GO
INSERT [dbo].[Category_HE161055] ([CategoryId], [Name]) VALUES (1, N'Áo')
INSERT [dbo].[Category_HE161055] ([CategoryId], [Name]) VALUES (2, N'Quần')
INSERT [dbo].[Category_HE161055] ([CategoryId], [Name]) VALUES (3, N'Đầm')
INSERT [dbo].[Category_HE161055] ([CategoryId], [Name]) VALUES (4, N'Chân váy')
INSERT [dbo].[Category_HE161055] ([CategoryId], [Name]) VALUES (5, N'Đồ bộ')
INSERT [dbo].[Category_HE161055] ([CategoryId], [Name]) VALUES (6, N'Áo khoác và Blazer')
GO
SET IDENTITY_INSERT [dbo].[Orders_HE161055] ON 

INSERT [dbo].[Orders_HE161055] ([id], [totalPrice], [note], [created_date], [shipping_id], [account_id]) VALUES (1, 713600, N'shop giao nhanh cho mình nhé', NULL, 8, 1)
INSERT [dbo].[Orders_HE161055] ([id], [totalPrice], [note], [created_date], [shipping_id], [account_id]) VALUES (2, 416000, N'checkkkk', NULL, 10, 2)
INSERT [dbo].[Orders_HE161055] ([id], [totalPrice], [note], [created_date], [shipping_id], [account_id]) VALUES (3, 682000, N'hong cóa nèe', CAST(N'2022-06-29' AS Date), 11, 2)
INSERT [dbo].[Orders_HE161055] ([id], [totalPrice], [note], [created_date], [shipping_id], [account_id]) VALUES (4, 778000, N'okii', CAST(N'2022-06-29' AS Date), 12, 2)
INSERT [dbo].[Orders_HE161055] ([id], [totalPrice], [note], [created_date], [shipping_id], [account_id]) VALUES (5, 350300, N'ok', CAST(N'2022-07-04' AS Date), 13, 2)
SET IDENTITY_INSERT [dbo].[Orders_HE161055] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetail_HE161055] ON 

INSERT [dbo].[OrdersDetail_HE161055] ([id], [productName], [productImage], [productPrice], [quantity], [order_id]) VALUES (1, N'Áo len váy Nút phía trước Khối Màu Thanh lịch', N'https://img.ltwebstatic.com/images3_pi/2022/04/10/16495915450ee92b4057102b254738c69a7e043e18_thumbnail_600x.webp', 162300, 2, 1)
INSERT [dbo].[OrdersDetail_HE161055] ([id], [productName], [productImage], [productPrice], [quantity], [order_id]) VALUES (2, N'Jumpsuits Dây kéo màu trơn Hồng Tao nhã', N'https://img.ltwebstatic.com/images2_pi/2019/08/06/15650777643754031390_thumbnail_600x799.webp', 389000, 1, 1)
INSERT [dbo].[OrdersDetail_HE161055] ([id], [productName], [productImage], [productPrice], [quantity], [order_id]) VALUES (3, N'Đầm Dây kéo Túi Nút phía trước màu trơn', N'https://img.ltwebstatic.com/images3_pi/2022/04/26/165096212827cb605a9a21c5d8801d3c3d1b2b96b4_thumbnail_600x.webp', 416000, 1, 2)
INSERT [dbo].[OrdersDetail_HE161055] ([id], [productName], [productImage], [productPrice], [quantity], [order_id]) VALUES (4, N'Bộ thời trang Nút phía trước màu trơn', N'https://img.ltwebstatic.com/images3_pi/2021/01/06/1609915828020a7478ce6c4d6359771b5181d6a98a_thumbnail_600x.webp', 341000, 2, 3)
INSERT [dbo].[OrdersDetail_HE161055] ([id], [productName], [productImage], [productPrice], [quantity], [order_id]) VALUES (5, N'Jumpsuits Dây kéo màu trơn Hồng Tao nhã', N'https://img.ltwebstatic.com/images2_pi/2019/08/06/15650777643754031390_thumbnail_600x799.webp', 389000, 2, 4)
INSERT [dbo].[OrdersDetail_HE161055] ([id], [productName], [productImage], [productPrice], [quantity], [order_id]) VALUES (6, N'Áo sơ mi nữ Nút phía trước Kẻ sọc', N'https://img.ltwebstatic.com/images3_pi/2022/04/27/1651038675fb447cc1f5ea4d70ef987590c8609359_thumbnail_600x.webp', 188000, 1, 5)
INSERT [dbo].[OrdersDetail_HE161055] ([id], [productName], [productImage], [productPrice], [quantity], [order_id]) VALUES (7, N'Áo len váy Nút phía trước Khối Màu Thanh lịch', N'https://img.ltwebstatic.com/images3_pi/2022/04/10/16495915450ee92b4057102b254738c69a7e043e18_thumbnail_600x.webp', 162300, 1, 5)
SET IDENTITY_INSERT [dbo].[OrdersDetail_HE161055] OFF
GO
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (2, N'Áo len váy Nút phía trước Khối Màu Thanh lịch', 90, 162300, N'Màu sắc:	màu đen,
Phong cách:	Thanh lịch,
Chi tiết:	Nút phía trước,
Viền:	Cổ Polo,
Chiều dài tay:	Ngắn tay,
Loại tay áo:	Tay thường,
Vòng eo:	Tự nhiên,
Hình hem:	Bút chì', N'https://img.ltwebstatic.com/images3_pi/2022/04/10/16495915450ee92b4057102b254738c69a7e043e18_thumbnail_600x.webp', CAST(N'2022-01-01' AS Date), 3)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (3, N'Áo thun Tương phản ren Sọc', 50, 155000, N'Màu sắc:	Màu xanh nhạt
Phong cách:	Giải trí
Kiểu mẫu:	Sọc
Viền:	Cổ Polo
Chi tiết:	Tương phản ren, Nút phía trước
Chiều dài tay:	Ngắn tay
Loại tay áo:	Tay thường
Chất liệu: Polyester', N'https://img.ltwebstatic.com/images3_pi/2021/01/07/1609992276953d2c78232d938af7d04aa40cf431e7_thumbnail_600x.webp', CAST(N'2021-03-02' AS Date), 1)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (4, N'Áo liền quần Thắt nút màu trơn Hải quân', 20, 234000, N'Màu sắc:	Màu xanh hải quân
Phong cách:	Sẵn sàng
Kiểu mẫu:	màu trơn
Chi tiết:	Thắt nút, Túi
Kiểu:	quần yếm
Viền:	Dây đai
Chiều dài tay:	Không tay
Chất liệu: Bông', N'https://img.ltwebstatic.com/images3_pi/2020/03/22/158484913160a13b72e87cf68e5373355fdd1774f9_thumbnail_600x.webp', CAST(N'2022-06-01' AS Date), 5)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (5, N'Jumpsuits Dây kéo màu trơn Hồng Tao nhã', 190, 389000, N'Màu sắc:	Bụi hồng
Phong cách:	Thanh lịch
Kiểu mẫu:	màu trơn
Chi tiết:	Thắt lưng, Chia, Nút, Xếp li, Dây kéo
Kiểu:	Váy quần
Viền:	Dây
Chiều dài tay:	Không tay
Vòng eo:	Vòng eo cao
Chất liệu:	Polyester', N'https://img.ltwebstatic.com/images2_pi/2019/08/06/15650777643754031390_thumbnail_600x799.webp', CAST(N'2022-05-01' AS Date), 5)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (6, N'Đầm Dây kéo Túi Nút phía trước màu trơn', 246, 416000, N'Màu sắc:	trắng
Kiểu mẫu:	màu trơn
Chi tiết:	Dây kéo, Túi, Nút phía trước
Kiểu:	Áo sơ mi
Viền:	Vòng cổ
Chiều dài tay:	Nửa tay
Loại tay áo:	Thả vai
Thành phần:	80% Polyester, 20% Bông', N'https://img.ltwebstatic.com/images3_pi/2022/04/26/165096212827cb605a9a21c5d8801d3c3d1b2b96b4_thumbnail_600x.webp', CAST(N'2021-11-25' AS Date), 3)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (7, N'Đầm Viên lá sen Nút phía trước màu trơn', 40, 566000, N'Màu sắc:	trắng
Phong cách:	Giải trí
Kiểu mẫu:	màu trơn
Chi tiết:	Viên lá sen, Nút phía trước
Kiểu:	áo choàng
Viền:	Vòng cổ
Chiều dài tay:	Tay áo dài
Loại tay áo:	Tay áo Đèn lồng
Vòng eo:	Vòng eo cao
Chất liệu:	Polyester', N'https://img.ltwebstatic.com/images3_pi/2022/01/25/16430880486c014d2f9044eb9d1562c6af2dffd01e_thumbnail_600x.webp', CAST(N'2022-04-03' AS Date), 3)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (8, N' Đầm Sọc', 200, 223000, N'Màu sắc:	Nhiều màu
Phong cách:	Giải trí
Kiểu mẫu:	Sọc
Kiểu:	Áo thun
Viền:	Vòng cổ
Chiều dài tay:	Ngắn tay
Loại tay áo:	Tay thường
Chất vải: Bông', N'https://img.ltwebstatic.com/images3_pi/2021/04/15/1618469844b68faa9ac7581262836636ec0c1f534f_thumbnail_600x.webp', CAST(N'2022-02-23' AS Date), 3)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (9, N'Đầm Đắp vá Nút phía trước Lá thư ', 120, 452000, N'Màu sắc:	màu đen
Phong cách:	Giải trí
Kiểu mẫu:	Lá thư
Chi tiết:	Đắp vá, Nút phía trước
Kiểu:	Một Line
Viền:	Cổ Polo
Chiều dài tay:	Tay áo dài
Chất vải: Cotton', N'https://img.ltwebstatic.com/images3_pi/2021/11/17/163713900851b9032e5985f388663ebe51e8f4e654_thumbnail_600x.webp', CAST(N'2022-04-25' AS Date), 3)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (10, N'Áo sơ mi nữ Nút phía trước Kẻ sọc', 230, 188000, N'Màu sắc:	Màu Hồng Tươi
Phong cách:	Giải trí
Kiểu mẫu:	Kẻ sọc
Kiểu:	Áo sơ mi
Viền:	Vòng cổ
Chi tiết:	Nút phía trước
Chiều dài tay:	Ngắn tay
Loại tay áo:	Tay thường', N'https://img.ltwebstatic.com/images3_pi/2022/04/27/1651038675fb447cc1f5ea4d70ef987590c8609359_thumbnail_600x.webp', CAST(N'2022-03-22' AS Date), 1)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (11, N'Quần jean nữ Hem thô màu trơn', 150, 389000, N'Màu sắc:	trắng
Kiểu mẫu:	màu trơn
Kiểu:	Chân thẳng
loại đóng kín:	Dây kéo tích hợp
Chi tiết:	Hem thô
Vòng eo:	Vòng eo cao
Chiều dài:	Quần skinny', N'https://img.ltwebstatic.com/images3_pi/2021/11/16/1637044686e47029cf9ce8d38beb10901515c31f5c_thumbnail_600x.webp', CAST(N'2022-02-14' AS Date), 2)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (12, N'Quần jean Nút mép Đắp vá Túi Dây kéo Hoạt hình', 50, 520000, N'Màu sắc:	Rửa nhẹ
Kiểu mẫu:	Lá thư, Hoạt hình
Kiểu:	quần ống rộng
loại đóng kín:	Dây kéo tích hợp
Chi tiết:	mép, Đắp vá, Nút, Túi, Dây kéo
Vòng eo:	Vòng eo cao
Chiều dài:	Dài', N'https://img.ltwebstatic.com/images3_pi/2021/06/21/1624245547a605ea017707bd0e8a063d73ec9e46a7_thumbnail_600x.webp', CAST(N'2022-04-20' AS Date), 2)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (13, N' Váy nữ Hoa Boho', 100, 358000, N'Màu sắc:	trắng
Phong cách:	Boho
Kiểu mẫu:	Hoa
Kiểu:	Bùng nổ
Vòng eo:	Vòng eo cao
Chiều dài:	Dài', N'https://img.ltwebstatic.com/images3_pi/2022/04/07/1649313145dd01f162c7625080d8a9783b988f19b1_thumbnail_600x.webp', CAST(N'2022-01-31' AS Date), 4)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (14, N'Váy nữ Xếp li màu trơn', 50, 210000, N'Màu sắc:	Màu Khaki
Phong cách:	Sẵn sàng
Kiểu mẫu:	màu trơn
Chi tiết:	Xếp li
Kiểu:	Xếp li
Vòng eo:	Vòng eo cao
Chiều dài:	Ngắn', N'https://img.ltwebstatic.com/images3_pi/2021/08/29/1630209119ae8bc213381a16b1a9384d4fda8a9aec_thumbnail_600x.webp', CAST(N'2022-05-26' AS Date), 4)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (15, N'Váy nữ Xếp li màu trơn', 130, 261000, N'Màu sắc:	Màu Kaki
Kiểu mẫu:	màu trơn
Chi tiết:	Xếp li
Kiểu:	Xếp li
Vòng eo:	Tự nhiên
Chiều dài:	Mini', N'https://img.ltwebstatic.com/images3_pi/2022/03/28/16484468381687c5ab2254c71bf0537942b0c55578_thumbnail_600x.webp', CAST(N'2022-03-01' AS Date), 4)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (16, N'Áo hai dây Gân đan Tương phản ràng buộc ', 230, 107000, N'Màu sắc:	trắng
Chi tiết:	Gân đan, Tương phản ràng buộc', N'https://img.ltwebstatic.com/images3_pi/2022/03/17/16474802130d60a2d513e6a5b46d0482077e9a2e46_thumbnail_600x.webp', CAST(N'2022-01-04' AS Date), 1)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (17, N'Bộ đồ hai mảnh nữ Chia Dây kéo Nút phía trước Sọc ca rô', 200, 316000, N'Màu sắc:	Màu tím  Violet
Phong cách:	Sẵn sàng
Kiểu mẫu:	Sọc ca rô
Chi tiết:	Chia, Dây kéo, Nút phía trước
Loại Áo:	Áo sơ mi
Các Loại Bottom:	Váy
Viền:	Cổ áo tây
Chiều dài tay:	Ngắn tay', N'https://img.ltwebstatic.com/images3_pi/2022/01/04/16412631907576eeda6c7d75b78f87b1e631e5523d_thumbnail_600x.webp', CAST(N'2022-06-06' AS Date), 5)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (18, N'Bộ thời trang Nút phía trước màu trơn', 122, 341000, N'Màu sắc:	Màu vàng
Phong cách:	Boho
Kiểu mẫu:	màu trơn
Chi tiết:	Nút phía trước
Loại Áo:	Áo nữ
Viền:	Cổ v
Chiều dài tay:	Ngắn tay
Loại tay áo:	Tay thường', N'https://img.ltwebstatic.com/images3_pi/2021/01/06/1609915828020a7478ce6c4d6359771b5181d6a98a_thumbnail_600x.webp', CAST(N'2022-05-29' AS Date), 5)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (19, N'Bộ thời trang Xù màu trơn', 99, 395000, N'Màu sắc:	trắng
Phong cách:	Boho
Kiểu mẫu:	màu trơn
Chi tiết:	Xù, Chia, xoắn lại, Dải chun, Nút phía trước
Loại Áo:	Áo nữ
Các Loại Bottom:	Váy
Áo sơ mi Vật liệu:	Sợi viscose
Áo sơ mi Thành phần:	100% Sợi viscose
Viền:	Sâu v cổ', N'https://img.ltwebstatic.com/images3_pi/2021/02/03/16123315085585dadec183326354adbc1bd69bc401_thumbnail_600x.webp', CAST(N'2022-04-05' AS Date), 5)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (20, N'Váy nữ Tách cao Nhiệt đới ', 80, 252000, N'Màu sắc:	Nhiều màu
Phong cách:	Boho
Kiểu mẫu:	Nhiệt đới
Chi tiết:	Tách cao
Kiểu:	Một Line
Vòng eo:	Vòng eo cao', N'https://img.ltwebstatic.com/images3_pi/2021/12/23/16402555336db915cccf200ace4878f6f10bf71ee1_thumbnail_600x.webp', CAST(N'2022-03-22' AS Date), 4)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (21, N'Váy nữ Thắt lưng', 300, 283000, N'Màu sắc:	Nhiều màu
Phong cách:	Boho
Kiểu mẫu:	Hoa
Chi tiết:	Trọn gói, Thắt lưng
Kiểu:	Một Line
Vòng eo:	Vòng eo cao
Chiều dài:	Dài', N'https://img.ltwebstatic.com/images3_pi/2022/01/01/164105174517264ed15cf8fbc44eb67060bef4db71_thumbnail_600x.webp', CAST(N'2022-03-01' AS Date), 4)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (22, N'Quần jean nữ Nút Túi Dây kéo màu trơn', 60, 575000, N'Màu sắc:	Rửa trung bình
Kiểu mẫu:	màu trơn
Phong cách quần jean:	Quần ống loe nhỏ
Kiểu:	Chân pháo sáng
loại đóng kín:	Dây kéo tích hợp
Chi tiết:	Nút, Túi, Dây kéo
Vòng eo:	Vòng eo cao', N'https://img.ltwebstatic.com/images3_pi/2022/04/27/165103787267464bb436ceb724f8a6fbe8e35ebbfb_thumbnail_600x.webp', CAST(N'2021-12-10' AS Date), 2)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (23, N'Quần nữ Nút Dây kéo màu trơn', 130, 302000, N'Màu sắc:	màu đen
Phong cách:	Giải trí
Kiểu mẫu:	màu trơn
Kiểu:	Chân thẳng
loại đóng kín:	Dây kéo tích hợp
Chi tiết:	Nút, Dây kéo
Vòng eo:	Vòng eo cao', N'https://img.ltwebstatic.com/images3_pi/2021/10/19/1634607178057d99a498f759b0257656af45002f71_thumbnail_600x.webp', CAST(N'2022-04-23' AS Date), 2)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (24, N'Quần nữ Nút Xếp li màu trơn Thanh lịch', 230, 368000, N'Màu sắc:	Cà phê nâu
Phong cách:	Thanh lịch
Kiểu mẫu:	màu trơn
Kiểu:	Chân thẳng
loại đóng kín:	Dây kéo tích hợp
Chi tiết:	Nút, Xếp li
Vòng eo:	Vòng eo cao', N'https://img.ltwebstatic.com/images3_pi/2022/05/13/16524243098db552aae96a365a2438ee8794f40a7f_thumbnail_600x.webp', CAST(N'2022-02-16' AS Date), 2)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (25, N'Quần Nút màu trơn', 180, 306000, N'Màu sắc:	màu đen
Phong cách:	Giải trí
Kiểu mẫu:	màu trơn
Kiểu:	Chân pháo sáng
loại đóng kín:	Dây kéo tích hợp
Chi tiết:	Nút, Túi, Dây kéo
Vòng eo:	Vòng eo cao', N'https://img.ltwebstatic.com/images3_pi/2020/12/24/1608777974404339003abe709977b09d7b4f7583d3_thumbnail_600x.webp', CAST(N'2022-04-21' AS Date), 2)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (26, N'Áo khoác nữ Nút phía trước màu trơn', 176, 410000, N'Màu sắc:	Màu xanh Ô liu
Phong cách:	Giải trí
Kiểu mẫu:	màu trơn
Chi tiết:	Nút phía trước
Kiểu:	Khác
Viền:	Vòng cổ
Chiều dài tay:	Tay áo dài
Loại tay áo:	Tay thường', N'https://img.ltwebstatic.com/images3_pi/2022/01/12/164196421731526d08eb5e56b9e197e9fd94fb6fa8_thumbnail_600x.webp', CAST(N'2022-03-11' AS Date), 6)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (27, N' Áo khoác nữ Dây kéo màu trơn', 123, 486000, N'Màu sắc:	màu đen
Phong cách:	Giải trí
Kiểu mẫu:	màu trơn
Chi tiết:	Dây kéo, Dây kéo
Kiểu:	Khác
Viền:	áo có mũ
Chiều dài tay:	Tay áo dài
Loại tay áo:	Thả vai', N'https://img.ltwebstatic.com/images3_pi/2021/11/22/16375640478fb35ba76b1c06b511687ee843238dd7_thumbnail_600x.webp', CAST(N'2022-01-23' AS Date), 6)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (28, N'Áo Blazer kiểu dáng ba lỗ', 234, 392000, N'Màu sắc:	màu đen
Phong cách:	Giải trí
Kiểu mẫu:	Lá thư
Kiểu:	Áo ba lỗ
Viền:	Cổ áo tây
Chiều dài tay:	Không tay', N'https://img.ltwebstatic.com/images3_pi/2021/06/17/16239155362871b404e8987b5bccd55b406b3ba896_thumbnail_600x.webp', CAST(N'2022-01-13' AS Date), 6)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (29, N'Áo Blazer cài nút phía trước màu đen trơn', 168, 664000, N'Màu sắc:	màu đen
Phong cách:	Giải trí
Kiểu mẫu:	màu trơn
Chi tiết:	Nút phía trước
Áo Tops & Quần Vật liệu:	Polyester
Áo Tops & Quần Thành phần:	97% Polyester, 3% Bông vải thun', N'https://img.ltwebstatic.com/images3_pi/2022/04/01/164878980940bc29a38af430534b6561b39410bc33_thumbnail_600x.webp', CAST(N'2022-02-22' AS Date), 6)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (30, N'Áo khoác nữ Nút phía trước màu trơn', 69, 136000, N'Màu sắc:	Màu be
Phong cách:	Giải trí
Kiểu mẫu:	màu trơn
Chi tiết:	Nút phía trước
Kiểu:	Xe tăng
Viền:	Vòng cổ', N'https://img.ltwebstatic.com/images3_pi/2022/05/10/16521712384cd3a5b06586b3ba0a06b504255d003e_thumbnail_600x.webp', CAST(N'2022-02-08' AS Date), 6)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (31, N'Áo thun nữ màu be họa tiết đơn giản', 96, 130000, N'Màu sắc:	Màu be
Phong cách:	Giải trí
Kiểu mẫu:	Lá thư
Viền:	Vòng cổ
Chiều dài tay:	Nửa tay
Loại tay áo:	Thả vai
Chiều dài:	Dài
Loại túi váy:	Áo chui', N'https://img.ltwebstatic.com/images3_pi/2022/01/06/164144705786d3e254f98cb81f80c66493863a2514_thumbnail_600x.webp', CAST(N'2022-03-12' AS Date), 1)
INSERT [dbo].[Product_HE161055] ([ProductId], [Name], [Quantity], [Price], [Description], [ImageURL], [CreatedDate], [CategoryId]) VALUES (40, N'Áo nhật linh cuteee', 100, 98000, N'hihihaha', N'https://img.ltwebstatic.com/images3_pi/2022/05/05/1651732633bc0b7d7bae49668a7284474e1a47e273_thumbnail_600x.webp', CAST(N'2019-01-01' AS Date), 2)
GO
SET IDENTITY_INSERT [dbo].[Shipping_HE161055] ON 

INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (1, N'Minh', N'0904430526', N'Hai Duong')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (2, N'Linh ', N'0867890567', N'Ha Noi')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (3, N'Hip', N'0123467987', N'Bac Ninh')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (4, N'Nhật Linh', N'0879653120', N'Hà Nam')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (5, N'Đức Anh', N'0123435678', N'Thái Bình')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (6, N'Nhật Hạ', N'0123467548', N'Nghệ Anh')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (7, N'Đức Anh ', N'078653421', N'Hà Nam')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (8, N'Minh', N'0867890567', N'Phả Lại, Chí Linh , Hải Dương')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (9, N'linh', N'0904430526', N'Hai Duong')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (10, N'linh', N'0904430526', N'Hà Nam')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (11, N'momo', N'0123467987', N'Bac Ninh')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (12, N'Minh', N'0867890567', N'Phả Lại, Chí Linh , Hải Dương')
INSERT [dbo].[Shipping_HE161055] ([id], [name], [phone], [address]) VALUES (13, N'Minh', N'0904430526', N'Hai Duong')
SET IDENTITY_INSERT [dbo].[Shipping_HE161055] OFF
GO
ALTER TABLE [dbo].[Orders_HE161055] ADD  CONSTRAINT [DF_Orders_HE161055_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Orders_HE161055]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account_HE161055] ([id])
GO
ALTER TABLE [dbo].[Orders_HE161055]  WITH CHECK ADD FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping_HE161055] ([id])
GO
ALTER TABLE [dbo].[OrdersDetail_HE161055]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders_HE161055] ([id])
GO
ALTER TABLE [dbo].[Product_HE161055]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category_HE161055] ([CategoryId])
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SE1625] SET  READ_WRITE 
GO
