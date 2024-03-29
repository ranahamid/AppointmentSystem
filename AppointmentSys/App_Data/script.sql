USE [master]
GO
/****** Object:  Database [Appointment]    Script Date: 7/9/2018 3:12:14 AM ******/
CREATE DATABASE [Appointment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Appointment', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Appointment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Appointment_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Appointment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Appointment] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Appointment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Appointment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Appointment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Appointment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Appointment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Appointment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Appointment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Appointment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Appointment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Appointment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Appointment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Appointment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Appointment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Appointment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Appointment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Appointment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Appointment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Appointment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Appointment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Appointment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Appointment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Appointment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Appointment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Appointment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Appointment] SET  MULTI_USER 
GO
ALTER DATABASE [Appointment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Appointment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Appointment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Appointment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Appointment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Appointment] SET QUERY_STORE = OFF
GO
USE [Appointment]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Appointment]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/9/2018 3:12:15 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/9/2018 3:12:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/9/2018 3:12:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/9/2018 3:12:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/9/2018 3:12:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/9/2018 3:12:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[IsFakeEmail] [bit] NULL,
	[DoctorName] [nvarchar](256) NULL,
	[HospitalName] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorAppointmentTbl]    Script Date: 7/9/2018 3:12:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorAppointmentTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[AssignDoctorId] [int] NULL,
	[AssignDoctorName] [nvarchar](50) NULL,
	[AdvanceAmount] [int] NULL,
	[RemainingAmount] [int] NULL,
	[StartTime] [bigint] NULL,
	[EndTime] [bigint] NULL,
	[AppointmentTime] [nvarchar](50) NULL,
	[Serial] [int] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[IsPastDate] [bit] NULL,
 CONSTRAINT [PK_AppointmentTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorTbl]    Script Date: 7/9/2018 3:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[RegistrationNo] [int] NULL,
	[RegistrationType] [nvarchar](15) NULL,
	[ClinicHospitalName] [nvarchar](150) NULL,
	[Designation] [nvarchar](150) NOT NULL,
	[YearOfExperience] [decimal](18, 0) NULL,
	[WorkingArea] [nvarchar](500) NULL,
	[Addresss] [nvarchar](150) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[CanVisitDays] [nvarchar](20) NOT NULL,
	[VisitTimeStart] [time](7) NOT NULL,
	[VisitTimeEnd] [time](7) NOT NULL,
	[SlotDuration] [int] NOT NULL,
	[VisitFee] [int] NULL,
	[VisitingCard] [nvarchar](150) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_DoctorTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorWorkingAreaTbl]    Script Date: 7/9/2018 3:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorWorkingAreaTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkingArea] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2000) NULL,
 CONSTRAINT [PK_DoctorWorkingArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTbl]    Script Date: 7/9/2018 3:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExceptionMessage] [nvarchar](3050) NULL,
	[ExceptionStackTrace] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](256) NULL,
	[IpAddress] [nvarchar](256) NULL,
	[Browser] [nvarchar](3050) NULL,
	[OS] [nvarchar](256) NULL,
	[UserId] [uniqueidentifier] NULL,
	[ActionName] [nvarchar](256) NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_LogTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'034c549d-9e78-4037-97d1-07d5c08b2d16', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ddc2287a-910a-4272-8033-58df34cca189', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f3af0aef-3683-48f5-94a8-0ab54c79f480', N'Patient')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3fca3000-93d2-4b0b-8fb7-bd7a068a7d45', N'034c549d-9e78-4037-97d1-07d5c08b2d16')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c76c5ba2-d1b0-49e7-afb0-8ae21b287b0c', N'034c549d-9e78-4037-97d1-07d5c08b2d16')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd0741342-0fcc-4c9b-8679-67ed87212bb5', N'034c549d-9e78-4037-97d1-07d5c08b2d16')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'132ee4d4-ffc9-40c1-9837-8540b09fdccc', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'17fe6280-8ad7-46e8-8d54-5a6250ed8f9e', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2cbdea86-1246-4913-b25a-463717f8356b', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3247f4f6-4a4c-4847-a3a1-cbfb2d55f881', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'38c58189-61ed-4b79-a14f-0b0275030b72', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3c963905-01ab-41cb-944f-6779b453398e', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3dc2f407-571a-4964-a31a-aca6f2782ee6', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4309db6e-d727-4e5c-b3c0-0151cfb2f9c0', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'444b5462-656b-4482-a56f-4b6cfa0bbb58', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'474bf8f8-0b42-422f-b1ee-56e6a51ef1a0', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5593beb6-8b0d-411b-a60c-d6950220e9e4', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'59d6cac7-0281-4617-b119-606700683ed2', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5c921c24-cb60-449c-b4d7-7ad1151f4043', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5f740931-218a-4b50-88a3-8321b92849ff', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'64ac28fe-5c51-4b91-a092-3bb322d5a07d', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'64e7f1f3-5fe9-4afd-beda-781f00513888', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'69dc1435-84ab-42d4-8ffe-2e960b0a64c1', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'69e35015-10c1-4be1-9432-eeaa370af4a6', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6b4fdb5e-bf4a-4cdd-8a0c-c06c1f4f027c', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6c2b0a3d-ea1f-4bc3-8391-36bc384b3c11', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6f574bed-c891-4ee8-a6bd-decd200e0724', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6f8fd7b1-4caa-4cc7-80a4-34faca6d818c', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7938758d-b081-4dbf-85db-627be01c747a', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'79463a14-ded7-4288-97d2-c621c748ac91', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7ba05311-7f12-457f-9acf-667f7cfd4cf2', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7cd3ea2f-9894-4b82-9817-f39555d61557', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'80c5892b-59a6-4293-a6e2-a691a9d2d3f9', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8692c32d-d245-4d3a-bd98-f3130a5958b8', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8e9aa5ac-aa4d-4cb2-95b8-77d423f8d121', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'923364df-c4fb-4683-85ab-51a6abea2c34', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'960a692b-7f74-4468-a592-c9fa637a9f2c', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'979af7c2-e634-4ca6-b2d4-ed8d4c5dbf29', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9d652bf1-6804-4a6d-9c47-18b84d113294', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9ea8b551-4776-4c30-b46e-affeedab2368', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a3c440d0-fef2-49f4-a02c-46040d413630', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a5caf7c5-4ede-4e18-8bef-d7fc80aa8be6', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a6ceaa64-04df-41d2-be3f-b3b19997171d', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b8a4fe74-c391-4a15-a3ad-a30db3791d3a', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bb96fa0b-0d76-4f1b-b6ae-b310f656134a', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bf35e4d7-3bc9-4655-812a-d117974fb3e1', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c2d39a40-17c3-4469-b129-8b8bad55268d', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ca5d1d54-6cdf-472c-8ca1-7b03812f5b5b', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cb2ae2c0-cb38-4c24-a51d-3ac1fef731c9', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cf192814-e705-41c3-beea-5bfe0f250840', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd777c02b-55f0-44ce-b65b-17cc4c3c4e63', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd9b41544-9a33-44da-9605-51c050748c5d', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dccfaa1d-138d-4413-af5b-828a1c15bca2', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ddc6f541-6177-4f09-a122-20fbc20bfc85', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e0dd824a-0935-42d4-8cf5-20e01096d5a1', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e3898a4d-7294-4268-bcc3-16cad0430e36', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e7bbb86a-10ef-4481-85a7-c057b9fd5bf7', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ecfc6f40-76b9-4d95-8667-add9319fd8c1', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f0702137-6bf9-4e09-ad29-8fe6c2df2ea6', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f0fb480f-5b84-4dfe-bf18-deb33263bffe', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f3b51ed0-6414-4bed-ade4-c185eb7d7f4e', N'ddc2287a-910a-4272-8033-58df34cca189')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2df59ba0-cb75-4dc2-a98f-be84a8e38152', N'f3af0aef-3683-48f5-94a8-0ab54c79f480')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9e431c3a-6c88-45c6-836e-b60366468c83', N'f3af0aef-3683-48f5-94a8-0ab54c79f480')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cc66c7cb-a146-4880-8a3b-dcaeda373fe3', N'f3af0aef-3683-48f5-94a8-0ab54c79f480')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cd345f47-4788-4186-bcf3-a587426d8f6c', N'f3af0aef-3683-48f5-94a8-0ab54c79f480')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'00c2641a-aecc-4f97-b607-7b12e16e7c17', N'temp60477623636483046892721172@gmail.com', 0, N'ADlubfJibbdoWquoB4m3FjIbHy5Gko1nwmO0+8+mFeTA0VieUixDj0fILtsrJWFs+Q==', N'9041dae3-0709-4bdf-8817-805fd8f7e9a7', N'0185111', 0, 0, NULL, 1, 0, N'0185111', N'yoi', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'132ee4d4-ffc9-40c1-9837-8540b09fdccc', N'ranah.ami.d007@gmail.com', 0, N'AEiz266WOlbXHb6bwgQnZMGQfk+SGtGrtS4PreNOxLZhJVSH80JBVsUAMndLn9sbdg==', N'f52706a4-da61-4b8f-855f-033bbf1fcc49', N'32432', 1, 0, NULL, 1, 0, N'32432', N'sdf', N'32432', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'17fe6280-8ad7-46e8-8d54-5a6250ed8f9e', N'temp99565666636488075807143750@gmail.com', 0, N'ANbWXQfvkNQWggJM612lIfNFw1oU6zfc+DBvtRhH6SyPzMRbHFzdthLXmlNJZL6u/w==', N'06cb9038-c7fe-4a10-8952-753f7b6d69fa', N'147258369', 0, 0, NULL, 1, 0, N'147258369', N'opp', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'27d04f82-b98a-4ff2-9a9c-8c0b4a1078df', N'temp86681721636482946592564922@gmail.com', 0, N'AEssIuZPK47cwsxPLaMQzg06ckMBS5JJ7P+MTWLK3LmhKCeiQR6cetyxMALkrIM0oQ==', N'776d1b1c-e925-486a-8b77-f82d648cd000', N'25803', 0, 0, NULL, 1, 0, N'25803', N'rrggyhh', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'2cbdea86-1246-4913-b25a-463717f8356b', N'temp13145076636544276174750329@gmail.com', 0, N'AAjuRQ580i0Kqo8LLQbFG8a72+0MrlcYbNNaOq7H4oM184KalroeaUeqfJfdwNm9xQ==', N'1e251fa1-6dd3-4cf4-b5f1-7e973646b2ae', N'12121212121', 0, 0, NULL, 1, 0, N'12121212121', N'xxxxx', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'2df59ba0-cb75-4dc2-a98f-be84a8e38152', N'ranahamid0071@gmail.com', 0, N'ALc85nIbnVddFyY5e0F1M+0M0Bv9iQAzkULM2m8GKQGyT50KBV+W+D61f/my6NISjQ==', N'7c1f6f4b-315d-43ee-a12c-09efdb830cb4', N'123456123456', 0, 0, NULL, 1, 0, N'123456123456', N'HomeBanner- Shikhai', N'1', 0, N'2', N'234 432  ', N'324 ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'3247f4f6-4a4c-4847-a3a1-cbfb2d55f881', N'temp79131864636541861614028098@gmail.com', 0, N'AIw/evK41IXlTy1AEGR8opgPuyF55fFLhxFql/QNwt/Z+cB74zb2AmR70yx/tHrJfQ==', N'c52a3061-c486-4506-9d1c-4c9e8a66f183', N'01789358239', 0, 0, NULL, 1, 0, N'01789358239', N'Ripon Mahanto', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'37b958dc-ad8c-490e-ad8c-107073fe2dc1', N'temp10018632636483041357316926@gmail.com', 0, N'ABRuVnicUdBuh2h0Ey6g5ja8QZ854neA71Wb09ILj2uRqoPS75yTwhmE/mSJvUeiTA==', N'1db43fb9-27c8-488b-a371-78599f7eecc0', N'2', 0, 0, NULL, 1, 0, N'2', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'38c58189-61ed-4b79-a14f-0b0275030b72', N'ataur3543@gmail.com', 0, N'ANYTYduQNjh+BdSYx8dNrDOjm6O8A1cKuYcULVki/03VmyQ6UlZ8UfhEshrTcgKIgg==', N'6f22deef-557d-443e-9a9b-7c8e337cf039', N'01722651859', 0, 0, NULL, 1, 0, N'01722651859', N'Ataur Rahman', N'Ka/46,Mohakahli South area,Banani,Dhaka-1213', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'3c0e657d-353b-410d-826d-aeb8f8846531', N'b4s42@a.com', 0, N'AMDdJJ9ZhLDJgDW6BbcbOEmjqZUITf4OVi58153UihhcAolS6d4puytgaBZJKz0Pxw==', N'd667b393-de25-4090-b883-6b0361507f6a', N'017256214s423', 0, 0, NULL, 1, 0, N'017256214s423', N'Rana Hamid', N'Uttara, Dhaka', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'3c963905-01ab-41cb-944f-6779b453398e', N'temp45991615636508086235498047@gmail.com', 0, N'ADAoGHQsnWuYKGDfcPPmaeL3pAyql1L7KwOZDKAKrWhRVH2DNOvxY+tYIAIk39AuRQ==', N'c1314ebd-613d-4c69-a8ec-bccd3b8bf4cd', N'01820159681', 0, 0, NULL, 1, 0, N'01820159681', N'জুয়েল মিয়া', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'3dc2f407-571a-4964-a31a-aca6f2782ee6', N'temp36141376636488136689175000@gmail.com', 0, N'AHSyW9i18vsOVJ0KFVp+33Ju87enNg0ajjyssP2HH4MuuhAuqKNoU7WYE/68Y82ykw==', N'2e89a707-e429-4d6f-a671-b6524b718f7d', N'01624982354', 0, 0, NULL, 1, 0, N'01624982354', N'shamim rahman', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'3fca3000-93d2-4b0b-8fb7-bd7a068a7d45', N'riaz.netbd@gmail.com', 1, N'AEhYPtItFSnnRbkVdb6aqZ8bcVn0kKi3GeFj5AQFAU7r02sREx03z/LWmgPPy9myRw==', N'1cb7f463-1a66-4c70-8922-ce57dd187b3b', N'01911736165', 0, 0, NULL, 1, 0, N'01911736165', N'Riaz Ahmed', N'Comilla', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'4309db6e-d727-4e5c-b3c0-0151cfb2f9c0', N'temp90339241636505647512851562@gmail.com', 0, N'AHtZbDhCSdEp6QvF7QaNKg27/BXtyREZTgIrYdbhcVCWN2NF30rW2hk8P6+TmzwyFw==', N'12509ac6-a159-44ac-9299-c714e652f18a', N'01720046199', 0, 0, NULL, 1, 0, N'01720046199', N'sadia', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'444b5462-656b-4482-a56f-4b6cfa0bbb58', N'temp17008157636498399977092109@gmail.com', 0, N'AHjcTg2S4E2i4V7IkqwM7/UUjFlf3bTjJ+qRijqH4aFdeRgEFAhnbyLhwO2UxmjYdA==', N'ee727a0a-c8b0-43b6-a112-2d9a30ad746b', N'01996476870', 0, 0, NULL, 1, 0, N'01996476870', N'Hridoy', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'474bf8f8-0b42-422f-b1ee-56e6a51ef1a0', N'temp98308987636533208902570141@gmail.com', 0, N'AKtdpoM9/m//EcYoouuSkrj5KvsyzRCGB86FYTkvIpsA2svFQpTjJTrM+I7YjpW4OA==', N'50f62c3b-71e8-4c1e-861b-8951c10cbc41', N'01685282492', 0, 0, NULL, 1, 0, N'01685282492', N'siam', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'4ec30dc2-214a-4fd8-836f-84178452b457', N'test@test.com', 0, N'APPSrskiuL3kBsQbuS/AxAP2uGzmqRSsigYt9sIK/uIFQaXnIImOsqWQeRg4HkCnqg==', N'a48346ab-7dcf-4377-af65-20d54cb83386', N'45', 0, 0, NULL, 1, 0, N'45', N'test', N'test', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'51462807-bbe9-4f39-90c8-ff10d301a7a8', N'temp41075322636483046019283672@gmail.com', 0, N'AEETVCnq34kk3f9QmfpdnUjXyMQN252mEmO3OtGb3ZTWcHWmQ5mRq6kEg38hXwmpnQ==', N'524f23d2-2d27-4c39-beed-10d20019be07', N'01851115863', 0, 0, NULL, 1, 0, N'01851115863', N'rtrt', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'5262e40e-32f3-4f11-9041-c20b09f76594', N'temp35163099636482859741158672@gmail.com', 0, N'AA7IIqAWe6U7TGSko323hxyGlaOUYLpz79u5nO1zfdqgbDjw40rNCBYFNP+wxWf64g==', N'c08d28a4-6d6c-4fdf-90fd-0fe22a76b88a', N'0852963', 0, 0, NULL, 1, 0, N'0852963', N'raselCheck', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'5593beb6-8b0d-411b-a60c-d6950220e9e4', N'temp30962159636544317724503196@gmail.com', 0, N'ADI0K16tsibbIXkR0ZS7dB7XVFwN6KSXdfXlta++/iGy8jZ3Xbc9A7uIJfGZjbDxcw==', N'6ccaa820-a854-4c9d-9a6b-3579138a1187', N'525252', 0, 0, NULL, 1, 0, N'525252', N'rwwee', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'59d6cac7-0281-4617-b119-606700683ed2', N'temp49734814636508035409326172@gmail.com', 0, N'AAcOwpWtizp7F21BExI4kWpj9pZ2sITuvt714emI/FIjKT5RagHQQZvE1zsI+s8X0Q==', N'f51047af-f402-4e6c-a786-22bd8b0bc2bb', N'01878636094', 0, 0, NULL, 1, 0, N'01878636094', N'Shila', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'5bd8b37d-4fa7-42cc-a706-b6aaf6ab59d8', N'b2@a.com', 0, N'AGEQnpilXneMBAduhIf4wNQs+G0Jl5sRRcRfumSUTocREf+6fGb3e8NzcsRGmPhdnA==', N'e49ce6f8-d9f2-46b4-a931-a01f0636025f', N'0172562123', 0, 0, NULL, 1, 0, N'0172562123', N'Rana Hamid', N'Uttara, Dhaka', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'5c921c24-cb60-449c-b4d7-7ad1151f4043', N'temp89806820636509854628183594@gmail.com', 0, N'ALVNEAEXIFrA2v0C8BXWfnuiOhCcow+Ss5xYJm7VYo9kt6cNGoSok813aahIwAhHWg==', N'5c2b468c-b109-4516-86fa-c8db8689ce2e', N'01879918102', 0, 0, NULL, 1, 0, N'01879918102', N'Rifat', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'5f740931-218a-4b50-88a3-8321b92849ff', N'temp35338249636544306899684415@gmail.com', 0, N'AP+Y+2WwaLyW+pYezegfcy+Ky5JTmhtrCEA2ZdIHApWZMrtmRJusARStJ4aHU+3S6A==', N'5d105ba3-35c4-4803-a820-d201eb612651', N'8888888855', 0, 0, NULL, 1, 0, N'8888888855', N'ttttt', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'64ac28fe-5c51-4b91-a092-3bb322d5a07d', N'temp41347809636509880683457031@gmail.com', 0, N'AD9hFBPGlN9CQP5ocpEXGziP5mbM1OgF9CDmkCcCeCRYwVuCufaucYnS2yWu6rAYeg==', N'a5ccc45e-503d-4eb9-b795-0c906feba006', N'01832505487', 0, 0, NULL, 1, 0, N'01832505487', N'md al mamun', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'64c04408-c849-4071-8c41-3f2fa80d6add', N'temp83886006636483037557541083@gmail.com', 0, N'AACQY7xgh2nkqOkPa96Dxgum9brTwA5uNSl6hpiNhsoQqshQwmnl26KMteny/tsMUg==', N'f956b1f9-c5ae-4809-8b70-d0c6007b6da0', N'01', 0, 0, NULL, 1, 0, N'01', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'64e7f1f3-5fe9-4afd-beda-781f00513888', N'temp71237873636494409000172734@gmail.com', 0, N'AC/2GYsmbPkdJdlxwWdqRaXOkkAvfMNlELGqj4Tgk+MiSMam16smyZTbuIdzqtPhJw==', N'361126bd-5266-4351-b300-92c923a99bfc', N'01922849105', 0, 0, NULL, 1, 0, N'01922849105', N'Md Shohag', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'661429c1-9489-43b7-8f6a-cab1992c6952', N'temp82752175636483046439752422@gmail.com', 0, N'ALjkVZn5otAoSb/5s9Q4h2S8/YARf1aMWezGvgHd6rH1RvQDREAMXJ1KdhPr7yAtng==', N'0066bd7e-4f54-4cef-a8c5-cb8370f9fe57', N'01851115660', 0, 0, NULL, 1, 0, N'01851115660', N'you', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'69dc1435-84ab-42d4-8ffe-2e960b0a64c1', N'temp23987210636522695795851162@gmail.com', 0, N'AFg/PFSBNPpFad1yKUVPGghVNBgML1kb6OhiNUbL7GESwNM8IW1E997r1eDRUWbUeg==', N'6d20eca4-1395-438b-b8e3-eac94a97ca34', N'01771213491', 0, 0, NULL, 1, 0, N'01771213491', N'selim hossain', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'69e35015-10c1-4be1-9432-eeaa370af4a6', N'temp17496291636493248133857500@gmail.com', 0, N'AIv+PTgQjwFkSeBdkOhwX1PjGcdIJSH6PIJ3oP0VLsTLv6kg37d3qH+maPyoz9KE7Q==', N'6c37edde-ed85-48b5-a915-f04e2a5ce396', N'01836088123', 1, 0, NULL, 1, 0, N'01836088123', N'Anwar', N'AppointmentSys,Moonplaza', 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'6b4fdb5e-bf4a-4cdd-8a0c-c06c1f4f027c', N'temp16666061636490037503706250@gmail.com', 0, N'ADKCTqttNNR3XgqQjrFhSveGhrObOcC73iv8tnDyVlc+xkMArX6OZojVCyLgTDIJ+Q==', N'6c8997a5-b7f6-411c-89dc-f235ce0a8991', N'01938922202', 0, 0, NULL, 1, 0, N'01938922202', N'washim', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'6c2b0a3d-ea1f-4bc3-8391-36bc384b3c11', N'temp53082457636544276516156655@gmail.com', 0, N'AHFE5uj3YIC4BBoWfI8kaPUd/RfjMshcro8GlwqDQJaaRAAoMfIF2XZobBUHWefenw==', N'e083ce71-5ff0-4c11-b65b-908086434a6f', N'12345', 0, 0, NULL, 1, 0, N'12345', N'aassa', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'6f574bed-c891-4ee8-a6bd-decd200e0724', N'temp61495192636488076978862500@gmail.com', 0, N'AHHSNbo6rZan9qO5OxvMXZM7dbu5nUBElQ3GxD6Iq1vh3Zkr+ebjHV/NAGQfJEx6QQ==', N'e05e0ec3-9fd3-42e4-9ae6-91043e3bc997', N'01914625065', 0, 0, NULL, 1, 0, N'01914625065', N'rasel', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'6f8fd7b1-4caa-4cc7-80a4-34faca6d818c', N'temp97499160636510009157080078@gmail.com', 0, N'AKhBYqRPjwkGeC+r8iE8XEt82n5Vn5H/hh0J6H3Dvi5mwpnWaiBcJGXa6n3nhdjBEw==', N'5615a062-bfb7-46bf-ac08-9bf27aaf0d17', N'01754351445', 0, 0, NULL, 1, 0, N'01754351445', N'faysal', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'70b6896b-31c6-4307-b136-0abbb6bf0ce1', N'temp19755692636482865528971172@gmail.com', 0, N'AAJK+yWK4w37cMALkYQc+FEwMY56INeLASpColmn7gr96eIQ2E4lR2hUyc4mdYKWLA==', N'bae7b1ef-2173-41ec-84d6-bf05f289e053', N'4567', 0, 0, NULL, 1, 0, N'4567', N'xsw', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'775913ba-cef9-447a-910b-12af8cc42738', N'b442@a.com', 0, N'AA4whO/+BleHJLCHtcmlI2cjTEmzbj/bJxicoQa42hX4+AZ2P4XSdnp45QiKnpavcQ==', N'3435b575-f512-4e5b-bfe7-8073e80eeeb3', N'017256214423', 0, 0, NULL, 1, 0, N'017256214423', N'Rana Hamid', N'Uttara, Dhaka', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'78b2ad81-4348-492e-8232-f1dc4b611f6d', N'temp31281637636482653340689922@gmail.com', 0, N'ANtAfeZNutd0KgEnnHEA0pIXTx4ghBnBZTakIQyoQTI/0l70H6wHT55J6UVYS5ibGw==', N'894bb4f4-8453-477f-8f91-a89fc3b1e250', N'01sffsd72562123', 0, 0, NULL, 1, 0, N'01sffsd72562123', N'Rana Hamid', N'Uttara, Dhaka', 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'7938758d-b081-4dbf-85db-627be01c747a', N'temp40113309636500949452783203@gmail.com', 0, N'APBbuyc/KypmbJXNdoKxNpghgEfvnxTntGnc5GNDFvGR42xkExswvC6ut1Sybihn8g==', N'26205fc9-2581-43df-bea5-5045eaf60848', N'01711226979', 0, 0, NULL, 1, 0, N'01711226979', N'বাশির আহাম্মাদ', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'79463a14-ded7-4288-97d2-c621c748ac91', N'temp6219898636488072868081250@gmail.com', 0, N'AD6J54F6PMKHl6DGp+CpcmmZT3vX0iEj+9hJMTqPYdzKBuTumXp6/8uuDztyPHR7cw==', N'7ea160ea-0846-4fc2-9636-1e2a0d9c5dc6', N'0852147', 0, 0, NULL, 1, 0, N'0852147', N'rrrr', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'7ba05311-7f12-457f-9acf-667f7cfd4cf2', N'temp74861026636505671229726562@gmail.com', 0, N'AKi2H84H+0dBDm+/deMyI52PXCpMZ9UriZ7Z3hLLF/4SwYRAvPQGxYf0b88yoXZyQA==', N'ab76d294-5df2-48d7-bf09-b70e8d9f349c', N'01950062801', 0, 0, NULL, 1, 0, N'01950062801', N'Rashed bhuiyan', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'7cd3ea2f-9894-4b82-9817-f39555d61557', N'temp71840292636506350246308593@gmail.com', 0, N'AEA4IP8sxvBm5CxmGVjJri1jTs5Ur8AkKoYLYS8IB+yQoDqfU6jC8ETOBPolGuezKg==', N'965ab236-39ad-463a-923b-8dea2961a182', N'01905523199', 0, 0, NULL, 1, 0, N'01905523199', N'rifat', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'80c5892b-59a6-4293-a6e2-a691a9d2d3f9', N'temp50684380636490724107607500@gmail.com', 0, N'AIvgMaB9zywv12TzbhGIv/O78v35Vh3nCuTGHxWF9x5m+ah/nlBEGZZBFmfj0NGQyA==', N'0321b5a4-3eea-4315-866f-5af25f36846a', N'01829540113', 0, 0, NULL, 1, 0, N'01829540113', N'Dkm Ashraful Islam Ishaq', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'84c14199-3aac-46b2-bcaa-ca2e6e1bab47', N'temp86992147636482851903814922@gmail.com', 0, N'AFiR8GlQBzwHQ43V5FWbj7ztJAfmUhIOv5/jpTlYSa33hdRP/QipWmX9cJGw4JTveg==', N'26709003-b33e-43db-b1b6-c56074278313', N'101782113', 0, 0, NULL, 1, 0, N'101782113', N'Rana', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'8692c32d-d245-4d3a-bd98-f3130a5958b8', N'temp35507274636488081167768750@gmail.com', 0, N'ABuWUb2j/3Wk2gVQ62BYifd1af36HIF1DeHTj2oH+8ddLK7K1pcwZ9MpFcR53rym0Q==', N'58ca774a-304a-4fd6-b25c-bc55dc635393', N'55555', 0, 0, NULL, 1, 0, N'55555', N'ffff', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'8e9aa5ac-aa4d-4cb2-95b8-77d423f8d121', N'temp7770409636489839479018750@gmail.com', 0, N'ALyPSR94naK9l0FZxWB7Ntlhft9tgaCIkAJcMZ8X8sLlxwzHlurvMLhjyLUnVyXjbg==', N'51d92e21-d16f-45e9-9a76-46e689b019eb', N'01931575482', 0, 0, NULL, 1, 0, N'01931575482', N'Md Alamin islam', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'910225fe-952d-4708-bd9a-7423308ceb4f', N'temp37244585636482846850377422@gmail.com', 0, N'AMDG5HjO8ickJTXEAHIZve3HQcBjOfs65mXeW7xtsuvi0Pc/TrhLo54f03n38Bzjqg==', N'0b0d7afb-5dea-4486-9772-7637c1632fce', N'0172562113', 0, 0, NULL, 1, 0, N'0172562113', N'Rana', N'Uttara, Dhaka', 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'923364df-c4fb-4683-85ab-51a6abea2c34', N'temp877051636488075117300000@gmail.com', 0, N'ALq0yGkMM0gcbNcd+WRcTd671TkANKnQP1ekdFDrp5ZAFzghgpm52kG+TwiqH63SGQ==', N'960c03d6-bf35-4f2b-ac20-039bd8fbb106', N'01922386771', 0, 0, NULL, 1, 0, N'01922386771', N'we', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'960a692b-7f74-4468-a592-c9fa637a9f2c', N'b4412@a.com', 0, N'ADo+Yook6AW5ju7YRDFEMqCRhTAQ/tqImHOQJW8EMFJqUdRt3nwl36eoMhLoDnZFPg==', N'a171b5c0-e11b-4b5d-9119-030fa07a5475', N'0172562114423', 0, 0, NULL, 1, 0, N'0172562114423', N'Rana Hamid', N'Uttara, Dhaka', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'96ad3c4d-c0cd-455d-9aa7-10c93944b7bf', N'ranahamidcse001@gmail.com', 0, N'AIN7PDPcqqFrE4i7ne4MdSxPeT1QrQLGZPQePiQN0XGjC3rCxSoYRls/vfXIz1QRjw==', N'd5b752de-bea8-4bf2-b817-0792fa5649f7', N'01725620123', 1, 0, NULL, 1, 0, N'01725620123', N'Rana hamid', N'Uttara, Dhaka', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'979af7c2-e634-4ca6-b2d4-ed8d4c5dbf29', N'temp19601794636535776539574042@gmail.com', 0, N'AK9I+rznHmTG78UE4QXfMDcth+pGN5OLPUsYjnrwJgOR/JUnqUorOlR6YinKvOC3xw==', N'd7b30c82-7bae-4634-add4-526f1b7ceae0', N'01670760838', 0, 0, NULL, 1, 0, N'01670760838', N'মোঃ আবু সাঈদ', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'9d652bf1-6804-4a6d-9c47-18b84d113294', N'temp47573358636502113055732422@gmail.com', 0, N'AAjUggr/j10iDOZ0z02f3uEbz60O1/ip5caaydNtl80iqflGZI+WB8FQWQEkmOH1QQ==', N'c738238f-802f-485f-9f0f-5d993a6c410b', N'01636546929', 0, 0, NULL, 1, 0, N'01636546929', N'Nil Akash', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'9e431c3a-6c88-45c6-836e-b60366468c83', N'b@a.com', 0, N'AICVrGj+q65S8Hfuwv+/KCjNzdgceJ9EOSyW7XnHVSQaV+E/eq33tNUbAh2oZoGdAg==', N'b319d681-f6b5-4475-bcd7-27691a87c7eb', N'32434235', 0, 0, NULL, 1, 0, N'32434235', N'as', N'dfgdf', 0, N'gdf', N'gfdg', N'dfg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'9ea8b551-4776-4c30-b46e-affeedab2368', N'temp55055768636488074601831250@gmail.com', 0, N'AIkHsOgiGorIlCfv50TsskGfA38pv5Wyx06H0Vm6llQGURxQarCUsbX3sDaoUkVh+w==', N'c9a5eefc-2523-4a76-9210-ff1675c5353c', N'1234567890', 0, 0, NULL, 1, 0, N'1234567890', N'yyou', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'a3c440d0-fef2-49f4-a02c-46040d413630', N'temp46557480636552810910290005@gmail.com', 0, N'APMnEWUKZI7Za9/TBpki6qkMtLJTy7cKJVd+TXwRDddnp/ZvmS3vsZlSJuTrRLVgyg==', N'1060c6a3-ff96-449f-aefa-3aeb7c86340d', N'555', 0, 0, NULL, 1, 0, N'555', N'rrr', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'a5caf7c5-4ede-4e18-8bef-d7fc80aa8be6', N'temp75572842636494283974013750@gmail.com', 0, N'AGuTxT4o3N2pubQn/hwCZjRRJcUY4I7o/a38HgGDNPHtYKSw5Z6OID/Kw9gmiqweDw==', N'080ec1d8-7e17-48c8-b6f2-44e52f6fa8c4', N'01704536307', 0, 0, NULL, 1, 0, N'01704536307', N' MD.Sajib Ahmed', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'a6ceaa64-04df-41d2-be3f-b3b19997171d', N'temp30480009636506232281005859@gmail.com', 0, N'APpFWAUZBDfK63dB7e8mOpv2IyN2VgyQ3CeFlR8bYSLEtj+yfGGZ0Khlby711rNVjQ==', N'8832b31b-3eb7-4a7d-9bf7-aadf964fbabf', N'01705607854', 0, 0, NULL, 1, 0, N'01705607854', N'md ashik', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'b8a4fe74-c391-4a15-a3ad-a30db3791d3a', N'temp33365879636490020165112500@gmail.com', 0, N'ABcJuaJI0IFJIaDtwGeZxx7/UtmflXh9aTfxTTS5hkQY1RgknDOddDbXfoyG6f1kQg==', N'61d0bd37-8af0-44fd-8ef7-d1dcabf78de9', N'01785011008', 0, 0, NULL, 1, 0, N'01785011008', N'oli', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'bb96fa0b-0d76-4f1b-b6ae-b310f656134a', N'temp16623271636544492066372285@gmail.com', 0, N'ADf3ibK2dOcHsNFDyK+uGrTBtpy7KvFeMkidFP8/5696eIqMEBlvmcx7jps4OjDHng==', N'7ef6ff65-a719-4d89-acd7-059fdb717f04', N'11111', 0, 0, NULL, 1, 0, N'11111', N'rasel', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'bf35e4d7-3bc9-4655-812a-d117974fb3e1', N'temp72455409636519916912921101@gmail.com', 0, N'AFLDOE9TYG7dp9RRDDfeGgSy3QrVJ3BZ5/VYa4rYXO9+KdZuOu6yuvhwx+X5PMthpQ==', N'6a541257-c117-4ab6-8dd4-b8bca68ce711', N'01706394803', 0, 0, NULL, 1, 0, N'01706394803', N'Nurjahan', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'c2d39a40-17c3-4469-b129-8b8bad55268d', N'temp69467520636520485487214913@gmail.com', 0, N'AEYGEUPjjPiYbS5epY4K7XMMuMXPzKz8b41zVnQoqXwEK10O91ou8WRDMeDTICD27A==', N'd41bf12d-b331-4099-a2ec-0ca386bd1eaa', N'01864377239', 0, 0, NULL, 1, 0, N'01864377239', N'Tanvir Ahmed', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'c76c5ba2-d1b0-49e7-afb0-8ae21b287b0c', N'ranahamid007@gmail.com', 0, N'AFK49j3/ssoLmie6eOUvWUzqj0oQ3EVeeKR4kEORxKMzjngvYNi8s5+ityTfICF4lw==', N'ec7fb47c-9b87-493e-b589-806d0a2e6aa4', N'123456123456', 1, 0, NULL, 0, 0, N'01717623876', NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'ca5d1d54-6cdf-472c-8ca1-7b03812f5b5b', N'temp7281482636551222660006882@gmail.com', 0, N'AMToqG0Yt5CMn9nLSsQKH7IctsHvx3xX41BkgXFFN7bkOkCiUepYOaofZ6Sqghelpg==', N'2dcd35ac-44ec-47ab-ba99-90192ef41af2', N'01851115865', 0, 0, NULL, 1, 0, N'01851115865', N'rasel', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'cb2ae2c0-cb38-4c24-a51d-3ac1fef731c9', N'temp12074699636553890520282366@gmail.com', 0, N'ABxpkpHjKmBOTI9ZPx8tb3QF/OyAmBdeSli0GDxPeaPdkKT5fopMnAYhXQQP3uKRWA==', N'8dd6be78-4466-4413-968a-2c139a9a5924', N'01961022699', 0, 0, NULL, 1, 0, N'01961022699', N'Dkm Ashraful Islam Ishaq', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'cc66c7cb-a146-4880-8a3b-dcaeda373fe3', N'bee442@a.com', 0, N'ALRUStCKxJYwtrjgRjKABEXYGTfMz79BsLRwyABz5UfNJH2+dmWyjDN/52K3jxCdDg==', N'f03e2f10-abae-4f78-9e92-2e36e7184ccb', N'01ee7256214423', 0, 0, NULL, 1, 0, N'01ee7256214423', N'Rana Hamid', N'Uttara, Dhaka', 0, N'Mr. Kr', N'Appolo', N'lorem ipsum')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'cd345f47-4788-4186-bcf3-a587426d8f6c', N'a@a.com', 0, N'ABtaY5kbUeC7semoxHgZrYUbWnUqgHxKkQFnQllAZD6TIQV+WkHtDeyJsTEkJu0Z4w==', N'7b72dc47-62ea-48d8-a396-9bd85f369f65', N'111', 0, 0, NULL, 1, 1, N'111', N'Rana Hamid', N'23423', 0, N'4234', N'23423', N'4234')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'ce0ff08d-ecf1-4ee5-834f-6c1170b2c4c9', N'temp61682117636482851643502422@gmail.com', 0, N'ALXGl7q++tK5OEthhLCezeZRq+EDZ985QPX9sqB5plljJjXRCLC+aS/DhqhSVRx5jQ==', N'd3fbc3ec-f193-49c9-a390-bbea9128f4a1', N'101782562113', 0, 0, NULL, 1, 0, N'101782562113', N'Rana', N'Uttara, Dhaka', 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'cf192814-e705-41c3-beea-5bfe0f250840', N'temp2680594636488073295268750@gmail.com', 0, N'AAzEnkcT5DWCQa6lxfHLmAfcIFfI5GiPFyfQo38WJXFWJkJNiivbFXj6zzHXdTIzSw==', N'6646faf5-8f09-43c6-8c49-21fc3693bc72', N'101782562', 0, 0, NULL, 1, 0, N'101782562', N'Rana', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'd0741342-0fcc-4c9b-8679-67ed87212bb5', N'majed.cseru@gmail.com', 0, N'AFqedoXSDg15ijj88EI5C+90diwngTYweGcpXLBwI+P3avByUxMSFW98opzcEU6f0w==', N'c6503bba-a793-40fc-ae46-44648e5b014e', N'111', 1, 0, NULL, 1, 0, N'01626323219', N'Majedur Rahaman', N'Uttara, Dhaka', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'd777c02b-55f0-44ce-b65b-17cc4c3c4e63', N'temp64646676636551224529020144@gmail.com', 0, N'AFX08DNT7avxMNGdjBWp23q7mP1HqpzctMhcFi6Xm6OraW91UOlbNVZsc2bJ4nLg0w==', N'd618243d-e206-4c15-8ee6-318d807d1524', N'01790226633', 0, 0, NULL, 1, 0, N'01790226633', N'riaz', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'd9b41544-9a33-44da-9605-51c050748c5d', N'temp23003680636616347831212357@gmail.com', 0, N'AA/QpFq+pDcubSYRFXr7hR8wg5H8pCRtgkLCPZrRdiEb8tZK/mPocNDToBD8PYlKWg==', N'1ba6b816-59cd-4b3e-a423-6c7e9bd2161b', N'01914505341', 0, 0, NULL, 1, 0, N'01914505341', N'sbs', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'dccfaa1d-138d-4413-af5b-828a1c15bca2', N'mdriponsarkar.786@gmail.com', 0, N'APPPm68RA/UkfCeZPHytp+bUZtO9EeoKz1AXzYnDwVcvkJZADAYxMMr0K0OMllv2dA==', N'3ad1ec1e-b259-4da2-927b-88bdaff312b6', N'01814737447', 0, 0, NULL, 1, 0, N'01814737447', N'Mohammad Ripon', N'Bolighar,Muradnogor,Comilla', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'ddc6f541-6177-4f09-a122-20fbc20bfc85', N'temp30995826636488072433862500@gmail.com', 0, N'AAhqM/k3o1fbe0jdg9i39auhFjq/Ht30lwqvpbezkMNNR5PIM4k3X/HLFKWMN1PikQ==', N'3c0a649d-6805-41b0-95b2-67b47b703e4d', N'2580', 0, 0, NULL, 1, 0, N'2580', N'gsgsg', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'ddf26318-3d37-4823-89d9-d20ac92bb87d', N'sb2@a.com', 0, N'ABwYW1WE0KyVpshmgy1CEbELMG1WA+jgIO4ByOtoojvwNKUyDjPlQo4csuHe0M3Ktw==', N'5997631c-87ea-4714-8db2-bba1535220e8', N'01s72562123', 0, 0, NULL, 1, 0, N'01s72562123', N'Rana Hamid', N'Uttara, Dhaka', 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'e0dd824a-0935-42d4-8cf5-20e01096d5a1', N'temp37159123636543440698453822@gmail.com', 0, N'APVQvjKl8iUcVavvR0gNBzSXOIjlh96R3wasAB144ultQsFVngHC1AyoB2EbwRy3fg==', N'e7166955-5bee-4d67-bb02-c7b12b05e915', N'01814997590', 0, 0, NULL, 1, 0, N'01814997590', N'মোঃ মামুন আহম্মেদ বিজয়', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'e3898a4d-7294-4268-bcc3-16cad0430e36', N'temp2240202636498600914933906@gmail.com', 0, N'AAd6Xif9i/baZZxGSy1s8JPyfX4cmeJkApcAP7HD+35a61O5Yi/iTd0HV8SOyuelHw==', N'b241bc1d-c2ed-492b-a55b-4f47cb8e909d', N'01701304466', 0, 0, NULL, 1, 0, N'01701304466', N'JOY KHAN', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'e7bbb86a-10ef-4481-85a7-c057b9fd5bf7', N'temp23450645636503057129257812@gmail.com', 0, N'AEUXxaJlz1eaOEUTNIFPNZc1QSjK5VcKqEnhPg2AdJ57zuKXAVQ7ZsK3jYWnWRG3KA==', N'6ea07cca-cca4-4b87-8283-21ada6674217', N'01766093207', 0, 0, NULL, 1, 0, N'01766093207', N'Mohin', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'ecfc6f40-76b9-4d95-8667-add9319fd8c1', N'temp93100861636551215979169914@gmail.com', 0, N'AMiG23MPTfdZveJf9wsHMuhdWN8D6H6yWEm8NKC3iqNn+2shbgkDpZFx8Cp2wviRaA==', N'f4c9edf2-3c85-48b3-b6be-974cb7dc124e', N'0172565556555555556', 0, 0, NULL, 1, 0, N'0172565556555555556', N'Rana test', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'f0702137-6bf9-4e09-ad29-8fe6c2df2ea6', N'temp15006064636582516159735466@gmail.com', 0, N'AOCLcLRnJOsDmm7UkhKFTsLjEXZtetRqGJSnkV+DB+iuesIyUm6SIzONo8Z1UZFNsQ==', N'76ec40d6-97f6-4c98-88e3-8d7509055ab0', N'01914493649', 0, 0, NULL, 1, 0, N'01914493649', N'mamun', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'f0fb480f-5b84-4dfe-bf18-deb33263bffe', N'temp94670702636660451261129712@gmail.com', 0, N'ALNMajzC21Jzw8vNY4Dms+eb85D37TZSq5KlS/vgowF6eCyAPZD1gZrCOojMvWSJvw==', N'0fd52e1b-157f-4346-8dff-c6b26014c370', N'0554557073', 0, 0, NULL, 1, 0, N'0554557073', N'bahar', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'f3b51ed0-6414-4bed-ade4-c185eb7d7f4e', N'temp51422773636489995590737500@gmail.com', 0, N'AGu5r3yZxAtHFDMBiBQGmBYEHkgEk8nhtKlMt+gs8zXhMC4Ag8yaF2PdTgMgKfnlRA==', N'89a434d7-729a-47de-b5e2-4eef9cefc99e', N'01827535687', 0, 0, NULL, 1, 0, N'01827535687', N'JONAYEDTELECOM', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'f45df11d-a6aa-4581-9e00-999ec420e7d1', N'temp39425807636482942948033672@gmail.com', 0, N'AKtuE9r3AvRdKRbRck1oVujDfl6AdAQ3rIk7Y36PveK1zY8zJo5CU56YEZhB5KWP5Q==', N'd0ecb670-9a3d-470e-86f1-0d7c4d1fc3c3', N'0852369', 0, 0, NULL, 1, 0, N'0852369', N'rasel', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'fd2dae2a-c3b6-4394-b9bb-f9e663e07ac2', N'temp11527550636483047410221172@gmail.com', 0, N'AO96NclhXEgAHdS6dxWnmz9PE8pFGEHODrT8jxnrvAKzxMl15mDrJdp4wsnueRrRag==', N'c41c8eb0-cee4-4f4c-87a0-ee6f13a6e148', N'01922386770', 0, 0, NULL, 1, 0, N'01922386770', N'dummy', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address], [IsFakeEmail], [DoctorName], [HospitalName], [Description]) VALUES (N'ff31c354-4c60-4d98-8f8f-08c06df645d8', N'temp90014884636482859367721172@gmail.com', 0, N'AIBHUTzPngfY8vCfR1b4UiWTdce52YBnw7JV8ALkY4N8PvI96BCLmaS2IylGXn1ygQ==', N'57d9dc0e-c5c2-4c35-beca-2bcd1f699144', N'018245462424', 0, 0, NULL, 1, 0, N'018245462424', N'checkMe', NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DoctorAppointmentTbl] ON 

INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (32, N'Rana test', N'from app', N'0172565556555555556', 2, N'টেস্ট ডাক্তার', 0, 500, 1519664400000, 1519664700000, N'Monday, February 26, 2018 5:00 PM', 1, CAST(N'2018-02-25T04:11:41.5116049' AS DateTime2), CAST(N'2018-02-25T04:11:41.5116049' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (33, N'Rana test', N'from app', N'0172565556555555556', 2, N'টেস্ট ডাক্তার', 0, 500, 1519664700000, 1519665000000, N'Monday, February 26, 2018 5:05 PM', 2, CAST(N'2018-02-25T04:11:49.2620036' AS DateTime2), CAST(N'2018-02-25T04:11:49.2620036' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (34, N'345', N'35', N'34', 1, N'test doctor', 5673, -5640, 1531042800000, 1531043400000, N'Monday, January 1, 0001 12:00 AM', 0, CAST(N'2018-07-08T23:13:50.8529145' AS DateTime2), CAST(N'2018-07-08T23:13:50.8529145' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (35, N'1', N'1', N'1', 1, N'test doctor', 1, 32, 1531043400000, 1531044000000, N'Monday, January 1, 0001 12:00 AM', 0, CAST(N'2018-07-08T23:14:30.5491943' AS DateTime2), CAST(N'2018-07-08T23:14:30.5491943' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (36, N'mr. rana ahmid', N'owe 1', N'sd3245', 1, N'test doctor', 34, -1, 1531301400000, 1531302000000, N'Monday, January 1, 0001 12:00 AM', 0, CAST(N'2018-07-09T00:18:35.0787561' AS DateTime2), CAST(N'2018-07-09T00:18:35.0787561' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (37, N'jack', N'uttara, dhaka', N'555-555', 1, N'test doctor', 9, 24, 1531303800000, 1531304400000, N'Monday, January 1, 0001 12:00 AM', 0, CAST(N'2018-07-09T01:50:44.5041394' AS DateTime2), CAST(N'2018-07-09T01:50:44.5041394' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (38, N's', N's', N's', 1, N'test doctor', 3, 30, 1531306800000, 1531307400000, N'Wednesday, July 11, 2018', 0, CAST(N'2018-07-09T02:04:30.1292548' AS DateTime2), CAST(N'2018-07-09T02:04:30.1292548' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (39, N'43', N'3', N'd', 2, N'123456123456', 3, NULL, 1531130400000, 1531131000000, N'Monday, July 9, 2018, 7/9/2018 4:00:00 PM', 0, CAST(N'2018-07-09T02:07:19.7168064' AS DateTime2), CAST(N'2018-07-09T02:07:19.7168064' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (40, N'54', N'454', N'45', 1, N'test doctor', 5, 28, 1531309200000, 1531309800000, N'7/11/2018 5:40:00 AM', 0, CAST(N'2018-07-09T02:11:16.6599821' AS DateTime2), CAST(N'2018-07-09T02:11:16.6599821' AS DateTime2), NULL)
INSERT [dbo].[DoctorAppointmentTbl] ([Id], [PatientName], [Address], [PhoneNumber], [AssignDoctorId], [AssignDoctorName], [AdvanceAmount], [RemainingAmount], [StartTime], [EndTime], [AppointmentTime], [Serial], [CreatedOnUtc], [UpdatedOnUtc], [IsPastDate]) VALUES (41, N'2', N'3', N'4234', 2, N'123456123456', 322, NULL, 1531134600000, 1531135200000, N'7/9/2018 11:10:00 AM', 0, CAST(N'2018-07-09T02:12:28.9639456' AS DateTime2), CAST(N'2018-07-09T02:12:28.9639456' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[DoctorAppointmentTbl] OFF
SET IDENTITY_INSERT [dbo].[DoctorTbl] ON 

INSERT [dbo].[DoctorTbl] ([Id], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (1, N'test doctor', 23423, NULL, N'23', N'324', CAST(345 AS Decimal(18, 0)), N'10', N'H#88', NULL, N'123456123456', NULL, N'0,3,6', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, 33, N'Content/images/Doctor/77876612/banner-seo-service.jpg', CAST(N'2018-07-08T23:13:18.3876153' AS DateTime2), CAST(N'2018-07-09T02:44:23.0602723' AS DateTime2), 1)
INSERT [dbo].[DoctorTbl] ([Id], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (2, N'123456123456', 435, NULL, N'35', N'345', CAST(345 AS Decimal(18, 0)), N'1', N'H#88', NULL, N'11', NULL, N'0,1,2,3,4,5,6', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, NULL, N'Content/images/Doctor/89095678/louie-schwartzberg-water-fall.png', CAST(N'2018-07-08T23:48:56.6717337' AS DateTime2), CAST(N'2018-07-08T23:48:56.6717337' AS DateTime2), 1)
INSERT [dbo].[DoctorTbl] ([Id], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (3, N'Pobon mama', 2345, NULL, N'24', N'345', CAST(345 AS Decimal(18, 0)), N'1', N'H#88', NULL, N'11', NULL, N'0,2,4', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, 33, N'Content/images/Doctor/66597539/services-banner-dashboard.jpg', CAST(N'2018-07-08T23:49:30.6558770' AS DateTime2), CAST(N'2018-07-08T23:49:30.6558770' AS DateTime2), 1)
INSERT [dbo].[DoctorTbl] ([Id], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (13, N's', 33, NULL, N'345', N'345', CAST(345 AS Decimal(18, 0)), N'1', N'd', NULL, N'234', NULL, N'2', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, NULL, N'', CAST(N'2018-07-09T02:28:11.8971566' AS DateTime2), CAST(N'2018-07-09T02:28:11.8971566' AS DateTime2), NULL)
INSERT [dbo].[DoctorTbl] ([Id], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (18, N's', 3, NULL, N'3', N'4', CAST(3 AS Decimal(18, 0)), N'1', N'H#88', NULL, N'234', NULL, N'0,3', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, 33, N'', CAST(N'2018-07-09T02:29:20.5183219' AS DateTime2), CAST(N'2018-07-09T02:29:20.5183219' AS DateTime2), NULL)
INSERT [dbo].[DoctorTbl] ([Id], [FullName], [RegistrationNo], [RegistrationType], [ClinicHospitalName], [Designation], [YearOfExperience], [WorkingArea], [Addresss], [DateOfBirth], [PhoneNumber], [Email], [CanVisitDays], [VisitTimeStart], [VisitTimeEnd], [SlotDuration], [VisitFee], [VisitingCard], [CreatedOnUtc], [UpdatedOnUtc], [Active]) VALUES (21, N'sfd', 3, NULL, NULL, N'345', CAST(3 AS Decimal(18, 0)), N'1', N'3', CAST(N'2018-07-09T02:38:11.4822164' AS DateTime2), N'3', NULL, N'0,1,2,3,4,5,6', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), 10, 0, N'', CAST(N'2018-07-09T02:38:11.4822164' AS DateTime2), CAST(N'2018-07-09T02:38:11.4822164' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[DoctorTbl] OFF
SET IDENTITY_INSERT [dbo].[DoctorWorkingAreaTbl] ON 

INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (1, N'মেডিসিন বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (2, N'হৃদরোগ বিশেষজ্ঞ (Cardiology)', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (3, N'হাড় জয়েন্ট বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (4, N'ডায়বেটিস ও হৃদরোগ বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (5, N'মেডিসিন, বাতজ্বর ও হৃদরোগ বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (6, N'যক্ষা ও হাঁপানী বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (7, N'বক্ষব্যাধি বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (8, N'বক্ষব্যাধি ও এ্যাজমা বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (9, N'চর্ম ও যৌন', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (10, N'স্নায়ূরোগ বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (11, N'স্নায়ুরোগ ও লিভার বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (12, N'নিউরোলজী বিশেষজ্ঞ', NULL)
INSERT [dbo].[DoctorWorkingAreaTbl] ([Id], [WorkingArea], [Description]) VALUES (13, N'নাক, কান ও গলা বিশেষজ্ঞ', NULL)
SET IDENTITY_INSERT [dbo].[DoctorWorkingAreaTbl] OFF
SET IDENTITY_INSERT [dbo].[LogTbl] ON 

INSERT [dbo].[LogTbl] ([Id], [ExceptionMessage], [ExceptionStackTrace], [ControllerName], [IpAddress], [Browser], [OS], [UserId], [ActionName], [CreatedOnUtc]) VALUES (1397, N'4', N'4', N'4', N'4', N'4', NULL, N'a4783183-d74b-4686-9c1a-6d1e207f1774', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LogTbl] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/9/2018 3:12:17 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/9/2018 3:12:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/9/2018 3:12:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/9/2018 3:12:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/9/2018 3:12:17 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/9/2018 3:12:17 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [Appointment] SET  READ_WRITE 
GO
