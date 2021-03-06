USE [master]
GO
/****** Object:  Database [DiagnosticCenterBillManagementSystemDB]    Script Date: 23-Feb-17 11:49:58 PM ******/
CREATE DATABASE [DiagnosticCenterBillManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagnosticCenterBillManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiagnosticCenterBillManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagnosticCenterBillManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiagnosticCenterBillManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagnosticCenterBillManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagnosticCenterBillManagementSystemDB]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [varchar](50) NOT NULL,
	[DueDate] [date] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[TestId] [int] NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[BirthDate] [varchar](50) NOT NULL,
	[BillId] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestList]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DueDate] [date] NOT NULL,
	[TestName] [varchar](50) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TestList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestNameTypeNameTemp]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestNameTypeNameTemp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](50) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TestNameTypeNameTemp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](50) NOT NULL,
	[Fee] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Types]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[PaymentView]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PaymentView] AS
SELECT BillNo,Mobile,TotalAmount,DueDate
FROM Bills
INNER JOIN Patients
ON Patients.BillId=Bills.Id
GO
/****** Object:  View [dbo].[TestView]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestView] AS
SELECT TestName,Fee,TypeName
FROM Types
INNER JOIN Tests
ON Tests.TypeId=Types.Id
GO
/****** Object:  View [dbo].[TestWiseReportView]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestWiseReportView] AS
SELECT TestName,COUNT(TestNameTypeNameTemp.TestName) AS TotalNoOfTest FROM TestNameTypeNameTemp
GROUP BY TestName
GO
/****** Object:  View [dbo].[TypeWiseReportView]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TypeWiseReportView] AS
SELECT TypeName,COUNT(TestNameTypeNameTemp.TypeName) AS TotalNoOfTest FROM TestNameTypeNameTemp
GROUP BY TypeName
GO
/****** Object:  View [dbo].[UnpaidPatientsView]    Script Date: 23-Feb-17 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UnpaidPatientsView] AS
SELECT BillNo,Mobile,Name,TotalAmount,DueDate
FROM Bills
INNER JOIN Patients
ON Patients.BillId=Bills.Id
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([Id], [BillNo], [DueDate], [TotalAmount], [TestId]) VALUES (23, N'01914922922Masum', CAST(0x7E3C0B00 AS Date), 1300, 0)
SET IDENTITY_INSERT [dbo].[Bills] OFF
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([Id], [Name], [Mobile], [BirthDate], [BillId]) VALUES (8, N'Masum', N'01914922922', N'1997-02-08', 23)
SET IDENTITY_INSERT [dbo].[Patients] OFF
SET IDENTITY_INSERT [dbo].[TestList] ON 

INSERT [dbo].[TestList] ([Id], [DueDate], [TestName], [TypeName]) VALUES (1, CAST(0x7E3C0B00 AS Date), N'Complete Blood count', N'Blood')
INSERT [dbo].[TestList] ([Id], [DueDate], [TestName], [TypeName]) VALUES (2, CAST(0x7E3C0B00 AS Date), N'Hand X-ray', N'X-Ray')
INSERT [dbo].[TestList] ([Id], [DueDate], [TestName], [TypeName]) VALUES (3, CAST(0x7E3C0B00 AS Date), N'RBS', N'Blood')
INSERT [dbo].[TestList] ([Id], [DueDate], [TestName], [TypeName]) VALUES (4, CAST(0x7E3C0B00 AS Date), N'Lower Abdomen', N'USG')
SET IDENTITY_INSERT [dbo].[TestList] OFF
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (5, N'Complete Blood count', 400, 4)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (6, N'RBS', 150, 4)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (7, N'S. Creatinine', 350, 4)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (8, N'Lipid profile', 450, 4)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (9, N'Hand X-ray', 200, 5)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (10, N'Feet X-ray', 300, 5)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (11, N'LS Spine', 1100, 5)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (12, N'Lower Abdomen', 550, 6)
INSERT [dbo].[Tests] ([Id], [TestName], [Fee], [TypeId]) VALUES (13, N'Whole Abdomen', 800, 6)
SET IDENTITY_INSERT [dbo].[Tests] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([Id], [TypeName]) VALUES (4, N'Blood')
INSERT [dbo].[Types] ([Id], [TypeName]) VALUES (7, N'ECG')
INSERT [dbo].[Types] ([Id], [TypeName]) VALUES (8, N'Echo')
INSERT [dbo].[Types] ([Id], [TypeName]) VALUES (6, N'USG')
INSERT [dbo].[Types] ([Id], [TypeName]) VALUES (5, N'X-Ray')
SET IDENTITY_INSERT [dbo].[Types] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Bills]    Script Date: 23-Feb-17 11:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bills] ON [dbo].[Bills]
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Patients]    Script Date: 23-Feb-17 11:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Patients] ON [dbo].[Patients]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tests]    Script Date: 23-Feb-17 11:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tests] ON [dbo].[Tests]
(
	[TestName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Types]    Script Date: 23-Feb-17 11:49:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Types] ON [dbo].[Types]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Bills] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Bills]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Types]
GO
USE [master]
GO
ALTER DATABASE [DiagnosticCenterBillManagementSystemDB] SET  READ_WRITE 
GO
