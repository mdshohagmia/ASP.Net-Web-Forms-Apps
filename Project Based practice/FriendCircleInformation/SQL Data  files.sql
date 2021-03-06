USE [master]
GO
/****** Object:  Database [FriendCircleInformation]    Script Date: 10-Jun-16 4:59:19 PM ******/
CREATE DATABASE [FriendCircleInformation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FriendCircleInformation', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FriendCircleInformation.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FriendCircleInformation_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FriendCircleInformation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FriendCircleInformation] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FriendCircleInformation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FriendCircleInformation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET ARITHABORT OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FriendCircleInformation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FriendCircleInformation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FriendCircleInformation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FriendCircleInformation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FriendCircleInformation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FriendCircleInformation] SET  MULTI_USER 
GO
ALTER DATABASE [FriendCircleInformation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FriendCircleInformation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FriendCircleInformation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FriendCircleInformation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FriendCircleInformation]
GO
/****** Object:  Table [dbo].[Information]    Script Date: 10-Jun-16 4:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Information](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[BloodGroup] [varchar](2) NULL,
	[Email] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[Location] [varchar](100) NULL,
 CONSTRAINT [PK_Information] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Information] ON 

INSERT [dbo].[Information] ([ID], [Name], [BloodGroup], [Email], [MobileNo], [Location]) VALUES (1, N'Shohag', N'A+', N'shohaghassan14@gmail.com', N'01926029000', N'IIUC Hall-2')
INSERT [dbo].[Information] ([ID], [Name], [BloodGroup], [Email], [MobileNo], [Location]) VALUES (2, N'Mamun', N'B+', N'mamnum@gmail.com', N'01234567', N'Chittagong')
INSERT [dbo].[Information] ([ID], [Name], [BloodGroup], [Email], [MobileNo], [Location]) VALUES (3, N'Osman', N'O+', N'osma@gmail.com', N'123456789', N'Chittagong')
INSERT [dbo].[Information] ([ID], [Name], [BloodGroup], [Email], [MobileNo], [Location]) VALUES (4, N'Shakil', N'A+', N'shakil@gmail.com', N'12345678', N'Gaibandha')
INSERT [dbo].[Information] ([ID], [Name], [BloodGroup], [Email], [MobileNo], [Location]) VALUES (5, N'Nahid', N'AB', N'nahid@gmail.com', N'12345678', N'Rangamati')
INSERT [dbo].[Information] ([ID], [Name], [BloodGroup], [Email], [MobileNo], [Location]) VALUES (6, N'Arifur Rahaman', N'O+', N'aparif@gmail.com', N'12345678', N'Chittagong')
SET IDENTITY_INSERT [dbo].[Information] OFF
USE [master]
GO
ALTER DATABASE [FriendCircleInformation] SET  READ_WRITE 
GO
