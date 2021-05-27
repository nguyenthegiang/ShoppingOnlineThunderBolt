﻿CREATE DATABASE ElectronicShop;
--DROP DATABASE ElectronicShop
GO
USE [ElectronicShop]
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Users (
	UserID int PRIMARY KEY identity(1,1),
	Username nvarchar(500),
	Password nvarchar(1000),
	isSeller int,
	isAdmin int
);
GO

INSERT INTO Users VALUES (N'nguyenthegiang', N'nguyenthegiang', 1, 1);
INSERT INTO Users VALUES (N'buingochuyen', N'buingochuyen', 1, 1);
INSERT INTO Users VALUES (N'lehoangchi', N'lehoangchi', 1, 0);
INSERT INTO Users VALUES (N'nguyenthuan', N'nguyenthuan', 1, 0);
INSERT INTO Users VALUES (N'nguyenminhhanh', N'nguyenminhhanh', 1, 0);
INSERT INTO Users VALUES (N'nguyenthithanhmai', N'nguyenthithanhmai', 1, 0);
INSERT INTO Users VALUES (N'nguyentranhoang', N'nguyentranhoang', 0, 0);
INSERT INTO Users VALUES (N'trantatdat', N'trantatdat', 0, 0);
INSERT INTO Users VALUES (N'phungquangthong', N'phungquangthong', 0, 0);
INSERT INTO Users VALUES (N'dinhthethuan', N'dinhthethuan', 0, 0);
INSERT INTO Users VALUES (N'canhoangduc', N'canhoangduc', 0, 0);
INSERT INTO Users VALUES (N'dinhthanhhoang', N'dinhthanhhoang', 0, 0);
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Category (
	CategoryID int PRIMARY KEY identity(1,1),
	CategoryName nvarchar(1000),
	icon nvarchar(1000)
) ON [PRIMARY]
GO

CREATE TABLE Product (
	ProductID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	ProductName nvarchar(1000),
	Description nvarchar(2000),
	Price int,
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
	CityName nvarchar(1000) PRIMARY KEY,
	ShipPrice int
) ON [PRIMARY]
GO

-------------------------------------------------------------------
--Kì 5: SWP Project
CREATE TABLE ProductStatus (
	StatusID int,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO