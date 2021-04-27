USE [master]
GO
/****** Object:  Database [XJGL]    Script Date: 2021/1/3 22:43:14 ******/
CREATE DATABASE [XJGL] ON  PRIMARY 
( NAME = N'XJGL', FILENAME = N'C:\Users\DELL\Desktop\测试\11\XJGL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XJGL_log', FILENAME = N'C:\Users\DELL\Desktop\测试\11\XJGL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XJGL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XJGL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XJGL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XJGL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XJGL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XJGL] SET ARITHABORT OFF 
GO
ALTER DATABASE [XJGL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XJGL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XJGL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XJGL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XJGL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XJGL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XJGL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XJGL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XJGL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XJGL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XJGL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XJGL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XJGL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XJGL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XJGL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XJGL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XJGL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XJGL] SET RECOVERY FULL 
GO
ALTER DATABASE [XJGL] SET  MULTI_USER 
GO
ALTER DATABASE [XJGL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XJGL] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'XJGL', N'ON'
GO
USE [XJGL]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2021/1/3 22:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdID] [char](6) NOT NULL,
	[AdPW] [char](12) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2021/1/3 22:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class] [char](2) NOT NULL,
	[SQ] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 2021/1/3 22:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[SID] [char](6) NOT NULL,
	[Course] [nchar](20) NOT NULL,
	[Grade] [char](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RP]    Script Date: 2021/1/3 22:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RP](
	[RPID] [int] NOT NULL,
	[SID] [char](6) NOT NULL,
	[RPDay] [date] NOT NULL,
	[Type] [nchar](4) NOT NULL,
	[Reason] [nchar](30) NOT NULL,
	[Degree] [nchar](30) NOT NULL,
 CONSTRAINT [PK_RP] PRIMARY KEY CLUSTERED 
(
	[RPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2021/1/3 22:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[SID] [char](6) NOT NULL,
	[SName] [nchar](12) NOT NULL,
	[Birth] [date] NOT NULL,
	[EnDay] [date] NOT NULL,
	[Gender] [nchar](4) NOT NULL,
	[Tele] [char](11) NOT NULL,
	[Class] [char](2) NOT NULL,
	[Academy] [nchar](20) NOT NULL,
	[Major] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SearchView]    Script Date: 2021/1/3 22:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SearchView]
AS
SELECT  SID, SName, Academy, Major, Class
FROM      dbo.Student
GO
INSERT [dbo].[Admin] ([AdID], [AdPW]) VALUES (N'000000', N'123456789   ')
INSERT [dbo].[Admin] ([AdID], [AdPW]) VALUES (N'111111', N'987654321   ')
GO
INSERT [dbo].[Class] ([Class], [SQ]) VALUES (N'01', 1)
INSERT [dbo].[Class] ([Class], [SQ]) VALUES (N'02', 1)
INSERT [dbo].[Class] ([Class], [SQ]) VALUES (N'03', 1)
INSERT [dbo].[Class] ([Class], [SQ]) VALUES (N'04', 0)
INSERT [dbo].[Class] ([Class], [SQ]) VALUES (N'05', 0)
GO
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000001', N'语文                  ', N'70 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000001', N'高数                  ', N'90 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000001', N'数据库                 ', N'95 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000002', N'语文                  ', N'80 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000002', N'高数                  ', N'80 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000002', N'数据库                 ', N'90 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000003', N'语文                  ', N'95 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000003', N'高数                  ', N'80 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000003', N'英语                  ', N'85 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000003', N'食品分析                ', N'80 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000001', N'英语                  ', N'70 ')
INSERT [dbo].[Grade] ([SID], [Course], [Grade]) VALUES (N'000002', N'英语                  ', N'95 ')
GO
INSERT [dbo].[RP] ([RPID], [SID], [RPDay], [Type], [Reason], [Degree]) VALUES (1, N'000001', CAST(N'2019-10-01' AS Date), N'奖励  ', N'拾金不昧                          ', N'奖状                            ')
INSERT [dbo].[RP] ([RPID], [SID], [RPDay], [Type], [Reason], [Degree]) VALUES (2, N'000003', CAST(N'2020-01-01' AS Date), N'奖励  ', N'主动打扫卫生                        ', N'口头表扬                          ')
INSERT [dbo].[RP] ([RPID], [SID], [RPDay], [Type], [Reason], [Degree]) VALUES (3, N'000002', CAST(N'2018-12-31' AS Date), N'惩罚  ', N'晚归                            ', N'口头批评                          ')
GO
INSERT [dbo].[Student] ([SID], [SName], [Birth], [EnDay], [Gender], [Tele], [Class], [Academy], [Major]) VALUES (N'000001', N'王小明         ', CAST(N'2000-01-15' AS Date), CAST(N'2018-09-01' AS Date), N'男   ', N'15194156677', N'02', N'西塔学院                ', N'电信                  ')
INSERT [dbo].[Student] ([SID], [SName], [Birth], [EnDay], [Gender], [Tele], [Class], [Academy], [Major]) VALUES (N'000002', N'张小刚         ', CAST(N'1999-10-05' AS Date), CAST(N'2018-09-03' AS Date), N'男   ', N'13655313611', N'03', N'西塔学院                ', N'电信                  ')
INSERT [dbo].[Student] ([SID], [SName], [Birth], [EnDay], [Gender], [Tele], [Class], [Academy], [Major]) VALUES (N'000003', N'李小红         ', CAST(N'2001-01-01' AS Date), CAST(N'2018-09-02' AS Date), N'女   ', N'19862156162', N'01', N'西塔学院                ', N'食品                  ')
GO
ALTER TABLE [dbo].[Class] ADD  CONSTRAINT [DF_Class_SQ]  DEFAULT ((0)) FOR [SQ]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student] FOREIGN KEY([SID])
REFERENCES [dbo].[Student] ([SID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([Class])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[RP]  WITH CHECK ADD  CONSTRAINT [TypeRule] CHECK  (([Type]='惩罚' OR [Type]='奖励'))
GO
ALTER TABLE [dbo].[RP] CHECK CONSTRAINT [TypeRule]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [GenderRule] CHECK  (([Gender]='女' OR [Gender]='男'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [GenderRule]
GO
create trigger ClassUpdate
 on Student after update
 as 
 begin
 update Class set SQ=SQ-1
 where Class=(select Class from deleted)
 update Class set SQ=SQ+1
 where Class=(select Class from inserted)
 end
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Student"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 315
               Right = 479
            End
            DisplayFlags = 344
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchView'
GO
USE [master]
GO
ALTER DATABASE [XJGL] SET  READ_WRITE 
GO
