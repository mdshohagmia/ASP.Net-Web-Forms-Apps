USE [master]
GO
/****** Object:  Database [CountryManagement]    Script Date: 10-Jul-16 9:53:03 PM ******/
CREATE DATABASE [CountryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryManagement', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CountryManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryManagement_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CountryManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CountryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryManagement]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10-Jul-16 9:53:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
	[CityAbout] [varchar](1000) NULL,
	[NoOfDwellers] [bigint] NULL,
	[Weather] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10-Jul-16 9:53:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryAbout] [varchar](1000) NULL,
	[TotalCity] [int] NULL,
	[TotalDwellers] [bigint] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CitiesViewModel]    Script Date: 10-Jul-16 9:53:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CitiesViewModel]
AS
SELECT Ci.CityName , Ci.CityAbout, Ci.NoOfDwellers,Ci.Location,Ci.Weather,Co.CountryName,Co.CountryAbout from City Ci 
JOIN Country Co 
ON Ci.Country=Co.CountryName
GO
/****** Object:  View [dbo].[CountriesViewModel]    Script Date: 10-Jul-16 9:53:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountriesViewModel]
AS
SELECT Co.CountryName,Co.CountryAbout,ci.CityName,ci.NoOfDwellers from City Ci 
JOIN Country Co 
ON Ci.Country=Co.CountryName
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3022, N'Bangladesh', N'Dhaka', N'Dhaka About<br>', 10, N'Hot', N'Middle')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3023, N'Bangladesh', N'Comilla', N'Comilla About<br>', 12, N'Worm', N'South')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3024, N'Bangladesh', N'Rangpur', N'RangpurAbout<br>', 8, N'Sunnny', N'North')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3025, N'Australia', N'Canberra', N'<span></span><span><a href="https&#x3A;&#x2F;&#x2F;www&#x2E;google&#x2E;com&#x2E;bd&#x2F;search&#x3F;biw&#x3D;1366&#x26;amp&#x3B;amp&#x3B;bih&#x3D;659&#x26;amp&#x3B;amp&#x3B;q&#x3D;Canberra&#x2B;Australia&#x26;amp&#x3B;amp&#x3B;stick&#x3D;H4sIAAAAAAAAAOPgE&#x2D;LUz9U3SM5Iz6hU4gAxUwosDbRkspOt9HPykxNLMvPz9JPzS&#x5F;NKiiqtkhMLMksScwBCT8&#x5F;BNQAAAA&#x26;amp&#x3B;amp&#x3B;sa&#x3D;X&#x26;amp&#x3B;amp&#x3B;sqi&#x3D;2&#x26;amp&#x3B;amp&#x3B;ved&#x3D;0ahUKEwiw5vXllunNAhUJQY8KHfsoCsoQmxMIkwEoATAV">Canberra</a> about<br></span>', 10, N'Hot', N'North')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3026, N'Australia', N'Sydney', N'<span></span><span>Sydney about<br></span>', 1222, N'Hot', N'west')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3027, N'London', N'England', N'About <span>England <br></span>', 4, N'Hot', N'South')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3028, N'London', N'Barmingham', N'About Barmingham<span><br></span>', 5, N'Cool', N'North')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3029, N'London', N'Amsterdom', N'About Amsterdom<span><br></span>', 7, N'Cool', N'North')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3030, N'Canada', N'Torrento ', N'About Torrento <span><br></span>', 12, N'Cool', N'North')
INSERT [dbo].[City] ([Id], [Country], [CityName], [CityAbout], [NoOfDwellers], [Weather], [Location]) VALUES (3031, N'Canada', N'Ontorio', N'About Ontorio<span><br></span>', 8, N'Cool', N'North')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [CountryName], [CountryAbout], [TotalCity], [TotalDwellers]) VALUES (5134, N'Bangladesh', N'About Bangladesh<br>', 3, 30)
INSERT [dbo].[Country] ([Id], [CountryName], [CountryAbout], [TotalCity], [TotalDwellers]) VALUES (5135, N'Australia', N'About Australia<br>', 2, 1232)
INSERT [dbo].[Country] ([Id], [CountryName], [CountryAbout], [TotalCity], [TotalDwellers]) VALUES (5136, N'London', N'About London <br>', 3, 16)
INSERT [dbo].[Country] ([Id], [CountryName], [CountryAbout], [TotalCity], [TotalDwellers]) VALUES (5137, N'Canada', N'About Canada <br>', 2, 20)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_City]    Script Date: 10-Jul-16 9:53:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_City] ON [dbo].[City]
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Country]    Script Date: 10-Jul-16 9:53:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Country] ON [dbo].[Country]
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [CountryManagement] SET  READ_WRITE 
GO
