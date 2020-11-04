﻿USE [master]
GO
/****** Object:  Database [CyberDayMaster]    Script Date: 10/25/2020 12:51:00 AM ******/
CREATE DATABASE [CyberDayMaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CyberDayMaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CyberDayMaster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CyberDayMaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CyberDayMaster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CyberDayMaster] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CyberDayMaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CyberDayMaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CyberDayMaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CyberDayMaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CyberDayMaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CyberDayMaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [CyberDayMaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CyberDayMaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CyberDayMaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CyberDayMaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CyberDayMaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CyberDayMaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CyberDayMaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CyberDayMaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CyberDayMaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CyberDayMaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CyberDayMaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CyberDayMaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CyberDayMaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CyberDayMaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CyberDayMaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CyberDayMaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CyberDayMaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CyberDayMaster] SET RECOVERY FULL 
GO
ALTER DATABASE [CyberDayMaster] SET  MULTI_USER 
GO
ALTER DATABASE [CyberDayMaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CyberDayMaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CyberDayMaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CyberDayMaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CyberDayMaster] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CyberDayMaster', N'ON'
GO
ALTER DATABASE [CyberDayMaster] SET QUERY_STORE = OFF
GO
USE [CyberDayMaster]
GO
/****** Object:  Table [dbo].[AccessCode]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessCode](
	[Code] [varchar](50) NOT NULL,
	[UserType] [varchar](50) NULL,
	[CoordinatorID] [int] NULL,
 CONSTRAINT [PK_AccessCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cluster]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cluster](
	[ClusterCode] [varchar](50) NULL,
	[InstructorCode] [varchar](50) NULL,
	[OrganizationID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactRequest]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](50) NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[OrganizationName] [varchar](50) NULL,
	[OrganizationType] [varchar](50) NULL,
	[DateRequest] [date] NULL,
	[EventNameRequest] [varchar](50) NULL,
 CONSTRAINT [PK_ContactRequest] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coordinator]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordinator](
	[CoordinatorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [bigint] NULL,
 CONSTRAINT [PK_Coordinator] PRIMARY KEY CLUSTERED 
(
	[CoordinatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoordinatorAuth]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoordinatorAuth](
	[CoordinatorID] [int] NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Name] [varchar](50) NULL,
	[Room] [int] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventActivities]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventActivities](
	[EventID] [int] NULL,
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [varchar](50) NULL,
	[Time] [time](7) NULL,
	[Room] [int] NULL,
	[ActivityGuideID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventContact]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventContact](
	[EventID] [int] NULL,
	[ContactCode] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[OrganizationID] [int] NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_EventContact] PRIMARY KEY CLUSTERED 
(
	[ContactCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventVolunteers]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventVolunteers](
	[VolunteerCode] [varchar](50) NULL,
	[EventID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorCode] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[OrganizationID] [int] NULL,
	[Email] [varchar](50) NULL,
	[Phone] [bigint] NULL,
	[ContactCode] [varchar](50) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[ContactCode] [varchar](50) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentCode] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[InstructorCode] [varchar](50) NULL,
	[Notes] [varchar](50) NULL,
	[OrganizationID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tshirt]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tshirt](
	[TshirtID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 10/25/2020 12:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[VolunteerCode] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
	[OrganizationID] [int] NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[VolunteerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessCode]  WITH CHECK ADD  CONSTRAINT [FK_AccessCode_Coordinator] FOREIGN KEY([CoordinatorID])
REFERENCES [dbo].[Coordinator] ([CoordinatorID])
GO
ALTER TABLE [dbo].[AccessCode] CHECK CONSTRAINT [FK_AccessCode_Coordinator]
GO
ALTER TABLE [dbo].[Cluster]  WITH CHECK ADD  CONSTRAINT [FK_Cluster_AccessCode] FOREIGN KEY([ClusterCode])
REFERENCES [dbo].[AccessCode] ([Code])
GO
ALTER TABLE [dbo].[Cluster] CHECK CONSTRAINT [FK_Cluster_AccessCode]
GO
ALTER TABLE [dbo].[Cluster]  WITH CHECK ADD  CONSTRAINT [FK_Cluster_Instructor] FOREIGN KEY([InstructorCode])
REFERENCES [dbo].[Instructor] ([InstructorCode])
GO
ALTER TABLE [dbo].[Cluster] CHECK CONSTRAINT [FK_Cluster_Instructor]
GO
ALTER TABLE [dbo].[CoordinatorAuth]  WITH CHECK ADD  CONSTRAINT [FK_CoordinatorAuth_Coordinator] FOREIGN KEY([CoordinatorID])
REFERENCES [dbo].[Coordinator] ([CoordinatorID])
GO
ALTER TABLE [dbo].[CoordinatorAuth] CHECK CONSTRAINT [FK_CoordinatorAuth_Coordinator]
GO
ALTER TABLE [dbo].[EventActivities]  WITH CHECK ADD  CONSTRAINT [FK_EventActivities_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventActivities] CHECK CONSTRAINT [FK_EventActivities_Event]
GO
ALTER TABLE [dbo].[EventContact]  WITH CHECK ADD  CONSTRAINT [FK_EventContact_AccessCode] FOREIGN KEY([ContactCode])
REFERENCES [dbo].[AccessCode] ([Code])
GO
ALTER TABLE [dbo].[EventContact] CHECK CONSTRAINT [FK_EventContact_AccessCode]
GO
ALTER TABLE [dbo].[EventContact]  WITH CHECK ADD  CONSTRAINT [FK_EventContact_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventContact] CHECK CONSTRAINT [FK_EventContact_Event]
GO
ALTER TABLE [dbo].[EventVolunteers]  WITH CHECK ADD  CONSTRAINT [FK_EventVolunteers_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventVolunteers] CHECK CONSTRAINT [FK_EventVolunteers_Event]
GO
ALTER TABLE [dbo].[EventVolunteers]  WITH CHECK ADD  CONSTRAINT [FK_EventVolunteers_Volunteer] FOREIGN KEY([VolunteerCode])
REFERENCES [dbo].[Volunteer] ([VolunteerCode])
GO
ALTER TABLE [dbo].[EventVolunteers] CHECK CONSTRAINT [FK_EventVolunteers_Volunteer]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_EventContact] FOREIGN KEY([ContactCode])
REFERENCES [dbo].[EventContact] ([ContactCode])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_EventContact]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Organization]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_EventContact] FOREIGN KEY([ContactCode])
REFERENCES [dbo].[EventContact] ([ContactCode])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_EventContact]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Instructor] FOREIGN KEY([InstructorCode])
REFERENCES [dbo].[Instructor] ([InstructorCode])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Instructor]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Organization]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_AccessCode] FOREIGN KEY([VolunteerCode])
REFERENCES [dbo].[AccessCode] ([Code])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_AccessCode]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Organization]
GO
USE [master]
GO
ALTER DATABASE [CyberDayMaster] SET  READ_WRITE 
GO
