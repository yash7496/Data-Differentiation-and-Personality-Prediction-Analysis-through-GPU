USE [master]
GO
/****** Object:  Database [personalityprediction_GPU_277]    Script Date: 04/05/2018 17:56:44 ******/
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
/****** Object:  Table [dbo].[temp_z]    Script Date: 04/05/2018 17:56:44 ******/
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
INSERT [dbo].[temp_z] ([id], [status], [value_]) VALUES (1, N'Introvert', 1.0446773550837365E-07)
INSERT [dbo].[temp_z] ([id], [status], [value_]) VALUES (2, N'Ambivert', 4.0241269897286478E-07)
INSERT [dbo].[temp_z] ([id], [status], [value_]) VALUES (3, N'Extrovert', 5.3702412643272669E-12)
SET IDENTITY_INSERT [dbo].[temp_z] OFF
/****** Object:  Table [dbo].[system_time_comp]    Script Date: 04/05/2018 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[system_time_comp](
	[timer_] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[output_master_naive]    Script Date: 04/05/2018 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[output_master_naive](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[test1] [numeric](18, 0) NULL,
	[test2] [numeric](18, 0) NULL,
	[test3] [numeric](18, 0) NULL,
	[test4] [numeric](18, 0) NULL,
	[result] [varchar](50) NULL,
 CONSTRAINT [PK_output_master_naive] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[output_master_naive] ON
INSERT [dbo].[output_master_naive] ([id], [test1], [test2], [test3], [test4], [result]) VALUES (1, CAST(35 AS Numeric(18, 0)), CAST(68 AS Numeric(18, 0)), CAST(57 AS Numeric(18, 0)), CAST(69 AS Numeric(18, 0)), N'Extrovert')
INSERT [dbo].[output_master_naive] ([id], [test1], [test2], [test3], [test4], [result]) VALUES (2, CAST(52 AS Numeric(18, 0)), CAST(57 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), CAST(39 AS Numeric(18, 0)), N'Extrovert')
INSERT [dbo].[output_master_naive] ([id], [test1], [test2], [test3], [test4], [result]) VALUES (3, CAST(48 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(58 AS Numeric(18, 0)), CAST(62 AS Numeric(18, 0)), N'Extrovert')
INSERT [dbo].[output_master_naive] ([id], [test1], [test2], [test3], [test4], [result]) VALUES (4, CAST(75 AS Numeric(18, 0)), CAST(68 AS Numeric(18, 0)), CAST(79 AS Numeric(18, 0)), CAST(82 AS Numeric(18, 0)), N'Introvert')
INSERT [dbo].[output_master_naive] ([id], [test1], [test2], [test3], [test4], [result]) VALUES (5, CAST(84 AS Numeric(18, 0)), CAST(70 AS Numeric(18, 0)), CAST(58 AS Numeric(18, 0)), CAST(76 AS Numeric(18, 0)), N'Ambivert')
INSERT [dbo].[output_master_naive] ([id], [test1], [test2], [test3], [test4], [result]) VALUES (6, CAST(69 AS Numeric(18, 0)), CAST(79 AS Numeric(18, 0)), CAST(72 AS Numeric(18, 0)), CAST(86 AS Numeric(18, 0)), N'Ambivert')
SET IDENTITY_INSERT [dbo].[output_master_naive] OFF
/****** Object:  Table [dbo].[output_master]    Script Date: 04/05/2018 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[output_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url_] [varchar](max) NULL,
	[file_result] [varchar](max) NULL,
	[output_] [varchar](max) NULL,
	[pagerank_] [bigint] NULL,
	[age_] [bigint] NULL,
 CONSTRAINT [PK_output_master] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[graph_table_naive1]    Script Date: 04/05/2018 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[graph_table_naive1](
	[data_] [varchar](max) NULL,
	[value_] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[graph_table_naive1] ([data_], [value_]) VALUES (N'Accuracy', 45)
INSERT [dbo].[graph_table_naive1] ([data_], [value_]) VALUES (N'recall', 0.675)
INSERT [dbo].[graph_table_naive1] ([data_], [value_]) VALUES (N'fmeasure', 0.59999999999999987)
/****** Object:  Table [dbo].[graph_table_naive]    Script Date: 04/05/2018 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[graph_table_naive](
	[data_] [varchar](max) NULL,
	[value_] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[graph_table_naive] ([data_], [value_]) VALUES (N'Accuracy', 50)
INSERT [dbo].[graph_table_naive] ([data_], [value_]) VALUES (N'recall', 0.75)
INSERT [dbo].[graph_table_naive] ([data_], [value_]) VALUES (N'fmeasure', 0.66666666666666652)
/****** Object:  Table [dbo].[dataset]    Script Date: 04/05/2018 17:56:44 ******/
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
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Introvert', 59, 78, 90, 97)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Ambivert', 68, 75, 71, 53)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Ambivert', 69, 72, 69, 71)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Ambivert', 65, 98, 36, 70)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Extrovert', 49, 48, 41, 43)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Introvert', 84, 86, 82, 87)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Introvert', 98, 52, 76, 71)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Introvert', 91, 82, 80, 98)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Extrovert', 35, 68, 57, 69)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Extrovert', 52, 57, 40, 39)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Extrovert', 48, 38, 58, 62)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Ambivert', 75, 68, 79, 82)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Ambivert', 84, 70, 58, 76)
INSERT [dbo].[dataset] ([result], [Test1], [Test2], [Test3], [Test4]) VALUES (N'Ambivert', 69, 79, 72, 86)
/****** Object:  Table [dbo].[admin_master]    Script Date: 04/05/2018 17:56:44 ******/
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
/****** Object:  Table [dbo].[accuracy_master1]    Script Date: 04/05/2018 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accuracy_master1](
	[for_] [varchar](max) NULL,
	[accuracy_] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[accuracy_master]    Script Date: 04/05/2018 17:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accuracy_master](
	[for_] [varchar](max) NULL,
	[accuracy_] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
INSERT [dbo].[accuracy_master] ([for_], [accuracy_]) VALUES (N'NAIVE BAYES', 50)
