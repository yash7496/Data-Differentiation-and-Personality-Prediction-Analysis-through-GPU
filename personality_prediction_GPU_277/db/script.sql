USE [master]
GO
/****** Object:  Database [personalityprediction_GPU_277]    Script Date: 03/16/2018 17:22:07 ******/
CREATE DATABASE [personalityprediction_GPU_277] ON  PRIMARY 
( NAME = N'personalityprediction_GPU_277', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\personalityprediction_GPU_277.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'personalityprediction_GPU_277_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\personalityprediction_GPU_277_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [personalityprediction_GPU_277] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [personalityprediction_GPU_277].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [personalityprediction_GPU_277] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET ANSI_NULLS OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET ANSI_PADDING OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET ARITHABORT OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [personalityprediction_GPU_277] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [personalityprediction_GPU_277] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [personalityprediction_GPU_277] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET  DISABLE_BROKER
GO
ALTER DATABASE [personalityprediction_GPU_277] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [personalityprediction_GPU_277] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [personalityprediction_GPU_277] SET  READ_WRITE
GO
ALTER DATABASE [personalityprediction_GPU_277] SET RECOVERY FULL
GO
ALTER DATABASE [personalityprediction_GPU_277] SET  MULTI_USER
GO
ALTER DATABASE [personalityprediction_GPU_277] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [personalityprediction_GPU_277] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'personalityprediction_GPU_277', N'ON'
GO
USE [personalityprediction_GPU_277]
GO
/****** Object:  Table [dbo].[temp_z]    Script Date: 03/16/2018 17:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temp_z](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](max) NULL,
	[value_] [float] NULL,
 CONSTRAINT [PK_temp_z] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[temp_z] ON
INSERT [dbo].[temp_z] ([id], [status], [value_]) VALUES (1, N'Good', 8.68716521356866E-08)
INSERT [dbo].[temp_z] ([id], [status], [value_]) VALUES (2, N'Fair', 2.2483666994531736E-09)
INSERT [dbo].[temp_z] ([id], [status], [value_]) VALUES (3, N'Poor', 3.395373469558486E-19)
SET IDENTITY_INSERT [dbo].[temp_z] OFF
/****** Object:  Table [dbo].[dataset]    Script Date: 03/16/2018 17:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dataset](
	[result] [varchar](50) NULL,
	[Test1] [float] NULL,
	[Test2] [float] NULL,
	[Test3] [float] NULL,
	[Test4] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Good', 59, 78, 90, 97)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Fair', 68, 75, 71, 53)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Fair', 69, 72, 69, 71)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Fair', 65, 98, 36, 70)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Poor', 49, 48, 41, 43)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Good', 84, 86, 82, 87)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Good', 98, 52, 76, 71)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Good', 91, 82, 80, 98)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Poor', 35, 68, 57, 69)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Poor', 52, 57, 40, 39)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Poor', 48, 38, 58, 62)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Fair', 75, 68, 79, 82)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Fair', 84, 70, 58, 76)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Fair', 69, 79, 72, 86)
/****** Object:  Table [dbo].[admin_master]    Script Date: 03/16/2018 17:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin_master](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](max) NULL,
	[password] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin_master] ON
INSERT [dbo].[admin_master] ([aid], [username], [password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admin_master] OFF
