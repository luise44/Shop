USE [master]
GO

/****** Object:  Database [Shop]    Script Date: 5/16/2024 5:06:56 PM ******/
CREATE DATABASE [Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Shop] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Shop] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Shop] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Shop] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Shop] SET ARITHABORT OFF 
GO

ALTER DATABASE [Shop] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Shop] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Shop] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Shop] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Shop] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Shop] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Shop] SET  ENABLE_BROKER 
GO

ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Shop] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Shop] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Shop] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [Shop] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Shop] SET RECOVERY FULL 
GO

ALTER DATABASE [Shop] SET  MULTI_USER 
GO

ALTER DATABASE [Shop] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Shop] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Shop] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Shop] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Shop] SET  READ_WRITE 
GO


USE [Shop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/16/2024 5:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/16/2024 5:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/16/2024 5:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/16/2024 5:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Sequence] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[DetailTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/16/2024 5:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/16/2024 5:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/16/2024 5:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240511232221_InitialSchema', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516014848_AddCodeColumnProduct', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516014939_ModifiedCodeColumnProduct', N'8.0.4')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (1, N'Edward', N'Martinez')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (2, N'Robert', N'Sanchez')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (3, N'Ronald', N'Scott')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (4, N'Deborah', N'Hernandez')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (5, N'Richard', N'Martinez')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (6, N'Helen', N'Morris')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (7, N'Helen', N'Garcia')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (8, N'Margaret', N'Evans')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (9, N'Donna', N'Bell')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (10, N'Amanda', N'Taylor')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (11, N'Tammy', N'King')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (12, N'Kenneth', N'Roberts')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (13, N'Debra', N'Morgan')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (14, N'Paul', N'Bell')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (15, N'George', N'Morris')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (16, N'Michelle', N'Washington')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (17, N'Joseph', N'Flores')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (18, N'Linda', N'Bailey')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (19, N'Jessica', N'Collins')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (20, N'Amanda', N'Cooper')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (21, N'Jessica', N'Lee')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (22, N'Linda', N'Long')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (23, N'Matthew', N'Kelly')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (24, N'Jason', N'Perry')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (25, N'Betty', N'Ramos')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (26, N'Daniel', N'Williams')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (27, N'Lisa', N'Long')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (28, N'Ronald', N'Doe')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (29, N'Charles', N'Cruz')
GO
INSERT [dbo].[Customers] ([Id], [Name], [LastName]) VALUES (30, N'Margaret', N'Green')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 1, 19, 0, CAST(923.45 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 2, 19, 0, CAST(923.45 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 3, 19, 0, CAST(923.45 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 4, 19, 0, CAST(923.45 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 5, 19, 0, CAST(923.45 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 6, 19, 0, CAST(923.45 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 7, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 8, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 9, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 10, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 11, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 12, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 13, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 14, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 15, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 16, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 17, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 18, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 27, 19, 4, CAST(923.45 AS Decimal(18, 2)), CAST(3693.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 28, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 29, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 41, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 42, 19, 31, CAST(923.45 AS Decimal(18, 2)), CAST(28626.95 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 43, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 44, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 45, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 46, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 47, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 48, 19, 1, CAST(923.45 AS Decimal(18, 2)), CAST(923.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (1, 49, 19, 2, CAST(923.45 AS Decimal(18, 2)), CAST(1846.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 1, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 2, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 3, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 4, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 5, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 6, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 7, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 8, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 9, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 10, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 11, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 12, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 13, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 14, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 15, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 16, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 17, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 18, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 27, 16, 4, CAST(788.49 AS Decimal(18, 2)), CAST(3153.96 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 28, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 29, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 41, 16, 1, CAST(788.49 AS Decimal(18, 2)), CAST(788.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 42, 16, 50, CAST(788.49 AS Decimal(18, 2)), CAST(39424.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 43, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 44, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (2, 45, 16, 0, CAST(788.49 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 1, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 2, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 3, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 4, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 5, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 6, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 7, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 8, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 9, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 10, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 11, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 12, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 13, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 14, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 15, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 16, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 17, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 18, 23, 1, CAST(105.60 AS Decimal(18, 2)), CAST(105.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 27, 23, 3, CAST(105.60 AS Decimal(18, 2)), CAST(316.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 28, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 29, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 41, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 42, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 43, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 44, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (3, 45, 23, 0, CAST(105.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 1, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 2, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 3, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 4, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 5, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 6, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 7, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 8, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 9, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 10, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 11, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 12, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 13, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 14, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 15, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 16, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 17, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 18, 30, 1, CAST(188.39 AS Decimal(18, 2)), CAST(188.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 27, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 28, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 29, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 41, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 42, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 43, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 44, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (4, 45, 30, 0, CAST(188.39 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 1, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 2, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 3, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 4, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 5, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 6, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 7, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 8, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 9, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 10, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 11, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 12, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 13, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 14, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 15, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 16, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 17, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 18, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 27, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 28, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 29, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 41, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 42, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 43, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 44, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (5, 45, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 1, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 2, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 3, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 4, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 5, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 6, 26, 0, CAST(355.61 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 7, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 8, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 9, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 10, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 11, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 12, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 13, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 14, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 15, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 16, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 17, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 18, 26, 1, CAST(355.61 AS Decimal(18, 2)), CAST(355.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 27, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 28, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 29, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 41, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 42, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 43, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 44, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (6, 45, 15, 0, CAST(419.30 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 1, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 2, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 3, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 4, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 5, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 6, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 7, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 8, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 9, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 10, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 11, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 12, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 13, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 14, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 15, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 16, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 17, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 18, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 27, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 28, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 29, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 41, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 42, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 43, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 44, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (7, 45, 4, 0, CAST(148.58 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 1, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 2, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 3, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 4, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 5, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 6, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 7, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 8, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 9, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 10, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 11, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 12, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 13, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 14, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 15, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 16, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 17, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 18, 24, 1, CAST(974.53 AS Decimal(18, 2)), CAST(974.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 27, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 28, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 29, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 41, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 42, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 43, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 44, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (8, 45, 9, 0, CAST(676.11 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 1, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 2, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 3, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 4, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 5, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 6, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 7, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 8, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 9, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 10, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 11, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 12, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 13, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 14, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 15, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 16, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 17, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 18, 3, 1, CAST(169.32 AS Decimal(18, 2)), CAST(169.32 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 27, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 28, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 29, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 41, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 42, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 43, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 44, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (9, 45, 10, 0, CAST(6.03 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 1, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 2, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 3, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 4, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 5, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 6, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 7, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 8, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 9, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 10, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 11, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 12, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 13, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 14, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 15, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 16, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 17, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 18, 14, 1, CAST(186.19 AS Decimal(18, 2)), CAST(186.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 27, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 28, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 29, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 41, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 42, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 43, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 44, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (10, 45, 11, 0, CAST(511.24 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 1, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 2, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 3, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 4, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 5, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 6, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 7, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 8, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 9, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 10, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 11, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 12, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 13, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 14, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 15, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 16, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 17, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (11, 18, 12, 1, CAST(604.22 AS Decimal(18, 2)), CAST(604.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 1, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 2, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 3, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 4, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 5, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 6, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 7, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 8, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 9, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 10, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 11, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 12, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 13, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 14, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 15, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 16, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 17, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (12, 18, 13, 1, CAST(120.27 AS Decimal(18, 2)), CAST(120.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 1, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 2, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 3, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 4, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 5, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 6, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 7, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 8, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 9, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 10, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 11, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 12, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 13, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 14, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 15, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 16, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 17, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetail] ([Sequence], [OrderId], [ProductId], [Quantity], [Price], [DetailTotal]) VALUES (13, 18, 25, 0, CAST(369.52 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (1, CAST(N'2024-05-16T09:35:03.4284261' AS DateTime2), CAST(2054.53 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (2, CAST(N'2024-05-16T09:43:40.9026640' AS DateTime2), CAST(2054.53 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (3, CAST(N'2024-05-16T09:44:24.4003295' AS DateTime2), CAST(2054.53 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (4, CAST(N'2024-05-16T09:44:40.5196619' AS DateTime2), CAST(2054.53 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (5, CAST(N'2024-05-16T09:45:00.8942234' AS DateTime2), CAST(2054.53 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (6, CAST(N'2024-05-16T09:45:17.7966779' AS DateTime2), CAST(2054.53 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (7, CAST(N'2024-05-16T12:10:07.6734837' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (8, CAST(N'2024-05-16T12:10:21.4236103' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (9, CAST(N'2024-05-16T12:10:37.7716728' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (10, CAST(N'2024-05-16T12:13:31.4822618' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (11, CAST(N'2024-05-16T12:20:42.1667007' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (12, CAST(N'2024-05-16T12:30:05.6900554' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (13, CAST(N'2024-05-16T12:30:41.2519186' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (14, CAST(N'2024-05-16T12:31:57.6846576' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (15, CAST(N'2024-05-16T12:32:34.9456052' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (16, CAST(N'2024-05-16T12:33:38.7939746' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (17, CAST(N'2024-05-16T12:34:52.7594913' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (18, CAST(N'2024-05-16T12:37:02.8979033' AS DateTime2), CAST(4416.07 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (27, CAST(N'2024-05-16T14:14:09.5024320' AS DateTime2), CAST(7164.56 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (28, CAST(N'2024-05-16T14:16:08.0616107' AS DateTime2), CAST(1711.94 AS Decimal(18, 2)), 17)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (29, CAST(N'2024-05-16T14:17:43.7424391' AS DateTime2), CAST(923.45 AS Decimal(18, 2)), 17)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (41, CAST(N'2024-05-16T15:06:18.2878784' AS DateTime2), CAST(1711.94 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (42, CAST(N'2024-05-16T15:27:14.6373061' AS DateTime2), CAST(68051.45 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (43, CAST(N'2024-05-16T15:33:08.0817622' AS DateTime2), CAST(923.45 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (44, CAST(N'2024-05-16T15:33:50.3458715' AS DateTime2), CAST(923.45 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (45, CAST(N'2024-05-16T15:34:24.0444730' AS DateTime2), CAST(923.45 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (46, CAST(N'2024-05-16T15:35:37.6051616' AS DateTime2), CAST(923.45 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (47, CAST(N'2024-05-16T16:05:31.2813937' AS DateTime2), CAST(923.45 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (48, CAST(N'2024-05-16T16:30:41.7098914' AS DateTime2), CAST(923.45 AS Decimal(18, 2)), 20)
GO
INSERT [dbo].[Orders] ([Id], [CreatedDate], [Total], [CustomerId]) VALUES (49, CAST(N'2024-05-16T17:00:49.9730452' AS DateTime2), CAST(1846.90 AS Decimal(18, 2)), 20)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (1, N'Mountain Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(544.89 AS Decimal(18, 2)), 93, N'1Mou93')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (2, N'Road Bike', N'Eco-friendly electric bike with pedal assist.', CAST(756.78 AS Decimal(18, 2)), 58, N'2Roa58')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (3, N'Hybrid Bike', N'Eco-friendly electric bike with pedal assist.', CAST(169.32 AS Decimal(18, 2)), 65, N'3Hyb65')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (4, N'Folding Bike', N'Compact folding bike for easy storage and transportation.', CAST(148.58 AS Decimal(18, 2)), 34, N'4Fol34')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (5, N'Road Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(442.64 AS Decimal(18, 2)), 41, N'5Roa41')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (6, N'Road Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(482.27 AS Decimal(18, 2)), 70, N'6Roa70')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (7, N'Road Bike', N'Compact folding bike for easy storage and transportation.', CAST(253.15 AS Decimal(18, 2)), 70, N'7Roa70')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (8, N'Road Bike', N'Compact folding bike for easy storage and transportation.', CAST(742.03 AS Decimal(18, 2)), 2, N'8Roa2')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (9, N'Folding Bike', N'Durable mountain bike for off-road adventures.', CAST(676.11 AS Decimal(18, 2)), 83, N'9Fol83')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (10, N'Folding Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(6.03 AS Decimal(18, 2)), 20, N'10Fol20')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (11, N'Hybrid Bike', N'Durable mountain bike for off-road adventures.', CAST(511.24 AS Decimal(18, 2)), 99, N'11Hyb99')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (12, N'Hybrid Bike', N'Compact folding bike for easy storage and transportation.', CAST(604.22 AS Decimal(18, 2)), 14, N'12Hyb14')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (13, N'Hybrid Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(120.27 AS Decimal(18, 2)), 83, N'13Hyb83')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (14, N'Hybrid Bike', N'Eco-friendly electric bike with pedal assist.', CAST(186.19 AS Decimal(18, 2)), 69, N'14Hyb69')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (15, N'Folding Bike', N'Versatile hybrid bike for commuting and leisure rides.', CAST(419.30 AS Decimal(18, 2)), 14, N'15Fol14')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (16, N'Electric Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(788.49 AS Decimal(18, 2)), 50, N'16Ele50')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (17, N'Hybrid Bike', N'Compact folding bike for easy storage and transportation.', CAST(820.09 AS Decimal(18, 2)), 90, N'17Hyb90')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (18, N'Hybrid Bike', N'Eco-friendly electric bike with pedal assist.', CAST(180.29 AS Decimal(18, 2)), 37, N'18Hyb37')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (19, N'Electric Bike', N'Durable mountain bike for off-road adventures.', CAST(923.45 AS Decimal(18, 2)), 25, N'19Ele33')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (20, N'Hybrid Bike', N'Eco-friendly electric bike with pedal assist.', CAST(935.20 AS Decimal(18, 2)), 23, N'20Hyb23')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (21, N'Mountain Bike', N'Eco-friendly electric bike with pedal assist.', CAST(281.03 AS Decimal(18, 2)), 4, N'21Mou4')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (22, N'Road Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(788.51 AS Decimal(18, 2)), 85, N'22Roa85')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (23, N'Electric Bike', N'Versatile hybrid bike for commuting and leisure rides.', CAST(105.60 AS Decimal(18, 2)), 74, N'23Ele74')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (24, N'Mountain Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(974.53 AS Decimal(18, 2)), 96, N'24Mou96')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (25, N'Mountain Bike', N'Versatile hybrid bike for commuting and leisure rides.', CAST(369.52 AS Decimal(18, 2)), 8, N'25Mou8')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (26, N'Folding Bike', N'Eco-friendly electric bike with pedal assist.', CAST(355.61 AS Decimal(18, 2)), 54, N'26Fol54')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (27, N'Hybrid Bike', N'Sleek and lightweight road bike for speed and performance.', CAST(907.71 AS Decimal(18, 2)), 80, N'27Hyb80')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (28, N'Road Bike', N'Durable mountain bike for off-road adventures.', CAST(735.87 AS Decimal(18, 2)), 93, N'28Roa93')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (29, N'Road Bike', N'Compact folding bike for easy storage and transportation.', CAST(14.42 AS Decimal(18, 2)), 73, N'29Roa73')
GO
INSERT [dbo].[Products] ([Id], [Title], [Description], [Price], [Stock], [Code]) VALUES (30, N'Electric Bike', N'Versatile hybrid bike for commuting and leisure rides.', CAST(188.39 AS Decimal(18, 2)), 20, N'30Ele20')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Products_ProductId]
GO
