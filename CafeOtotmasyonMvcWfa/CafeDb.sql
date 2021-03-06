USE [master]
GO
/****** Object:  Database [Cafe]    Script Date: 25/03/2020 15:47:18 ******/
CREATE DATABASE [Cafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cafe', FILENAME = N'E:\Ata\yazılım\MS SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Cafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cafe_log', FILENAME = N'E:\Ata\yazılım\MS SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\Cafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cafe] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cafe] SET  MULTI_USER 
GO
ALTER DATABASE [Cafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cafe] SET QUERY_STORE = OFF
GO
USE [Cafe]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 25/03/2020 15:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 25/03/2020 15:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[TitleID] [int] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](30) NULL,
	[UserName] [nvarchar](30) NULL,
	[Password] [nvarchar](30) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 25/03/2020 15:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductAmount] [int] NOT NULL,
	[UnitPrice] [money] NULL,
	[ProductTotalPrice] [money] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25/03/2020 15:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[OrderTotalPrice] [money] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25/03/2020 15:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titles]    Script Date: 25/03/2020 15:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'İçecek', N'Soguk/Sıcak İçecekler')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Kahvaltılık', N'Kahvaltılıklar')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Atıştırmalıklar', N'Cips, Çerez vb.')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'Tatlılar', N'Sütlü, Çikolatalı tatlılar')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (13, N'Börekler', N'Börekler')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [TitleID], [FirstName], [LastName], [BirthDate], [HireDate], [Address], [Phone], [UserName], [Password]) VALUES (1, 1, N'Ata', N'Candaş', CAST(N'1994-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'Istanbul', NULL, N'atacandas', N'123')
INSERT [dbo].[Employees] ([EmployeeID], [TitleID], [FirstName], [LastName], [BirthDate], [HireDate], [Address], [Phone], [UserName], [Password]) VALUES (2, 4, N'Ahmet', N'Mehmet', NULL, NULL, N'İstanbul', N'5553232', N'ahmetmehmet', N'1234')
INSERT [dbo].[Employees] ([EmployeeID], [TitleID], [FirstName], [LastName], [BirthDate], [HireDate], [Address], [Phone], [UserName], [Password]) VALUES (3, 2, N'Mahmut', N'aaaa', NULL, NULL, N'İstanbul', N'5556232', N'mahmut', N'qwe')
INSERT [dbo].[Employees] ([EmployeeID], [TitleID], [FirstName], [LastName], [BirthDate], [HireDate], [Address], [Phone], [UserName], [Password]) VALUES (4, 4, N'İsim', N'Soyisim', CAST(N'1990-01-01T00:00:00.000' AS DateTime), CAST(N'2010-01-01T00:00:00.000' AS DateTime), N'adres', N'5552121', N'deneme', N'123')
SET IDENTITY_INSERT [dbo].[Employees] OFF
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (8, 9, 1, 5.0000, 5.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (8, 10, 1, 2.0000, 2.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (9, 9, 1, 5.0000, 5.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (9, 10, 1, 2.0000, 2.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (10, 9, 1, 5.0000, 5.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (10, 10, 1, 2.0000, 2.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (12, 6, 3, 5.0000, 15.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (12, 9, 2, 5.0000, 10.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (13, 2, 2, 1.0000, 2.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (13, 14, 2, 9.0000, 18.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (14, 10, 2, 2.0000, 4.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (14, 15, 2, 8.0000, 16.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (15, 2, 1, 1.0000, 1.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (15, 12, 1, 15.0000, 15.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (16, 15, 4, 8.0000, 32.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (16, 17, 1, 13.0000, 13.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (17, 15, 2, 8.0000, 16.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (17, 16, 1, 15.0000, 15.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (18, 18, 10, 13.0000, 130.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (18, 19, 9, 12.0000, 108.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (19, 19, 1, 12.0000, 12.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (20, 19, 1, 12.0000, 12.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (21, 19, 3, 12.0000, 36.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (22, 14, 5, 9.0000, 45.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (23, 14, 5, 9.0000, 45.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (23, 15, 5, 8.0000, 40.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (24, 14, 1, 9.0000, 9.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (25, 10, 100, 2.0000, 200.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ProductAmount], [UnitPrice], [ProductTotalPrice]) VALUES (25, 12, 10, 15.0000, 150.0000)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (3, 1, CAST(N'2020-03-05T12:31:25.067' AS DateTime), 0.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (4, 1, CAST(N'2020-03-05T13:01:34.070' AS DateTime), 0.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (5, 1, CAST(N'2020-03-05T20:17:59.427' AS DateTime), 16.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (6, 1, CAST(N'2020-03-05T20:19:45.567' AS DateTime), 5.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (7, 1, CAST(N'2020-03-07T13:30:17.980' AS DateTime), 6.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (8, 1, CAST(N'2020-03-07T20:37:13.280' AS DateTime), 7.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (9, 1, CAST(N'2020-03-09T12:42:12.410' AS DateTime), 7.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (10, 3, CAST(N'2020-03-09T15:30:51.167' AS DateTime), 7.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (11, 1, CAST(N'2020-03-16T19:35:51.700' AS DateTime), 0.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (12, 1, CAST(N'2020-03-16T19:58:35.023' AS DateTime), 25.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (13, 1, CAST(N'2020-03-17T12:29:22.593' AS DateTime), 20.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (14, 1, CAST(N'2020-03-17T12:32:09.167' AS DateTime), 20.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (15, 1, CAST(N'2020-03-17T12:32:29.513' AS DateTime), 16.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (16, 1, CAST(N'2020-03-17T14:56:06.033' AS DateTime), 45.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (17, 1, CAST(N'2020-03-17T15:04:20.107' AS DateTime), 31.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (18, 1, CAST(N'2020-03-18T12:27:55.683' AS DateTime), 238.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (19, 1, CAST(N'2020-03-18T12:28:24.760' AS DateTime), 12.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (20, 1, CAST(N'2020-03-18T12:28:39.793' AS DateTime), 12.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (21, 1, CAST(N'2020-03-18T14:09:22.330' AS DateTime), 36.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (22, 1, CAST(N'2020-03-18T16:19:49.460' AS DateTime), 45.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (23, 4, CAST(N'2020-03-18T16:20:38.657' AS DateTime), 85.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (24, 1, CAST(N'2020-03-18T21:05:23.770' AS DateTime), 9.0000)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderDate], [OrderTotalPrice]) VALUES (25, 1, CAST(N'2020-03-25T15:15:40.370' AS DateTime), 350.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (2, N'Su', 1, 1.0000, 700)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (3, N'Kola', 1, 2.5000, 150)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (6, N'Peynir', 4, 5.0000, 100)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (7, N'Su Soğuk', 1, 1.0000, 100)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (8, N'Su Sıcak', 1, 1.0000, 100)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (9, N'Nescafe', 1, 5.0000, 150)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (10, N'Cips', 5, 2.0000, 1050)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (11, N'Zeytin', 4, 5.0000, 140)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (12, N'Bira', 1, 15.0000, 135)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (14, N'Kazandibi', 7, 9.0000, 99)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (15, N'Sütlaç', 7, 8.0000, 40)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (16, N'Su Böreği', 13, 15.0000, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (17, N'Boşnak Böreği', 13, 12.0000, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (18, N'Trileçe', 7, 13.0000, 90)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (19, N'Tiramisu', 7, 13.0000, 9)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (21, N'Kızarmış Patates', 5, 10.0000, 40)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]) VALUES (22, N'Kaşar Penyiri', 4, 5.0000, 100)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([TitleID], [TitleName], [Description]) VALUES (1, N'Boss', N'Boss full authority')
INSERT [dbo].[Titles] ([TitleID], [TitleName], [Description]) VALUES (2, N'Garson', N'bla bla blaa')
INSERT [dbo].[Titles] ([TitleID], [TitleName], [Description]) VALUES (4, N'Müdür', N'müdür')
INSERT [dbo].[Titles] ([TitleID], [TitleName], [Description]) VALUES (5, N'Kasiyer', N'Kasada durur')
INSERT [dbo].[Titles] ([TitleID], [TitleName], [Description]) VALUES (7, N'Temizlik Çalışanı', N'temizlikten sorumlu')
SET IDENTITY_INSERT [dbo].[Titles] OFF
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Titles] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Titles] ([TitleID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Titles]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [Cafe] SET  READ_WRITE 
GO
