USE [master]
GO
/****** Object:  Database [StudentManagementDB]    Script Date: 20-Jun-16 4:23:20 PM ******/
CREATE DATABASE [StudentManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManagementDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StudentManagementDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentManagementDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StudentManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StudentManagementDB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 20-Jun-16 4:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 20-Jun-16 4:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](80) NOT NULL,
	[RegNo] [varchar](10) NOT NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[StudentWiseDepartment]    Script Date: 20-Jun-16 4:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[StudentWiseDepartment]
AS
Select s.Id,s.RegNo,s.Name,s.ContactNo,s.Email,d.Code,d.Name  DepartmentName from Student as s
INNER JOIN Department as d
ON s.DepartmentId=d.Id

GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'BBA', N'Business Administration ')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'EEE', N'Electrical & Electronics Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (4, N'ETE', N'Electronics & Telecommunication Engineering')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [RegNo], [Email], [ContactNo], [DepartmentId]) VALUES (101, N'Shohag Hassan', N'1234567890', N'shohagh@gmail.com', N'0192722', 4)
INSERT [dbo].[Student] ([Id], [Name], [RegNo], [Email], [ContactNo], [DepartmentId]) VALUES (104, N'Musa', N'2134321234', N'musa@gmail.com', N'098765432345', 3)
INSERT [dbo].[Student] ([Id], [Name], [RegNo], [Email], [ContactNo], [DepartmentId]) VALUES (105, N'Fahomid Hassan', N'1234321234', N'fahomid@gmail.com', N'65432', 4)
INSERT [dbo].[Student] ([Id], [Name], [RegNo], [Email], [ContactNo], [DepartmentId]) VALUES (109, N'Asiqur Rahaman', N'4323454321', N'asiqur@gmail.com', N'6543567', 2)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student]    Script Date: 20-Jun-16 4:23:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student] ON [dbo].[Student]
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
USE [master]
GO
ALTER DATABASE [StudentManagementDB] SET  READ_WRITE 
GO
