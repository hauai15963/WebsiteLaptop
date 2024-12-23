USE [master]
GO
/****** Object:  Database [TechElite]    Script Date: 12/10/2024 6:48:43 PM ******/
CREATE DATABASE [TechElite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nvtcomputer_tech_nvtcomputer', FILENAME = N'D:\Apps\New folder\MSSQL16.MSSQLSERVER\MSSQL\DATA\nvtcomputer_tech_nvtcomputer_8c83fb43af2440b0a8d7daeb5f3bc5fb.mdf' , SIZE = 11264KB , MAXSIZE = 1572864KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nvtcomputer_tech_nvtcomputer_log', FILENAME = N'D:\Apps\New folder\MSSQL16.MSSQLSERVER\MSSQL\DATA\nvtcomputer_tech_nvtcomputer_c0b7dc5f4ce44bd4b23972f14ab9bf8b.ldf' , SIZE = 9024KB , MAXSIZE = 1572864KB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TechElite] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechElite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechElite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechElite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechElite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechElite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechElite] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechElite] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TechElite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechElite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechElite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechElite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechElite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechElite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechElite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechElite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechElite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TechElite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechElite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechElite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechElite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechElite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechElite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechElite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechElite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechElite] SET  MULTI_USER 
GO
ALTER DATABASE [TechElite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechElite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechElite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechElite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechElite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechElite] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TechElite', N'ON'
GO
ALTER DATABASE [TechElite] SET QUERY_STORE = OFF
GO
USE [TechElite]
GO
/****** Object:  User [nvt]    Script Date: 12/10/2024 6:48:43 PM ******/
CREATE USER [nvt] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[nvt]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [nvt]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [nvt]
GO
ALTER ROLE [db_datareader] ADD MEMBER [nvt]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [nvt]
GO
/****** Object:  Schema [nvt]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE SCHEMA [nvt]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](max) NULL,
	[create_at] [datetime] NOT NULL,
	[status] [char](1) NULL,
	[email] [nvarchar](100) NOT NULL,
	[create_by] [nvarchar](100) NULL,
	[update_by] [nvarchar](100) NULL,
	[update_at] [datetime] NOT NULL,
	[Requestcode] [nvarchar](100) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Avatar] [text] NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountAddress]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAddress](
	[account_address_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[province_id] [int] NOT NULL,
	[district_id] [int] NOT NULL,
	[ward_id] [int] NOT NULL,
	[accountPhoneNumber] [nvarchar](10) NULL,
	[accountUsername] [nvarchar](20) NULL,
	[content] [nvarchar](50) NULL,
	[isDefault] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AccountAddress] PRIMARY KEY CLUSTERED 
(
	[account_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](50) NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[create_at] [datetime] NOT NULL,
	[update_by] [nvarchar](100) NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[create_by] [nvarchar](20) NOT NULL,
	[create_at] [datetime] NOT NULL,
	[status] [nvarchar](1) NOT NULL,
	[update_by] [nvarchar](20) NOT NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_dbo.Contact] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[delivery_id] [int] IDENTITY(1,1) NOT NULL,
	[delivery_name] [nvarchar](100) NOT NULL,
	[price] [money] NOT NULL,
	[create_at] [datetime] NOT NULL,
	[create_by] [varchar](20) NOT NULL,
	[status] [char](1) NULL,
	[update_by] [nvarchar](20) NOT NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_dbo.Delivery] PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[disscount_id] [int] IDENTITY(1,1) NOT NULL,
	[discount_name] [nvarchar](100) NOT NULL,
	[discount_star] [datetime] NOT NULL,
	[discount_end] [datetime] NOT NULL,
	[discount_price] [float] NOT NULL,
	[discount_code] [nvarchar](10) NULL,
	[create_at] [datetime] NOT NULL,
	[create_by] [nvarchar](100) NOT NULL,
	[update_by] [nvarchar](100) NOT NULL,
	[update_at] [datetime] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Discount] PRIMARY KEY CLUSTERED 
(
	[disscount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[district_id] [int] IDENTITY(1,1) NOT NULL,
	[province_id] [int] NOT NULL,
	[district_name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Districts] PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
	[disscount_id] [int] NOT NULL,
	[rate_star] [int] NOT NULL,
	[create_at] [datetime] NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[stastus] [char](1) NULL,
	[update_by] [nvarchar](100) NOT NULL,
	[update_at] [datetime] NULL,
	[content] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [nvarchar](50) NOT NULL,
	[create_at] [datetime] NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[update_by] [nvarchar](100) NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Genre] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oder_Detail]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oder_Detail](
	[product_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
	[disscount_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[status] [char](1) NULL,
	[transection] [nvarchar](50) NOT NULL,
	[create_by] [varchar](20) NOT NULL,
	[create_at] [datetime] NOT NULL,
	[update_by] [nvarchar](20) NOT NULL,
	[update_at] [datetime] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Oder_Detail] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[genre_id] ASC,
	[disscount_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_id] [int] NOT NULL,
	[delivery_id] [int] NOT NULL,
	[oder_date] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[account_id] [int] NOT NULL,
	[status] [char](1) NULL,
	[create_at] [datetime] NOT NULL,
	[create_by] [varchar](100) NOT NULL,
	[update_by] [nvarchar](100) NOT NULL,
	[update_at] [datetime] NOT NULL,
	[order_note] [nvarchar](200) NULL,
	[orderAddressId] [int] NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAddress]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAddress](
	[orderAddressId] [int] IDENTITY(1,1) NOT NULL,
	[orderPhonenumber] [nvarchar](10) NULL,
	[orderUsername] [nvarchar](20) NULL,
	[content] [nvarchar](150) NULL,
	[timesEdit] [int] NOT NULL,
	[province_id] [int] NULL,
	[district_id] [int] NULL,
	[ward_id] [int] NULL,
 CONSTRAINT [PK_dbo.OrderAddress] PRIMARY KEY CLUSTERED 
(
	[orderAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_name] [nvarchar](50) NOT NULL,
	[create_at] [datetime] NOT NULL,
	[create_by] [varchar](20) NOT NULL,
	[status] [char](1) NULL,
	[update_by] [nvarchar](20) NOT NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_dbo.Payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_id] [int] NOT NULL,
	[disscount_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[product_name] [nvarchar](200) NOT NULL,
	[price] [float] NOT NULL,
	[view] [bigint] NOT NULL,
	[buyturn] [bigint] NOT NULL,
	[quantity] [varchar](10) NULL,
	[status] [char](1) NULL,
	[create_by] [varchar](100) NOT NULL,
	[create_at] [datetime] NOT NULL,
	[Type] [int] NULL,
	[update_by] [nvarchar](100) NULL,
	[update_at] [datetime] NOT NULL,
	[specifications] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[genre_id] ASC,
	[disscount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[product_img_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
	[disscount_id] [int] NOT NULL,
	[image] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.ProductImages] PRIMARY KEY CLUSTERED 
(
	[product_img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[province_id] [int] IDENTITY(1,1) NOT NULL,
	[province_name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Provinces] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyFeedback]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyFeedback](
	[rep_feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[stastus] [nvarchar](1) NULL,
	[create_at] [datetime] NOT NULL,
	[feedback_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ReplyFeedback] PRIMARY KEY CLUSTERED 
(
	[rep_feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wards]    Script Date: 12/10/2024 6:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wards](
	[ward_id] [int] IDENTITY(1,1) NOT NULL,
	[district_id] [int] NOT NULL,
	[ward_name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Wards] PRIMARY KEY CLUSTERED 
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_account_id] ON [dbo].[AccountAddress]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_district_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_district_id] ON [dbo].[AccountAddress]
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_province_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_province_id] ON [dbo].[AccountAddress]
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ward_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_ward_id] ON [dbo].[AccountAddress]
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_province_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_province_id] ON [dbo].[Districts]
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_account_id] ON [dbo].[Feedback]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_id_genre_id_disscount_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_id_genre_id_disscount_id] ON [dbo].[Feedback]
(
	[product_id] ASC,
	[genre_id] ASC,
	[disscount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_order_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_order_id] ON [dbo].[Oder_Detail]
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_id_genre_id_disscount_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_id_genre_id_disscount_id] ON [dbo].[Oder_Detail]
(
	[product_id] ASC,
	[genre_id] ASC,
	[disscount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_account_id] ON [dbo].[Order]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_delivery_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_delivery_id] ON [dbo].[Order]
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_orderAddressId]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_orderAddressId] ON [dbo].[Order]
(
	[orderAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_payment_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_payment_id] ON [dbo].[Order]
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_district_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_district_id] ON [dbo].[OrderAddress]
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_province_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_province_id] ON [dbo].[OrderAddress]
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ward_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_ward_id] ON [dbo].[OrderAddress]
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_brand_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_brand_id] ON [dbo].[Product]
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_disscount_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_disscount_id] ON [dbo].[Product]
(
	[disscount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_genre_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_genre_id] ON [dbo].[Product]
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_product_id_genre_id_disscount_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_product_id_genre_id_disscount_id] ON [dbo].[ProductImages]
(
	[product_id] ASC,
	[genre_id] ASC,
	[disscount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_account_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_account_id] ON [dbo].[ReplyFeedback]
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_feedback_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_feedback_id] ON [dbo].[ReplyFeedback]
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_district_id]    Script Date: 12/10/2024 6:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_district_id] ON [dbo].[Wards]
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__create___45F365D3]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__status__46E78A0C]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__Name__56B3DD81]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__Phone__57A801BA]  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Contact] ADD  DEFAULT ('') FOR [status]
GO
ALTER TABLE [dbo].[Contact] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Delivery] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Genre] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Oder_Detail] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Oder_Detail] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [update_at]
GO
ALTER TABLE [dbo].[Oder_Detail] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ('') FOR [update_by]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__view__5629CD9C]  DEFAULT ((0)) FOR [view]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__buyturn__571DF1D5]  DEFAULT ((0)) FOR [buyturn]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__status__5812160E]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__create___41B8C09B]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Type__59FA5E80]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__update___5AEE82B9]  DEFAULT ('1900-01-01T00:00:00.000') FOR [update_at]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('') FOR [description]
GO
ALTER TABLE [dbo].[ReplyFeedback] ADD  DEFAULT ((0)) FOR [account_id]
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AccountAddress_dbo.Account_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_dbo.AccountAddress_dbo.Account_account_id]
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AccountAddress_dbo.Districts_district_id] FOREIGN KEY([district_id])
REFERENCES [dbo].[Districts] ([district_id])
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_dbo.AccountAddress_dbo.Districts_district_id]
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AccountAddress_dbo.Provinces_province_id] FOREIGN KEY([province_id])
REFERENCES [dbo].[Provinces] ([province_id])
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_dbo.AccountAddress_dbo.Provinces_province_id]
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AccountAddress_dbo.Wards_ward_id] FOREIGN KEY([ward_id])
REFERENCES [dbo].[Wards] ([ward_id])
GO
ALTER TABLE [dbo].[AccountAddress] CHECK CONSTRAINT [FK_dbo.AccountAddress_dbo.Wards_ward_id]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Districts_dbo.Provinces_province_id] FOREIGN KEY([province_id])
REFERENCES [dbo].[Provinces] ([province_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_dbo.Districts_dbo.Provinces_province_id]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Feedback_dbo.Account_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_dbo.Feedback_dbo.Account_account_id]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Feedback_dbo.Product_product_id_genre_id_disscount_id] FOREIGN KEY([product_id], [genre_id], [disscount_id])
REFERENCES [dbo].[Product] ([product_id], [genre_id], [disscount_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_dbo.Feedback_dbo.Product_product_id_genre_id_disscount_id]
GO
ALTER TABLE [dbo].[Oder_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Oder_Detail_dbo.Order_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Oder_Detail] CHECK CONSTRAINT [FK_dbo.Oder_Detail_dbo.Order_order_id]
GO
ALTER TABLE [dbo].[Oder_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Oder_Detail_dbo.Product_product_id_genre_id_disscount_id] FOREIGN KEY([product_id], [genre_id], [disscount_id])
REFERENCES [dbo].[Product] ([product_id], [genre_id], [disscount_id])
GO
ALTER TABLE [dbo].[Oder_Detail] CHECK CONSTRAINT [FK_dbo.Oder_Detail_dbo.Product_product_id_genre_id_disscount_id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.Account_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.Account_account_id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.Delivery_delivery_id] FOREIGN KEY([delivery_id])
REFERENCES [dbo].[Delivery] ([delivery_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.Delivery_delivery_id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.Order_Address_orderAddressId] FOREIGN KEY([orderAddressId])
REFERENCES [dbo].[OrderAddress] ([orderAddressId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.Order_Address_orderAddressId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.Payment_payment_id] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.Payment_payment_id]
GO
ALTER TABLE [dbo].[OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAddress_dbo.Districts_district_id] FOREIGN KEY([district_id])
REFERENCES [dbo].[Districts] ([district_id])
GO
ALTER TABLE [dbo].[OrderAddress] CHECK CONSTRAINT [FK_dbo.OrderAddress_dbo.Districts_district_id]
GO
ALTER TABLE [dbo].[OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAddress_dbo.Provinces_province_id] FOREIGN KEY([province_id])
REFERENCES [dbo].[Provinces] ([province_id])
GO
ALTER TABLE [dbo].[OrderAddress] CHECK CONSTRAINT [FK_dbo.OrderAddress_dbo.Provinces_province_id]
GO
ALTER TABLE [dbo].[OrderAddress]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAddress_dbo.Wards_ward_id] FOREIGN KEY([ward_id])
REFERENCES [dbo].[Wards] ([ward_id])
GO
ALTER TABLE [dbo].[OrderAddress] CHECK CONSTRAINT [FK_dbo.OrderAddress_dbo.Wards_ward_id]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Brand_brand_id] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Brand_brand_id]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Discount_disscount_id] FOREIGN KEY([disscount_id])
REFERENCES [dbo].[Discount] ([disscount_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Discount_disscount_id]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Genre_genre_id] FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genre] ([genre_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Genre_genre_id]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductImages_dbo.Product_product_id_genre_id_disscount_id] FOREIGN KEY([product_id], [genre_id], [disscount_id])
REFERENCES [dbo].[Product] ([product_id], [genre_id], [disscount_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_dbo.ProductImages_dbo.Product_product_id_genre_id_disscount_id]
GO
ALTER TABLE [dbo].[ReplyFeedback]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ReplyFeedback_dbo.Account_account_id] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReplyFeedback] CHECK CONSTRAINT [FK_dbo.ReplyFeedback_dbo.Account_account_id]
GO
ALTER TABLE [dbo].[ReplyFeedback]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ReplyFeedback_dbo.Feedback_feedback_id] FOREIGN KEY([feedback_id])
REFERENCES [dbo].[Feedback] ([feedback_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReplyFeedback] CHECK CONSTRAINT [FK_dbo.ReplyFeedback_dbo.Feedback_feedback_id]
GO
ALTER TABLE [dbo].[Wards]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Wards_dbo.Districts_district_id] FOREIGN KEY([district_id])
REFERENCES [dbo].[Districts] ([district_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wards] CHECK CONSTRAINT [FK_dbo.Wards_dbo.Districts_district_id]
GO
USE [master]
GO
ALTER DATABASE [TechElite] SET  READ_WRITE 
GO
