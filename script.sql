USE [master]
GO
/****** Object:  Database [pythonDbTest]    Script Date: 20/12/2016 11:59:25 AM ******/
CREATE DATABASE [pythonDbTest]
GO
ALTER DATABASE [pythonDbTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pythonDbTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pythonDbTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pythonDbTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pythonDbTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pythonDbTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pythonDbTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [pythonDbTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pythonDbTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pythonDbTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pythonDbTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pythonDbTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pythonDbTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pythonDbTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pythonDbTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pythonDbTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pythonDbTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pythonDbTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pythonDbTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pythonDbTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pythonDbTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pythonDbTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pythonDbTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pythonDbTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pythonDbTest] SET RECOVERY FULL 
GO
ALTER DATABASE [pythonDbTest] SET  MULTI_USER 
GO
ALTER DATABASE [pythonDbTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pythonDbTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pythonDbTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pythonDbTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [pythonDbTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'pythonDbTest', N'ON'
GO
USE [pythonDbTest]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 20/12/2016 11:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 20/12/2016 11:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[JobId] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[get_job_list]    Script Date: 20/12/2016 11:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_job_list]
AS
SELECT        Id, Name
FROM            dbo.Job

GO
/****** Object:  View [dbo].[PersonAndJob]    Script Date: 20/12/2016 11:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PersonAndJob]
AS
SELECT        dbo.Person.Firstname, dbo.Person.Lastname, dbo.Person.Birthday, dbo.Job.Name
FROM            dbo.Person INNER JOIN
                         dbo.Job ON dbo.Person.JobId = dbo.Job.Id

GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Job] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Job]
GO
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
         Begin Table = "Job"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_job_list'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_job_list'
GO
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
         Begin Table = "Person"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Job"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PersonAndJob'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PersonAndJob'
GO
USE [master]
GO
ALTER DATABASE [pythonDbTest] SET  READ_WRITE 
GO
