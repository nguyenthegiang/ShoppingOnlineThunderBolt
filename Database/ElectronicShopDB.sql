﻿CREATE DATABASE ElectronicShop;
--DROP DATABASE ElectronicShop
--Thứ tự chạy DB sau khi Drop: File này -> ListCategory -> ListProduct -> ListCart -> ListShip -> ListStatus
GO
USE [ElectronicShop]
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Users (
	UserID int PRIMARY KEY identity(1,1),
	Username nvarchar(500),
	Password nvarchar(1000),
	email nvarchar(1000),
	ActiveCode nvarchar(11),
	isSeller int,
	isAdmin int, 
	user_status int
);
GO

INSERT INTO Users VALUES (N'nguyenthegiang', N'nguyenthegiang', N'nguyenthe.giang.775@gmail.com', 1, 1);
INSERT INTO Users VALUES (N'buingochuyen', N'buingochuyen', N'a', 1, 1);
INSERT INTO Users VALUES (N'lehoangchi', N'lehoangchi', N'b', 1, 0);
INSERT INTO Users VALUES (N'nguyenthuan', N'nguyenthuan', N'c', 1, 0);
INSERT INTO Users VALUES (N'nguyenminhhanh', N'nguyenminhhanh', N'd', 1, 0);
INSERT INTO Users VALUES (N'nguyenthithanhmai', N'nguyenthithanhmai', N'e', 1, 0);
INSERT INTO Users VALUES (N'nguyentranhoang', N'nguyentranhoang', N'f', 0, 0);
INSERT INTO Users VALUES (N'trantatdat', N'trantatdat', N'g', 0, 0);
INSERT INTO Users VALUES (N'phungquangthong', N'phungquangthong', N'h', 0, 0);
INSERT INTO Users VALUES (N'dinhthethuan', N'dinhthethuan', N'i', 0, 0);
INSERT INTO Users VALUES (N'canhoangduc', N'canhoangduc', N'j', 0, 0);
INSERT INTO Users VALUES (N'dinhthanhhoang', N'dinhthanhhoang', N'k', 0, 0);
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Category (
	CategoryID int PRIMARY KEY identity(1,1),
	CategoryName nvarchar(1000),
	icon nvarchar(1000)
) ON [PRIMARY]
GO

-------------------------------------------------------------------
--Kì 5: SWP Project
CREATE TABLE ProductStatus (
	StatusID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO

CREATE TABLE UserStatus (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO

INSERT INTO UserStatus VALUES (N'Active');
INSERT INTO UserStatus VALUES (N'Locked');

CREATE TABLE Product (
	ProductID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	ProductName nvarchar(1000),
	Description nvarchar(2000),
	OriginalPrice int, --giá gốc
	SellPrice int,	--giá bán
	SalePercent int,	--phần trăm giảm giá
	imageLink nvarchar(1000),
	CategoryID int,
	SellerID int,
	Amount int,
	StatusID int,
	constraint product_in_category FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID),
	constraint SellerID_in_Users FOREIGN KEY(SellerID) REFERENCES Users(UserID),
	constraint StatusID_in_Status FOREIGN KEY(StatusID) REFERENCES ProductStatus(StatusID)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Information](
	[description] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[fax] [nvarchar](max) NULL
) ON [PRIMARY]
GO

INSERT [dbo].[Information] ([description], [address], [email], [phone], [fax]) 
VALUES (N'© 2020 Công Ty Cổ Phần Máy Tính Computer ERA', N'Số 129 + 131, phố Lê Thanh Nghị, Phường Đồng Tâm, Quận Hai Bà Trưng, Hà Nội', N'hnc@computerera.com', N'1900 1903', N'1900 1904')

------------------------------------------------------------------

CREATE TABLE Cart (
	UserID int,
	ProductID int,
	Amount int
	constraint userID_in_user FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint productID_in_product FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
) ON [PRIMARY]
GO

CREATE TABLE Ship (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CityName nvarchar(1000) ,
	ShipPrice int
) ON [PRIMARY]
GO



