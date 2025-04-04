USE master;
GO

-- Kiểm tra và xóa cơ sở dữ liệu group12 nếu đã tồn tại
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'group12')
BEGIN
    ALTER DATABASE group12 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE group12;
END
GO

-- Tạo cơ sở dữ liệu group12
CREATE DATABASE group12;
GO

USE [group12]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[contentBlog] [nvarchar](max) NULL,
	[thumbnail] [nvarchar](50) NULL,
	[date] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[color_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[color_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[color_name] [nvarchar](50) NOT NULL,
	[color_hex] [nvarchar](7) NOT NULL,
	[image_url] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NOT NULL,
	[total_price] [int] NULL,
	[user_id] [int] NULL,
	[order_status] [int] NULL,
	[address] [nvarchar](max) NULL,
	[payment_id] [int] NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK__Order__46596229801B02CF] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_item]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[color_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [int] NULL,
	[stock] [int] NOT NULL,
	[category_id] [int] NULL,
	[image] [nvarchar](50) NULL,
	[name] [nvarchar](max) NOT NULL,
	[gallery] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__47027DF5C0AB2993] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [nvarchar](20) NULL,
	[permission] [int] NOT NULL,
 CONSTRAINT [PK__Customer__CD65CB8539E7AE6F] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 17-Jun-24 9:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[wishlist_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [title], [contentBlog], [thumbnail], [date], [author]) VALUES (1, N'3 phong cách thời trang Cardigan cực kỳ trendy', N'Áo Cardigan là item rất dễ phối đồ, theo đó bạn đều có thể dễ dàng để biến tấu phong cách từ nữ tính nhẹ nhàng, trẻ trung cá tính cho đến độc đáo, sành điệu… Cho dù đó có là bất kỳ phong cách nào cũng không thể làm khó được áo Cardigan.', N'Thum1a.jpg', N'2022/10/12', N'Tung Tam')
INSERT [dbo].[Blog] ([id], [title], [contentBlog], [thumbnail], [date], [author]) VALUES (2, N'5 Items xuống phố mùa thu đông thoải mái, trẻ trung và thanh lịch', N'Mùa thu đông đang ngày càng cận kề kéo theo đó là những cơn gió đầu mùa. Lúc này cho ta cảm giác man mát và se lạnh khi vào buổi sáng và chiều tối, cùng với đó là nắng nóng vào buổi trưa. Vì vậy rất khó để bạn có thể lựa chọn được mình những items phù hợp với thời tiết mà lại thời trang.

Đi đầu cho xu hướng thời trang mới ưu tiên về sự thoải mái ZOFAL gửi đến bạn 5 items xuống phố vô cùng trẻ trung, bắt mắt và thời thường!', N'Thum2a.jpg', N'2023/09/15', N'DM Hieu')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItem] ON 

INSERT [dbo].[CartItem] ([cart_item_id], [user_id], [product_id], [color_id], [quantity]) VALUES (2, 1, 1, 3, 1)
INSERT [dbo].[CartItem] ([cart_item_id], [user_id], [product_id], [color_id], [quantity]) VALUES (3, 1, 1, 2, 1)
INSERT [dbo].[CartItem] ([cart_item_id], [user_id], [product_id], [color_id], [quantity]) VALUES (4, 1, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[CartItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [name], [image]) VALUES (1, N'Đồ bộ', N'DB01a.jpg')
INSERT [dbo].[Category] ([category_id], [name], [image]) VALUES (2, N'Áo thun', N'AT01a.jpg')
INSERT [dbo].[Category] ([category_id], [name], [image]) VALUES (3, N'Áo khoác', N'AK01a.jpg')
INSERT [dbo].[Category] ([category_id], [name], [image]) VALUES (4, N'Quần âu', N'QA01a.jpg')
INSERT [dbo].[Category] ([category_id], [name], [image]) VALUES (5, N'Đầm/Váy', N'DV01a.jpg')
INSERT [dbo].[Category] ([category_id], [name], [image]) VALUES (6, N'Quần nữ', N'QN01a.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (1, 1, N'Da', N'#e2b999', N'DB01a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (2, 1, N'Trắng', N'#c8c8c6', N'DB01b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (3, 1, N'Đen', N'#1a1b1f', N'DB01c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (4, 3, N'Xám', N'#b4b5ba', N'DB02a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (7, 3, N'Đen', N'#1a1b1f', N'DB02b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (8, 3, N'Trắng', N'#c8c8c6', N'DB02c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (9, 4, N'Xanh dương', N'#193282', N'DB03a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (10, 4, N'Trắng', N'#c8c8c6', N'DB03b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (11, 4, N'Đen', N'#1a1b1f', N'DB03c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (12, 5, N'Đen', N'#1a1b1f', N'DB04a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (13, 5, N'Đỏ', N'#5c0317', N'DB04b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (15, 6, N'Đen', N'#1a1b1c', N'DB05a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (16, 6, N'Xanh lá', N'#8e8d78', N'DB05b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (18, 7, N'Trắng', N'#c8c8c6', N'AT01a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (19, 7, N'Đen', N'#1a1b1f', N'AT01b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (20, 7, N'Đỏ', N'#5c0317', N'AT01c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (22, 8, N'Đen', N'#1a1b1f', N'AT02a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (24, 8, N'Trắng', N'#c8c8c6', N'AT02b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (25, 8, N'Nâu', N'#947a69', N'AT02c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (27, 9, N'Đen', N'#1a1b1f', N'AT03a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (28, 9, N'Trắng', N'#c8c8c6', N'AT03b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (29, 9, N'Kem', N'#efe6dd', N'AT03c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (30, 10, N'Đen', N'#1a1b1f', N'AT04a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (31, 10, N'Đỏ', N'#5c0317', N'AT04b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (32, 10, N'Trắng', N'#c8c8c6', N'AT04c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (33, 11, N'Xanh dương', N'#193282', N'AT05a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (34, 11, N'Trắng', N'#c8c8c6', N'AT05b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (35, 11, N'Đen', N'#1a1b1f', N'AT05c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (36, 12, N'Đen', N'#1a1b1f', N'AK01a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (37, 12, N'Đỏ', N'#5c0317', N'AK01b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (38, 12, N'Xanh dương', N'#193282', N'AK01c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (39, 13, N'Đen', N'#1a1b1f', N'AK02a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (40, 13, N'Trắng', N'#c8c8c6', N'AK02b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (41, 13, N'Đỏ', N'#5c0317', N'AK02c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (42, 14, N'Đen', N'#1a1b1f', N'AK03a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (43, 14, N'Xanh dương', N'#193282', N'AK03b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (44, 14, N'Kem', N'#efe6dd', N'AK03c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (45, 15, N'Đen', N'#1a1b1f', N'AK04a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (46, 15, N'Trắng', N'#c8c8c6', N'AK04b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (47, 15, N'Xám', N'#b4b5ba', N'AK04c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (48, 16, N'Đen', N'#1a1b1f', N'AK05a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (49, 16, N'Xám', N'#b4b5ba', N'AK05b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (50, 16, N'Kem', N'#efe6dd', N'AK05c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (51, 17, N'Đen', N'#1a1b1f', N'QA01a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (52, 17, N'Trắng', N'#c8c8c6', N'QA01b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (53, 17, N'Xanh dương', N'#193282', N'QA01c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (54, 18, N'Đen', N'#1a1b1f', N'QA02a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (55, 18, N'Trắng', N'#c8c8c6', N'QA02b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (56, 18, N'Xám', N'#b4b5ba', N'QA02c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (57, 19, N'Đen', N'#1a1b1f', N'QA03a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (58, 19, N'Trắng', N'#c8c8c6', N'QA03b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (59, 19, N'Nâu', N'#947a69', N'QA03c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (60, 20, N'Đen', N'#1a1b1f', N'QA04a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (61, 20, N'Kem', N'#efe6dd', N'QA04b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (62, 20, N'Xám', N'#b4b5ba', N'QA04c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (63, 21, N'Đen', N'#1a1b1f', N'QA05a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (64, 21, N'Trắng', N'#c8c8c6', N'QA05b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (66, 21, N'Nâu', N'#947a69', N'QA05c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (67, 22, N'Trắng', N'#c8c8c6', N'DV01a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (68, 22, N'Đen', N'#1a1b1f', N'DV01b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (69, 22, N'Xanh dương', N'#193282', N'DV01c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (70, 23, N'Xanh lá', N'#8e8d78', N'DV02a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (71, 23, N'Hồng', N'#e8c5c9', N'DV02b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (72, 23, N'Trắng', N'#c8c8c6', N'DV02c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (73, 24, N'Xanh dương', N'#193282', N'DV03a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (74, 24, N'Hồng', N'#e8c5c9', N'DV03b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (75, 24, N'Trắng', N'#c8c8c6', N'DV03c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (76, 25, N'Đen', N'#1a1b1f', N'DV04a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (77, 25, N'Xanh dương', N'#193282', N'DV04b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (78, 25, N'Trắng', N'#c8c8c6', N'DV04c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (79, 26, N'Hồng', N'#e8c5c9', N'DV05a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (80, 26, N'Kem', N'#efe6dd', N'DV05b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (81, 26, N'Trắng', N'#c8c8c6', N'DV05c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (82, 27, N'Đen', N'#1a1b1f', N'QN01a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (83, 27, N'Xanh dương', N'#193282', N'QN01b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (84, 27, N'Trắng', N'#c8c8c6', N'QN01c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (86, 28, N'Đen', N'#1a1b1f', N'QN02a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (87, 28, N'Hồng', N'#e8c5c9', N'QN02b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (88, 28, N'Trắng', N'#c8c8c6', N'QN02c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (90, 29, N'Đen', N'#1a1b1f', N'QN03a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (91, 29, N'Trắng', N'#c8c8c6', N'QN03b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (92, 29, N'Hồng', N'#e8c5c9', N'QN03c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (93, 30, N'Đen', N'#1a1b1f', N'QN04a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (94, 30, N'Trắng', N'#c8c8c6', N'QN04b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (95, 30, N'Hồng', N'#e8c5c9', N'QN04c.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (96, 31, N'Đen', N'#1a1b1f', N'QN05a.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (97, 31, N'Trắng', N'#c8c8c6', N'QN05b.jpg')
INSERT [dbo].[Color] ([color_id], [product_id], [color_name], [color_hex], [image_url]) VALUES (98, 31, N'Nâu', N'#947a69', N'QN05c.jpg')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (8, CAST(N'2024-06-03' AS Date), 239000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0123456789')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (10, CAST(N'2024-06-03' AS Date), 324000, 2, 0, N'Tiên Trang,Quảng Xương,Thanh Hóa', 4, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (11, CAST(N'2024-06-03' AS Date), 299000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (12, CAST(N'2024-06-06' AS Date), 516000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (13, CAST(N'2024-06-06' AS Date), 795000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (14, CAST(N'2024-06-06' AS Date), 390000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 2, N'0812734897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (15, CAST(N'2024-06-06' AS Date), 1570000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 1, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (16, CAST(N'2024-06-06' AS Date), 427000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 4, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (17, CAST(N'2024-06-06' AS Date), 386000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (18, CAST(N'2024-06-06' AS Date), 1017000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (19, CAST(N'2024-06-06' AS Date), 546000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (20, CAST(N'2024-06-06' AS Date), 849000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 1, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (21, CAST(N'2024-06-06' AS Date), 684000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 1, N'0812734897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (22, CAST(N'2024-06-06' AS Date), 960000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (23, CAST(N'2024-06-06' AS Date), 608000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (24, CAST(N'2024-06-06' AS Date), 664000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (25, CAST(N'2024-06-01' AS Date), 566000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 3, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (26, CAST(N'2024-06-01' AS Date), 800000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 3, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (27, CAST(N'2024-06-01' AS Date), 540000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (28, CAST(N'2024-05-18' AS Date), 574000, 3, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 1, N'0812734897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (29, CAST(N'2024-05-18' AS Date), 595000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 2, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (30, CAST(N'2024-05-18' AS Date), 1000000, 3, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 4, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (31, CAST(N'2024-05-18' AS Date), 379000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (32, CAST(N'2024-05-18' AS Date), 477000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (33, CAST(N'2024-05-10' AS Date), 603000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 2, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (34, CAST(N'2024-05-10' AS Date), 717000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 3, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (35, CAST(N'2024-05-10' AS Date), 467000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 1, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (36, CAST(N'2024-05-10' AS Date), 630000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (37, CAST(N'2024-05-10' AS Date), 858000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 2, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (38, CAST(N'2024-04-26' AS Date), 450000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (39, CAST(N'2024-04-26' AS Date), 768000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (40, CAST(N'2024-04-26' AS Date), 605000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 1, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (41, CAST(N'2024-04-26' AS Date), 1279000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (42, CAST(N'2024-04-26' AS Date), 1832000, 3, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 1, N'0812734897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (43, CAST(N'2024-04-26' AS Date), 1008000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (44, CAST(N'2024-04-07' AS Date), 730000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 3, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (45, CAST(N'2024-04-07' AS Date), 338000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 4, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (46, CAST(N'2024-04-07' AS Date), 654000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 2, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (47, CAST(N'2024-04-07' AS Date), 957000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (48, CAST(N'2024-04-07' AS Date), 1350000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (49, CAST(N'2024-03-19' AS Date), 924000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 4, N'0812734897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (50, CAST(N'2024-03-19' AS Date), 537000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 3, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (51, CAST(N'2024-03-19' AS Date), 669000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (52, CAST(N'2024-03-19' AS Date), 1308000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 3, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (53, CAST(N'2024-03-19' AS Date), 1148000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (54, CAST(N'2024-03-11' AS Date), 536000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 4, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (55, CAST(N'2024-03-11' AS Date), 2233000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 3, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (56, CAST(N'2024-03-11' AS Date), 1019000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 2, N'0812734897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (57, CAST(N'2024-03-11' AS Date), 1098000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (58, CAST(N'2024-03-11' AS Date), 1056000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 4, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (59, CAST(N'2024-02-22' AS Date), 787000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (60, CAST(N'2024-02-22' AS Date), 1178000, 3, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 3, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (61, CAST(N'2024-02-22' AS Date), 1148000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 3, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (62, CAST(N'2024-02-04' AS Date), 1552000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (63, CAST(N'2024-02-04' AS Date), 957000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 3, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (64, CAST(N'2024-02-04' AS Date), 858000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 4, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (65, CAST(N'2024-02-04' AS Date), 1017000, 3, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 1, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (66, CAST(N'2024-02-04' AS Date), 667000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 2, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (67, CAST(N'2024-01-27' AS Date), 978000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 4, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (68, CAST(N'2024-01-27' AS Date), 990000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (69, CAST(N'2024-01-27' AS Date), 1126000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 2, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (70, CAST(N'2024-01-27' AS Date), 540000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 2, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (71, CAST(N'2024-01-27' AS Date), 596000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (72, CAST(N'2024-01-15' AS Date), 1430000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 3, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (73, CAST(N'2024-01-15' AS Date), 708000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (74, CAST(N'2024-01-15' AS Date), 456000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (75, CAST(N'2024-01-15' AS Date), 694000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 2, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (76, CAST(N'2024-01-15' AS Date), 979000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (77, CAST(N'2024-01-15' AS Date), 925000, 2, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 3, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (78, CAST(N'2024-01-07' AS Date), 476000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 2, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (79, CAST(N'2024-01-07' AS Date), 750000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 1, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (80, CAST(N'2024-01-07' AS Date), 1198000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 3, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (81, CAST(N'2023-12-04' AS Date), 1770000, 3, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (82, CAST(N'2023-10-20' AS Date), 1464000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 3, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (83, CAST(N'2023-07-16' AS Date), 2180000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 2, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (84, CAST(N'2023-10-08' AS Date), 1598000, 3, 2, N'Nguyên Xá,Bắc Từ Liêm,Hà Nội', 2, N'0812734897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (85, CAST(N'2022-11-09' AS Date), 1724000, 2, 2, N'Tiên Trang,Quảng Xương,Thanh Hóa', 1, N'0869241304')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (86, CAST(N'2022-05-04' AS Date), 1621000, 3, 2, N'Thị trấn Chờ,Yên Phong, Bắc Ninh', 4, N'0914417458')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (87, CAST(N'2022-03-01' AS Date), 2496000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 2, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (88, CAST(N'2024-06-07' AS Date), 124000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 2, N'0869252415')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (89, CAST(N'2024-06-07' AS Date), 180000, 2, 1, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 3, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (90, CAST(N'2024-06-09' AS Date), 159000, 2, 1, N'Tiên Trang,Quảng Xương,Thanh Hóa', 1, N'0789252897')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (92, CAST(N'2024-06-09' AS Date), 119000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (93, CAST(N'2024-06-09' AS Date), 119000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (94, CAST(N'2024-06-09' AS Date), 159000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (96, CAST(N'2024-06-09' AS Date), 180000, 2, 2, N'Quỳnh Côi,Quỳnh Phụ, Thái Bình', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (97, CAST(N'2024-06-09' AS Date), 570000, 2, 2, N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', 1, N'0134567890')
INSERT [dbo].[Order] ([order_id], [order_date], [total_price], [user_id], [order_status], [address], [payment_id], [phone]) VALUES (1090, CAST(N'2024-06-16' AS Date), 159000, 2, 1, N'Tiên Trang,Quảng Xương,Thanh Hóa', 1, N'0869241304')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_item] ON 

INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (13, 1, CAST(119000.00 AS Decimal(18, 2)), 31, 8, 97)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (14, 2, CAST(60000.00 AS Decimal(18, 2)), 25, 8, 77)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (17, 1, CAST(124000.00 AS Decimal(18, 2)), 5, 10, 12)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (18, 1, CAST(200000.00 AS Decimal(18, 2)), 9, 10, 28)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (19, 1, CAST(99000.00 AS Decimal(18, 2)), 6, 11, 15)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (20, 1, CAST(200000.00 AS Decimal(18, 2)), 9, 11, 29)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (21, 4, CAST(129000.00 AS Decimal(18, 2)), 1, 12, 2)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (22, 5, CAST(159000.00 AS Decimal(18, 2)), 3, 13, 4)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (23, 3, CAST(60000.00 AS Decimal(18, 2)), 25, 14, 77)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (24, 1, CAST(60000.00 AS Decimal(18, 2)), 25, 14, 78)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (25, 1, CAST(150000.00 AS Decimal(18, 2)), 20, 14, 61)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (26, 2, CAST(250000.00 AS Decimal(18, 2)), 15, 15, 46)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (27, 1, CAST(250000.00 AS Decimal(18, 2)), 15, 15, 46)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (28, 1, CAST(250000.00 AS Decimal(18, 2)), 15, 15, 46)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (29, 2, CAST(285000.00 AS Decimal(18, 2)), 13, 15, 40)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (30, 2, CAST(79000.00 AS Decimal(18, 2)), 22, 16, 69)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (31, 1, CAST(89000.00 AS Decimal(18, 2)), 26, 16, 81)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (32, 1, CAST(180000.00 AS Decimal(18, 2)), 8, 16, 25)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (33, 1, CAST(99000.00 AS Decimal(18, 2)), 6, 17, 15)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (34, 1, CAST(287000.00 AS Decimal(18, 2)), 18, 17, 55)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (35, 3, CAST(159000.00 AS Decimal(18, 2)), 3, 18, 8)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (36, 2, CAST(270000.00 AS Decimal(18, 2)), 29, 18, 92)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (37, 3, CAST(139000.00 AS Decimal(18, 2)), 4, 19, 9)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (38, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 19, 3)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (39, 1, CAST(279000.00 AS Decimal(18, 2)), 16, 20, 49)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (40, 3, CAST(190000.00 AS Decimal(18, 2)), 10, 20, 31)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (41, 2, CAST(287000.00 AS Decimal(18, 2)), 18, 21, 55)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (42, 1, CAST(110000.00 AS Decimal(18, 2)), 24, 21, 73)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (43, 2, CAST(300000.00 AS Decimal(18, 2)), 14, 22, 42)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (44, 2, CAST(180000.00 AS Decimal(18, 2)), 8, 22, 24)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (45, 1, CAST(139000.00 AS Decimal(18, 2)), 4, 23, 9)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (46, 1, CAST(139000.00 AS Decimal(18, 2)), 4, 23, 10)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (47, 3, CAST(110000.00 AS Decimal(18, 2)), 24, 23, 75)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (48, 2, CAST(270000.00 AS Decimal(18, 2)), 29, 24, 92)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (49, 1, CAST(124000.00 AS Decimal(18, 2)), 5, 24, 12)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (50, 2, CAST(124000.00 AS Decimal(18, 2)), 5, 25, 13)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (51, 1, CAST(159000.00 AS Decimal(18, 2)), 3, 25, 7)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (52, 1, CAST(159000.00 AS Decimal(18, 2)), 3, 25, 8)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (53, 2, CAST(200000.00 AS Decimal(18, 2)), 27, 26, 83)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (54, 2, CAST(200000.00 AS Decimal(18, 2)), 27, 26, 84)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (55, 3, CAST(90000.00 AS Decimal(18, 2)), 7, 27, 19)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (56, 3, CAST(90000.00 AS Decimal(18, 2)), 7, 27, 20)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (57, 4, CAST(99000.00 AS Decimal(18, 2)), 6, 28, 16)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (58, 2, CAST(89000.00 AS Decimal(18, 2)), 26, 28, 79)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (59, 3, CAST(119000.00 AS Decimal(18, 2)), 23, 29, 72)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (60, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 29, 71)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (61, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 29, 70)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (62, 1, CAST(200000.00 AS Decimal(18, 2)), 9, 30, 27)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (63, 2, CAST(200000.00 AS Decimal(18, 2)), 9, 30, 28)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (64, 2, CAST(200000.00 AS Decimal(18, 2)), 9, 30, 29)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (65, 2, CAST(125000.00 AS Decimal(18, 2)), 30, 31, 95)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (66, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 31, 1)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (67, 3, CAST(159000.00 AS Decimal(18, 2)), 3, 32, 7)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (68, 2, CAST(159000.00 AS Decimal(18, 2)), 3, 33, 8)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (69, 1, CAST(285000.00 AS Decimal(18, 2)), 13, 33, 40)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (70, 1, CAST(159000.00 AS Decimal(18, 2)), 3, 34, 4)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (71, 1, CAST(279000.00 AS Decimal(18, 2)), 16, 34, 48)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (72, 1, CAST(279000.00 AS Decimal(18, 2)), 16, 34, 49)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (73, 2, CAST(79000.00 AS Decimal(18, 2)), 22, 35, 67)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (74, 1, CAST(230000.00 AS Decimal(18, 2)), 12, 35, 38)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (75, 1, CAST(79000.00 AS Decimal(18, 2)), 22, 35, 69)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (76, 1, CAST(124000.00 AS Decimal(18, 2)), 5, 36, 12)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (77, 2, CAST(124000.00 AS Decimal(18, 2)), 5, 36, 13)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (78, 1, CAST(129000.00 AS Decimal(18, 2)), 21, 36, 64)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (79, 1, CAST(129000.00 AS Decimal(18, 2)), 21, 36, 66)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (80, 2, CAST(159000.00 AS Decimal(18, 2)), 3, 37, 7)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (81, 3, CAST(180000.00 AS Decimal(18, 2)), 28, 37, 87)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (82, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 38, 18)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (83, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 38, 20)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (84, 1, CAST(270000.00 AS Decimal(18, 2)), 29, 38, 91)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (85, 2, CAST(99000.00 AS Decimal(18, 2)), 6, 39, 16)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (86, 2, CAST(285000.00 AS Decimal(18, 2)), 13, 39, 40)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (87, 3, CAST(129000.00 AS Decimal(18, 2)), 1, 40, 2)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (88, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 40, 2)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (89, 1, CAST(89000.00 AS Decimal(18, 2)), 26, 40, 79)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (90, 4, CAST(200000.00 AS Decimal(18, 2)), 27, 41, 83)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (91, 1, CAST(200000.00 AS Decimal(18, 2)), 27, 41, 84)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (92, 1, CAST(279000.00 AS Decimal(18, 2)), 16, 41, 50)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (93, 2, CAST(139000.00 AS Decimal(18, 2)), 4, 42, 9)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (94, 1, CAST(119000.00 AS Decimal(18, 2)), 31, 42, 97)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (95, 5, CAST(287000.00 AS Decimal(18, 2)), 18, 42, 56)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (96, 2, CAST(129000.00 AS Decimal(18, 2)), 1, 43, 3)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (97, 2, CAST(250000.00 AS Decimal(18, 2)), 15, 43, 46)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (98, 1, CAST(250000.00 AS Decimal(18, 2)), 15, 43, 47)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (99, 2, CAST(90000.00 AS Decimal(18, 2)), 7, 44, 20)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (100, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 44, 19)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (101, 2, CAST(230000.00 AS Decimal(18, 2)), 12, 44, 38)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (102, 2, CAST(90000.00 AS Decimal(18, 2)), 7, 45, 19)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (103, 1, CAST(79000.00 AS Decimal(18, 2)), 22, 45, 67)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (104, 1, CAST(79000.00 AS Decimal(18, 2)), 22, 45, 69)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (105, 3, CAST(99000.00 AS Decimal(18, 2)), 6, 46, 16)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (106, 1, CAST(99000.00 AS Decimal(18, 2)), 6, 46, 15)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (107, 2, CAST(129000.00 AS Decimal(18, 2)), 21, 46, 66)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (108, 2, CAST(139000.00 AS Decimal(18, 2)), 4, 47, 10)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (109, 1, CAST(139000.00 AS Decimal(18, 2)), 4, 47, 11)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (110, 2, CAST(270000.00 AS Decimal(18, 2)), 29, 47, 91)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (111, 2, CAST(300000.00 AS Decimal(18, 2)), 14, 48, 44)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (112, 2, CAST(250000.00 AS Decimal(18, 2)), 15, 48, 47)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (113, 1, CAST(250000.00 AS Decimal(18, 2)), 15, 48, 46)
GO
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (114, 3, CAST(159000.00 AS Decimal(18, 2)), 3, 49, 8)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (115, 1, CAST(149000.00 AS Decimal(18, 2)), 17, 49, 53)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (116, 2, CAST(149000.00 AS Decimal(18, 2)), 17, 49, 53)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (117, 2, CAST(90000.00 AS Decimal(18, 2)), 7, 50, 19)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (118, 2, CAST(119000.00 AS Decimal(18, 2)), 23, 50, 71)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (119, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 50, 72)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (120, 1, CAST(159000.00 AS Decimal(18, 2)), 3, 51, 4)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (121, 2, CAST(170000.00 AS Decimal(18, 2)), 11, 51, 33)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (122, 1, CAST(170000.00 AS Decimal(18, 2)), 11, 51, 34)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (123, 1, CAST(180000.00 AS Decimal(18, 2)), 28, 52, 88)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (124, 2, CAST(285000.00 AS Decimal(18, 2)), 13, 52, 40)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (125, 2, CAST(279000.00 AS Decimal(18, 2)), 16, 52, 49)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (126, 2, CAST(124000.00 AS Decimal(18, 2)), 5, 53, 13)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (127, 2, CAST(180000.00 AS Decimal(18, 2)), 8, 53, 24)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (128, 3, CAST(180000.00 AS Decimal(18, 2)), 8, 53, 24)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (129, 2, CAST(159000.00 AS Decimal(18, 2)), 3, 54, 7)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (130, 1, CAST(139000.00 AS Decimal(18, 2)), 4, 54, 9)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (131, 1, CAST(79000.00 AS Decimal(18, 2)), 22, 54, 68)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (132, 5, CAST(285000.00 AS Decimal(18, 2)), 13, 55, 40)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (133, 2, CAST(285000.00 AS Decimal(18, 2)), 13, 55, 40)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (134, 2, CAST(119000.00 AS Decimal(18, 2)), 31, 55, 98)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (135, 2, CAST(300000.00 AS Decimal(18, 2)), 19, 56, 59)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (136, 1, CAST(300000.00 AS Decimal(18, 2)), 19, 56, 58)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (137, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 56, 71)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (138, 2, CAST(99000.00 AS Decimal(18, 2)), 6, 57, 15)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (139, 1, CAST(300000.00 AS Decimal(18, 2)), 14, 57, 44)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (140, 2, CAST(300000.00 AS Decimal(18, 2)), 14, 57, 43)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (141, 2, CAST(270000.00 AS Decimal(18, 2)), 29, 58, 92)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (142, 2, CAST(129000.00 AS Decimal(18, 2)), 1, 58, 3)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (143, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 58, 1)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (144, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 58, 1)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (145, 2, CAST(129000.00 AS Decimal(18, 2)), 1, 59, 1)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (146, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 59, 3)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (147, 2, CAST(200000.00 AS Decimal(18, 2)), 27, 59, 84)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (148, 2, CAST(139000.00 AS Decimal(18, 2)), 4, 60, 9)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (149, 4, CAST(150000.00 AS Decimal(18, 2)), 20, 60, 61)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (150, 2, CAST(150000.00 AS Decimal(18, 2)), 20, 60, 62)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (151, 2, CAST(99000.00 AS Decimal(18, 2)), 6, 61, 16)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (152, 2, CAST(190000.00 AS Decimal(18, 2)), 10, 61, 30)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (153, 3, CAST(190000.00 AS Decimal(18, 2)), 10, 61, 32)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (154, 3, CAST(124000.00 AS Decimal(18, 2)), 5, 62, 13)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (155, 2, CAST(110000.00 AS Decimal(18, 2)), 24, 62, 75)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (156, 1, CAST(110000.00 AS Decimal(18, 2)), 24, 62, 74)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (157, 1, CAST(170000.00 AS Decimal(18, 2)), 11, 62, 35)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (158, 1, CAST(170000.00 AS Decimal(18, 2)), 11, 62, 34)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (159, 3, CAST(170000.00 AS Decimal(18, 2)), 11, 62, 33)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (160, 1, CAST(99000.00 AS Decimal(18, 2)), 6, 63, 15)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (161, 2, CAST(300000.00 AS Decimal(18, 2)), 14, 63, 42)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (162, 2, CAST(129000.00 AS Decimal(18, 2)), 1, 63, 2)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (163, 2, CAST(159000.00 AS Decimal(18, 2)), 3, 64, 4)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (164, 1, CAST(180000.00 AS Decimal(18, 2)), 28, 64, 87)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (165, 2, CAST(180000.00 AS Decimal(18, 2)), 28, 64, 88)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (166, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 65, 1)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (167, 2, CAST(119000.00 AS Decimal(18, 2)), 23, 65, 72)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (168, 1, CAST(250000.00 AS Decimal(18, 2)), 15, 65, 46)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (169, 2, CAST(200000.00 AS Decimal(18, 2)), 9, 65, 28)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (170, 2, CAST(89000.00 AS Decimal(18, 2)), 26, 66, 80)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (171, 1, CAST(89000.00 AS Decimal(18, 2)), 26, 66, 79)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (172, 2, CAST(200000.00 AS Decimal(18, 2)), 27, 66, 84)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (173, 2, CAST(139000.00 AS Decimal(18, 2)), 4, 67, 11)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (174, 2, CAST(200000.00 AS Decimal(18, 2)), 27, 67, 83)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (175, 2, CAST(150000.00 AS Decimal(18, 2)), 20, 67, 62)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (176, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 68, 1)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (177, 2, CAST(287000.00 AS Decimal(18, 2)), 18, 68, 56)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (178, 1, CAST(287000.00 AS Decimal(18, 2)), 18, 68, 55)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (179, 3, CAST(139000.00 AS Decimal(18, 2)), 4, 69, 9)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (180, 1, CAST(139000.00 AS Decimal(18, 2)), 4, 69, 10)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (181, 2, CAST(285000.00 AS Decimal(18, 2)), 13, 69, 41)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (182, 3, CAST(90000.00 AS Decimal(18, 2)), 7, 70, 20)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (183, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 70, 18)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (184, 1, CAST(180000.00 AS Decimal(18, 2)), 8, 70, 22)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (185, 2, CAST(99000.00 AS Decimal(18, 2)), 6, 71, 15)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (186, 2, CAST(139000.00 AS Decimal(18, 2)), 4, 71, 10)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (187, 2, CAST(60000.00 AS Decimal(18, 2)), 25, 71, 77)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (188, 3, CAST(300000.00 AS Decimal(18, 2)), 19, 72, 58)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (189, 1, CAST(300000.00 AS Decimal(18, 2)), 19, 72, 59)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (190, 1, CAST(230000.00 AS Decimal(18, 2)), 12, 72, 36)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (191, 4, CAST(90000.00 AS Decimal(18, 2)), 7, 73, 20)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (192, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 73, 19)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (193, 2, CAST(129000.00 AS Decimal(18, 2)), 21, 73, 64)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (194, 1, CAST(79000.00 AS Decimal(18, 2)), 22, 74, 67)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (195, 2, CAST(129000.00 AS Decimal(18, 2)), 1, 74, 2)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (196, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 74, 72)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (197, 2, CAST(99000.00 AS Decimal(18, 2)), 6, 75, 15)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (198, 3, CAST(124000.00 AS Decimal(18, 2)), 5, 75, 13)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (199, 1, CAST(124000.00 AS Decimal(18, 2)), 5, 75, 12)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (200, 3, CAST(200000.00 AS Decimal(18, 2)), 27, 76, 84)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (201, 1, CAST(79000.00 AS Decimal(18, 2)), 22, 76, 68)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (202, 1, CAST(300000.00 AS Decimal(18, 2)), 14, 76, 44)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (203, 3, CAST(159000.00 AS Decimal(18, 2)), 3, 77, 8)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (204, 2, CAST(149000.00 AS Decimal(18, 2)), 17, 77, 51)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (205, 1, CAST(150000.00 AS Decimal(18, 2)), 20, 77, 62)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (206, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 78, 20)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (207, 3, CAST(89000.00 AS Decimal(18, 2)), 26, 78, 81)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (208, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 78, 71)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (209, 2, CAST(110000.00 AS Decimal(18, 2)), 24, 79, 73)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (210, 1, CAST(230000.00 AS Decimal(18, 2)), 12, 79, 36)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (211, 2, CAST(150000.00 AS Decimal(18, 2)), 20, 79, 60)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (212, 2, CAST(159000.00 AS Decimal(18, 2)), 3, 80, 4)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (213, 2, CAST(170000.00 AS Decimal(18, 2)), 11, 80, 33)
GO
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (214, 3, CAST(180000.00 AS Decimal(18, 2)), 28, 80, 86)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (215, 2, CAST(90000.00 AS Decimal(18, 2)), 7, 81, 18)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (216, 2, CAST(119000.00 AS Decimal(18, 2)), 23, 81, 71)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (217, 4, CAST(119000.00 AS Decimal(18, 2)), 23, 81, 72)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (218, 1, CAST(129000.00 AS Decimal(18, 2)), 21, 81, 64)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (219, 3, CAST(129000.00 AS Decimal(18, 2)), 1, 81, 3)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (220, 2, CAST(180000.00 AS Decimal(18, 2)), 28, 81, 87)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (221, 3, CAST(159000.00 AS Decimal(18, 2)), 3, 82, 4)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (222, 2, CAST(110000.00 AS Decimal(18, 2)), 24, 82, 73)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (223, 1, CAST(110000.00 AS Decimal(18, 2)), 24, 82, 74)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (224, 2, CAST(180000.00 AS Decimal(18, 2)), 28, 82, 88)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (225, 3, CAST(99000.00 AS Decimal(18, 2)), 6, 82, 16)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (226, 2, CAST(200000.00 AS Decimal(18, 2)), 9, 83, 27)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (227, 1, CAST(170000.00 AS Decimal(18, 2)), 11, 83, 33)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (228, 3, CAST(200000.00 AS Decimal(18, 2)), 27, 83, 84)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (229, 1, CAST(60000.00 AS Decimal(18, 2)), 25, 83, 76)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (230, 3, CAST(287000.00 AS Decimal(18, 2)), 18, 83, 54)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (231, 1, CAST(89000.00 AS Decimal(18, 2)), 26, 83, 81)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (232, 3, CAST(90000.00 AS Decimal(18, 2)), 7, 84, 18)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (233, 3, CAST(124000.00 AS Decimal(18, 2)), 5, 84, 13)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (234, 2, CAST(279000.00 AS Decimal(18, 2)), 16, 84, 49)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (235, 2, CAST(89000.00 AS Decimal(18, 2)), 26, 84, 79)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (236, 2, CAST(110000.00 AS Decimal(18, 2)), 24, 84, 75)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (237, 2, CAST(190000.00 AS Decimal(18, 2)), 10, 85, 30)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (238, 1, CAST(190000.00 AS Decimal(18, 2)), 10, 85, 31)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (239, 1, CAST(230000.00 AS Decimal(18, 2)), 12, 85, 36)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (240, 2, CAST(79000.00 AS Decimal(18, 2)), 22, 85, 69)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (241, 2, CAST(125000.00 AS Decimal(18, 2)), 30, 85, 93)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (242, 1, CAST(129000.00 AS Decimal(18, 2)), 1, 85, 2)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (243, 3, CAST(129000.00 AS Decimal(18, 2)), 1, 85, 3)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (244, 2, CAST(159000.00 AS Decimal(18, 2)), 3, 86, 7)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (245, 1, CAST(139000.00 AS Decimal(18, 2)), 4, 86, 9)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (246, 2, CAST(90000.00 AS Decimal(18, 2)), 7, 86, 18)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (247, 3, CAST(285000.00 AS Decimal(18, 2)), 13, 86, 40)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (248, 1, CAST(129000.00 AS Decimal(18, 2)), 21, 86, 66)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (249, 2, CAST(270000.00 AS Decimal(18, 2)), 29, 87, 92)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (250, 1, CAST(279000.00 AS Decimal(18, 2)), 16, 87, 48)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (251, 1, CAST(79000.00 AS Decimal(18, 2)), 22, 87, 67)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (252, 3, CAST(170000.00 AS Decimal(18, 2)), 11, 87, 33)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (253, 2, CAST(139000.00 AS Decimal(18, 2)), 4, 87, 10)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (254, 3, CAST(270000.00 AS Decimal(18, 2)), 29, 87, 91)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (255, 1, CAST(124000.00 AS Decimal(18, 2)), 5, 88, 13)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (256, 1, CAST(180000.00 AS Decimal(18, 2)), 8, 89, 24)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (257, 1, CAST(159000.00 AS Decimal(18, 2)), 3, 90, 8)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (259, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 92, 71)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (260, 1, CAST(119000.00 AS Decimal(18, 2)), 23, 93, 72)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (261, 1, CAST(159000.00 AS Decimal(18, 2)), 3, 94, 7)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (263, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 96, 19)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (264, 1, CAST(90000.00 AS Decimal(18, 2)), 7, 96, 20)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (265, 1, CAST(285000.00 AS Decimal(18, 2)), 13, 97, 39)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (266, 1, CAST(285000.00 AS Decimal(18, 2)), 13, 97, 41)
INSERT [dbo].[Order_item] ([order_item_id], [quantity], [price], [product_id], [order_id], [color_id]) VALUES (1257, 1, CAST(159000.00 AS Decimal(18, 2)), 3, 1090, 4)
SET IDENTITY_INSERT [dbo].[Order_item] OFF
GO
INSERT [dbo].[Payment] ([payment_id], [name]) VALUES (1, N'COD')
INSERT [dbo].[Payment] ([payment_id], [name]) VALUES (2, N'Credit/Debit Card')
INSERT [dbo].[Payment] ([payment_id], [name]) VALUES (3, N'Payment Gateway')
INSERT [dbo].[Payment] ([payment_id], [name]) VALUES (4, N'Digital Wallet')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (1, N'DB01', N'Bộ đồ nam cao cấp KAPA chất liệu mì chéo được sản xuất tại nhà máy của KAPA với quy trình nghiệm ngặt. Các sản phẩm đều được những người thợ lâu năm trong nghề làm ra một cách cẩn thận và chắc chắn. Chất lượng vải đầu vào được kiểm nghiệm kĩ càng bằng văn bản và giấy tờ nên sản phẩm đầu ra có cam kết chuẩn chất lượng như mô tả!!', 129000, 200, 1, N'DB01a.jpg', N'Bộ quần áo thun nam cộc tay chất liệu polyester cao cấp hàn quốc, Set quần áo nam form dáng trẻ trung', N'DB01a.jpg,DB01b.jpg,DB01c.jpg')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (3, N'DB02', N'Bộ Thể Thao Nam phối trắng cổ tròn tay ngắn vải thun lạnh thoáng mát co giãn chuẩn form

* Chi tiết sản phẩm Áo Thể Thao Nam Coolpass: 

    + Chất Poly thể thao chuyên dụng co giãn, mềm mại, thấm mồ hôi cực tốt, ưu điểm mỏng - nhẹ - thoáng.

    + Thiết kế phối line ở ngực và mạng sườn tạo điểm nhấn thú vị và mới lạ.

    + Form tính toán tỉ mỉ phù hợp với người châu Á, thiết kế cổ tròn, lai thẳng xẻ sườn, logo phản quang đặt tại lai áo và tay áo.

    + Thiết kế khỏe khoắn, trẻ trung, có thể mặc chơi thể thao, tập gym, mặc nhà, đi chơi,...

* Màu sắc và kích cỡ Áo Thể Thao Nam Coolpass: 

    + Áo có 3 màu (đen, xám, be

  Thông số bảng size mang tính chất tương đối. Hãy Chat với chúng tôi, khi quý khách có nhu cầu tư vấn size chuẩn theo độ tuổi, thể trạng, sở thích,...

* Hướng dẫn sử dụng và bảo quản Áo Thể Thao Nam Coolpass: 

    + Bạn có thể giặt vải bằng tay hoặc máy giặt đều được.

    + Không dùng nước quá nóng để giặt.

    + Giặt ở nhiệt độ bình thường, với đồ có màu tương tự.', 159000, 99, 1, N'DB02a.jpg', N'Bộ Thể Thao Nam JULIDO cổ tròn tay ngắn vải waffle thoáng mát co giãn chuẩn form', N'DB02a.jpg,DB02b.jpg,DB02c.jpg')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (4, N'DB03', N'Thông tin sản phẩm
- Hàng Full tag, mác cực sang chảnh (xem video trên ảnh sản phẩm).
- Chất liệu: thun cotton 100%, vải dày, vải mềm, vải mịn, thoáng mát, không xù lông (không nhàu)
- Đường may tỉ mỉ, chắc chắn
- Công dụng: mặc ở nhà, mặc đi chơi, khi vận động thể thao, đi du lịch,...
- Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ
- 5 size XS,S, M,L,XL,XXL
SIZE XS < 30KG
SIZE: S < 35KG
SIZE: M  35 - 55KG
SIZE: L 55 - 68KG
SIZE: XL > 68KG
', 139000, 158, 1, N'DB03a.jpg', N'BỘ THỂ THAO NAM DONT STOP TRÀ SỮA, ĐỒ BỘ QUẦN ÁO MÙA HÈ CỘC TAY VẢI ĐẸP HOT TREND 2023 - DUBAI FASHION', N'DB03a.jpg,DB03b.jpg,DB03c.jpg')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (5, N'DB04', N'Bộ Quần Áo Nam Jor Đan In Chữ Paris Siêu Đẹp - Bộ Quần Áo Cộc  Jor Đan Mùa Hè In Chữ Cao Cấp

ĐIỂM NỔI BẬT CỦA SẢN PHẨM:
- Chất Cotton mịn thoáng mát co dãn 2 chiều, thoáng mát, hút ẩm tốt, mềm mịn, dày dặn, thoải mái khi vận động.
- Hàng may kỹ chắc chắn - Thiết kế đơn giãn thanh lịch trẻ đẹp phù hợp mọi lứa tuổi
- Dễ dàng kết hợp với quần ngắn, quần dài... cho bạn trông thật bảnh bao khi dạo phố, đi chơi, học tập, làm việc hay mặc thường ngày ở nhà.

SHOP CAM KẾT
✔ Mang đến cho khách hàng những sản phẩm với chất lượng tốt nhất trong tầm giá.
✔ Chính sách bảo  hành tốt nhất ( Hỗ trợ đổi size, sản phẩm lỗi)
✔ Shop Cam Kết Chất Lượng và Mẫu Mã Giống hình ảnh 100%
✔ Mẫu Mã Đa Dạng ,Cập Nhật Liên Tục, Chất liệu hàng đầu, giá cả hợp lý.
✔ Nhận hàng không ưng hoặc lỗi khách hàng có thể hoàn hàng và được hoàn tiền 100%', 124000, 169, 1, N'DB04a.jpg', N'Bộ Quần Áo Nam Jor Đan In Chữ Paris Siêu Đẹp - Bộ Quần Áo Cộc Jor Đan Mùa Hè In Chữ Cao Cấp', N'DB04a.jpg,DB04b.jpg')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (6, N'DB05', N'Bộ Đồ Nam Tay Ngắn Áo Kiểu Sơ Mi Basic Quần Short Có Túi Kiểu Dáng Trẻ Trung Thời Trang MixxStore QA NAM 071V1

- Chất liệu: Vải kaki mềm mịn 

- Kiểu dáng đơn giản, năng động nam nữ mặc đều đẹp..

- Xuất xứ: Việt Nam

- Bảng size:

+ Size XS: cho bạn có cân nặng từ 40 - 45kg tùy chiều cao 

+ Size S: cho bạn có cân nặng từ dưới 45 - 50kg tùy chiều cao 

+ Size M: cho bạn có cân nặng từ 50 - 55kg tùy chiều cao 

+ Size L: cho bạn có cân nặng từ 55 - 60kg tùy chiều cao 

+ Size XL: cho bạn có cân nặng từ 60 - 65kg tùy chiều cao

🔰 VỚI MIXXSTORE.NO1:

🎗Dịch vụ nhanh chóng

🎗Cập nhập mẫu mã liên tục với giá tốt nhất

🎗Sản phẩm luôn kèm theo video shop quay. ', 99000, 122, 1, N'DB05a.jpg', N'Bộ Đồ Nam Tay Ngắn Áo Kiểu Sơ Mi Basic Quần Short Có Túi Kiểu Dáng Trẻ Trung Thời Trang MixxStore QA NAM 071V1', N'DB05a.jpg,DB05b.jpg')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (7, N'AT01
', N'Áo được thiết kế kiểu dáng áo thun basic, form rộng, tay áo ngắn, cổ tròn đơn giản.
', 90000, 119, 2, N'AT01a.jpg
', N'Áo thun nam nữ unisex Dickies basic in ngực, chất cotton 100% chính hãng - Helistore
', N'AT01a.jpg
,AT01b.jpg
,AT01c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (8, N'AT02
', N'Vải waffle co giãn với độ dày vừa phải, thoáng mát, không xù lông, độ bền màu cao.
', 180000, 200, 2, N'AT02a.jpg
', N'Áo thun oversize nam nữ cao cấp vải waffle hàng hiệu form rộng PUNDO ATPD112
', N'AT02a.jpg
,AT02b.jpg
,AT02c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (9, N'AT03
', N'Form áo được thiết kế theo tiêu chuẩn tương đối của người Việt Nam. Form oversize nên không cần nhảy size lớn hơn
', 200000, 100, 2, N'AT03a.jpg
', N'Áo Thun Unisex Local Brand Lourents Signature Tee - TEE1
', N'AT03a.jpg
,AT03b.jpg
,AT03c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (10, N'AT04
', N'Chất vải cotton mềm mịn, giúp giữ form áo sau nhiều lần giặt và thấm hút mồ hôi ở mức độ trung bình
', 190000, 158, 2, N'AT04a.jpg
', N'Áo Thun Gimme Tee Oversize - Chữ GM In Lụa Unisex Cotton - 270gsm - GMT36
', N'AT04a.jpg
,AT04b.jpg
,AT04c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (11, N'AT05
', N'Được chăm chút từ chất liệu, form dáng, đường may, hình in cho đến khâu đóng gói và hậu mãi, chiếc áo cao cấp này sẽ làm hài lòng cả những vị khách khó tính nhất
', 170000, 169, 2, N'AT05a.jpg
', N'Áo thun Local Brand Lavi Studio/ Shark
', N'AT05a.jpg
,AT05b.jpg
,AT05c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (12, N'AK01
', N'Chất liệu: Vải dù Symbolic Premium poli dày dặn, có lớp lót dù
', 230000, 130, 3, N'AK01a.jpg
', N'Áo Khoác Bomber Pilot Oversized Jacket Symbolic
', N'AK01a.jpg
,AK01b.jpg
,AK01c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (13, N'AK02
', N'Áo khoác Jacket Uranus mang kiểu dáng unisex, form rộng dễ mặc, dễ dàng kết hợp với các sản phẩm quần jean, quần jogger,... 
', 285000, 148, 3, N'AK02a.jpg
', N'Áo Khoác Gió Local Brand Uranus City Cycle oversize nam nữ form rộng chống nước
', N'AK02a.jpg
,AK02b.jpg
,AK02c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (14, N'AK03
', N'Áo khoác nỉ bông mịn bông dày mặc mùa đông ấm áp, áo có các chi tiết  thêu sắc nét, tag tay tag sườn, tag cổ, có bo chun ở tay, nón to trùm đầu
', 300000, 100, 3, N'AK03a.jpg
', N'Áo Khoác Gió Today Viền chỉ tay form unisex nam nữ cực ngầu
', N'AK03a.jpg
,AK03b.jpg
,AK03c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (15, N'AK04
', N'Chất liệu: Nhung Thun 100% cao cấp, bề mặt vải mịn, không xù, không gião
', 250000, 120, 3, N'AK04a.jpg
', N'Áo Khoác Bomber Varsity Gooan Infinity Form Rộng
', N'AK04a.jpg
,AK04b.jpg
,AK04c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (16, N'AK05
', N'Chất liệu da, dù, nỉ dạ basic Jacket Classy
', 279000, 200, 3, N'AK05a.jpg
', N'Áo khoác bomber croptop chống nước DAVIES local brand nam, nữ
', N'AK05a.jpg
,AK05b.jpg
,AK05c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (17, N'QA01
', N'Quần tây JA0101 được căn chỉnh form dáng chuẩn xác hơn với phần hông rộng, đũng sâu và ống ôm suông dần
', 149000, 140, 4, N'QA01a.jpg
', N'Quần tây nam hàn quốc JBagy dáng baggy vải co giãn dày dặn dáng suông ống rộng, màu đen, kem JA0101
', N'QA01a.jpg
,QA01b.jpg
,QA01c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (18, N'QA02
', N'Quần tây nam ống suông cạp chun có túi thật,Quần âu nam vải cotton hàn co dãn nhẹ thoáng khí HK1970
', 287000, 70, 4, N'QA02a.jpg
', N'Quần tây nam ống suông cạp chun có túi thật, Quần âu nam vải cotton hàn co dãn nhẹ thoáng khí Q087
', N'QA02a.jpg
,QA02b.jpg
,QA02c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (19, N'QA03
', N'Thiết kế : quần tây nam mẫu trơn, đường may gấu quần là đường may chìm
', 300000, 260, 4, N'QA03a.jpg
', N'Quần âu nam cạp 3 lớp cao cấp 360Boutique quần tây dài form slimcrop vải dày dặn chống nhăn-QACOL420
', N'QA03a.jpg
,QA03b.jpg
,QA03c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (20, N'QA04
', N'Chất Tuyết Hàn cao cấp dày dặn, form Suông trẻ trung, thanh lịch, tôn dáng QAR12CT
', 150000, 187, 4, N'QA04a.jpg
', N'Quần âu nam suông WHY NOT thiết kế cạp nửa chun đằng sau, chất Tuyết Hàn cao cấp dày dặn, form Suông trẻ trung QAR12CT
', N'QA04a.jpg
,QA04b.jpg
,QA04c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (21, N'QA05
', N'Quần âu nam ống rộng JONATO,  quần nam ống suông phong cách hàn quốc trẻ trung năng động
', 129000, 200, 4, N'QA05a.jpg
', N'Quần âu nam ống rộng JONATO, quần nam ống suông phong cách hàn quốc trẻ trung năng động
', N'QA05a.jpg
,QA05b.jpg
,QA05c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (22, N'DV01
', N'Sản phẩm 100% giống mô tả. Hình ảnh sản phẩm là ảnh thật do shop tự chụp và giữ bản quyền hình ảnh
', 79000, 122, 5, N'DV01a.jpg
', N'Váy cúp ngực, đầm 2 dây Lou dress xixeoshop - v458
', N'DV01a.jpg
,DV01b.jpg
,DV01c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (23, N'DV02
', N'Chất liệu vải nhẹ, mềm mại cùng đường may tỉ mỉ tạo nên chiếc đầm không chỉ đẹp mắt mà còn rất thoải mái khi mặc.
', 119000, 69, 5, N'DV02a.jpg
', N'Đầm suông dáng dài, Váy nữ công sở xinh nhẹ nhàng nữ tính ANN SARA
', N'DV02a.jpg
,DV02b.jpg
,DV02c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (24, N'DV03
', N'Sản phẩm cao cấp được shop chọn tỉ mỉ. Chất vải, đường may và form dáng đều được may kĩ lưỡng, xứng đáng với giá tiền
', 110000, 110, 5, N'DV03a.jpg
', N'Váy Đầm Dài Hai Dây Xếp Ly Thiết Kế Màu Trơn Váy Chữ A Chiết Eo Tôn Dáng Đầu Xuân Hè 2024
', N'DV03a.jpg
,DV03b.jpg
,DV03c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (25, N'DV04', N'Thiết kế đơn giản dễ mặc và sự kết hợp của chất vải co giản, thấm hút mồ hôi tốt.
', 60000, 190, 5, N'DV04a.jpg
', N'Đầm Cổ Vest Dự Tiệc Vạt Chéo Xếp Ly Cao Cấp
', N'DV04a.jpg
,DV04b.jpg
,DV04c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (26, N'DV05
', N'Hàng Thiết Kế Chất Liệu Vải Cao Cấp Đính Nơ Cổ, Đuôi Váy Xếp Ly Đẹp Sang Trọng 
', 89000, 210, 5, N'DV05a.jpg
', N'Váy Trắng Tiểu Thư KANGSOOSTORE , Hàng Thiết Kế Đính Nơ Cổ, Đuôi Váy Xếp Ly
', N'DV05a.jpg
,DV05b.jpg
,DV05c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (27, N'QN01
', N'Chi tiết bấu ly lật cạp bản to làm điểm nhấn chính thanh lịch phù hợp công sở, dạo phố, sản phẩm mặc tôn dáng dễ mix match các items
', 200000, 117, 6, N'QN01a.jpg
', N'Quần Ống Rộng CCHAT Ly Cạp Cao Chất Tuytsi Cao Cấp Sang Trọng
', N'QN01a.jpg
,QN01b.jpg
,QN01c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (28, N'QN02
', N'Quần kaki ống suông nữ rộng cạp chun dây thắt phong cách Avocado 2 túi hộp phong cách trẻ trung năng động
', 180000, 60, 6, N'QN02a.jpg
', N'Quần kaki ống suông nữ rộng cạp chun dây thắt phong cách Avocado 2 túi hộp phong cách trẻ trung năng động
', N'QN02a.jpg
,QN02b.jpg
,QN02c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (29, N'QN03
', N'Nhẹ thoáng mát cạp chun co giãn thoải mai'' không nhăn không xù không nhão
', 270000, 126, 6, N'QN03a.jpg
', N'Quần Ống Rộng Nữ Vải Đũi Mát Loại Đẹp Siêu Hót
', N'QN03a.jpg
,QN03b.jpg
,QN03c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (30, N'QN04
', N'Ương đối, phù hợp với 80-90% khách hàng. Các bạn iu có thể nhắn tin cho EMPTI chiều cao & cân nặng 
', 125000, 89, 6, N'QN04a.jpg
', N'QUẦN DÙ DÂY RÚT PARACHUTE TRƠN 10 MÀU
', N'QN04a.jpg
,QN04b.jpg
,QN04c.jpg
')
INSERT [dbo].[Product] ([product_id], [SKU], [description], [price], [stock], [category_id], [image], [name], [gallery]) VALUES (31, N'QN05
', N'Quần jean ống rộng nữ , quần ống suông nữ màu đen trắng kem kaki jean form basic chất bò trẻ trung năng động
', 119000, 131, 6, N'QN05a.jpg
', N'Quần jean ống rộng nữ , quần ống suông nữ
', N'QN05a.jpg
,QN05b.jpg
,QN05c.jpg
')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [first_name], [last_name], [email], [username], [password], [address], [phone_number], [permission]) VALUES (1, N'Vũ Tùng', N'Tâm', N'vutungtam3110@gmail.com', N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'Quỳnh Côi, Quỳnh Phụ,Thái Bình', N'0123456789', 1)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [email], [username], [password], [address], [phone_number], [permission]) VALUES (2, N'Đào Minh', N'Hiếu', N'abc123@gmail.com', N'hieudm', N'e10adc3949ba59abbe56e057f20f883e', N'Thị trấn Đồi Ngô,Lục Nam,Bắc Giang', N'0897840301', 0)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [email], [username], [password], [address], [phone_number], [permission]) VALUES (3, N'Nguyễn Công', N'Tiệp', N'tiep@gmail.com', N'tiepnt', N'e10adc3949ba59abbe56e057f20f883e', N'Thị trấn Chờ,Yên Phong, Bắc Ninh', N'0743591540', 0)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [email], [username], [password], [address], [phone_number], [permission]) VALUES (4, N'Vũ Tùng', N'Tâm', N'vutungtam3110@gmail.com', N'tamvt', N'e10adc3949ba59abbe56e057f20f883e', N'Quỳnh Côi, Quỳnh Phụ,Thái Bình', N'0859120304', 0)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [email], [username], [password], [address], [phone_number], [permission]) VALUES (5, N'Đỗ Công Thanh', N'Phương', N'docongthanhphuong@gmail.com', N'phuongdc', N'e10adc3949ba59abbe56e057f20f883e', N'Thăng Bình, Nông Cống, Thanh Hóa', N'0362046864', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id]) VALUES (9, 2, 3)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id]) VALUES (11, 2, 9)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id]) VALUES (12, 2, 6)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id]) VALUES (13, 2, 12)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id]) VALUES (14, 2, 26)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id]) VALUES (15, 2, 19)
INSERT [dbo].[Wishlist] ([wishlist_id], [user_id], [product_id]) VALUES (16, 2, 1)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__customer___440B1D61] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__customer___440B1D61]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK__Order_ite__order__4D94879B] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK__Order_ite__order__4D94879B]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK__Order_ite__produ__5070F446] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK__Order_ite__produ__5070F446]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK__Order_item__color_id] FOREIGN KEY([color_id])
REFERENCES [dbo].[Color] ([color_id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK__Order_item__color_id]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__398D8EEE] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__398D8EEE]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK__Wishlist__custom__4CA06362] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK__Wishlist__custom__4CA06362]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK__Wishlist__produc__4D94879B] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK__Wishlist__produc__4D94879B]
GO
