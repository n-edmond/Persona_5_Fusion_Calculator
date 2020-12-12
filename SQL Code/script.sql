USE [master]
GO
/****** Object:  Database [Persona_Data]    Script Date: 12/11/2020 3:38:01 PM ******/
CREATE DATABASE [Persona_Data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Persona_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Persona_Data.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Persona_Data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Persona_Data_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Persona_Data] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Persona_Data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Persona_Data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Persona_Data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Persona_Data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Persona_Data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Persona_Data] SET ARITHABORT OFF 
GO
ALTER DATABASE [Persona_Data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Persona_Data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Persona_Data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Persona_Data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Persona_Data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Persona_Data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Persona_Data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Persona_Data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Persona_Data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Persona_Data] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Persona_Data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Persona_Data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Persona_Data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Persona_Data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Persona_Data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Persona_Data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Persona_Data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Persona_Data] SET RECOVERY FULL 
GO
ALTER DATABASE [Persona_Data] SET  MULTI_USER 
GO
ALTER DATABASE [Persona_Data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Persona_Data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Persona_Data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Persona_Data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Persona_Data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Persona_Data] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Persona_Data', N'ON'
GO
ALTER DATABASE [Persona_Data] SET QUERY_STORE = OFF
GO
USE [Persona_Data]
GO
/****** Object:  User [iljonas]    Script Date: 12/11/2020 3:38:01 PM ******/
CREATE USER [iljonas] FOR LOGIN [iljonas] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [iljonas]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [iljonas]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[persona_id] [int] IDENTITY(1,1) NOT NULL,
	[arcana_id] [int] NOT NULL,
	[persona_name] [varchar](50) NOT NULL,
	[persona_level] [int] NOT NULL,
	[persona_lore] [varchar](300) NOT NULL,
	[special_fuse_check] [bit] NOT NULL,
	[photo] [image] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[persona_lore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[persona_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stats]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[stat_id] [int] IDENTITY(1,1) NOT NULL,
	[stat_luck] [int] NOT NULL,
	[stat_agility] [int] NOT NULL,
	[stat_endurance] [int] NOT NULL,
	[stat_strength] [int] NOT NULL,
	[stat_magic] [int] NOT NULL,
 CONSTRAINT [PK_Stats] PRIMARY KEY CLUSTERED 
(
	[stat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arcana]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arcana](
	[arcana_id] [int] IDENTITY(1,1) NOT NULL,
	[arcana_type] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Arcana] PRIMARY KEY CLUSTERED 
(
	[arcana_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[arcana_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Affinity]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affinity](
	[affinity_id] [int] IDENTITY(1,1) NOT NULL,
	[affinity_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Affinity] PRIMARY KEY CLUSTERED 
(
	[affinity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[affinity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resistance]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resistance](
	[resistance_id] [int] IDENTITY(1,1) NOT NULL,
	[resistance_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Resistance] PRIMARY KEY CLUSTERED 
(
	[resistance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[resistance_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona Affinity Connect]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona Affinity Connect](
	[p_connector_persona_id] [int] NOT NULL,
	[p_connector_affinity_id] [int] NOT NULL,
	[p_connector_resistance_id] [int] NOT NULL,
 CONSTRAINT [PK_Persona Affinity Connect] PRIMARY KEY CLUSTERED 
(
	[p_connector_persona_id] ASC,
	[p_connector_affinity_id] ASC,
	[p_connector_resistance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Create_MainTable]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[Create_MainTable]
(	
	@persona varchar(50) = NULL
)
RETURNS TABLE 
AS
RETURN 
(
		SELECT P.persona_level 
		, P.persona_name
		, Arc.arcana_type
		, S.stat_luck
		, S.stat_agility
		, S.stat_endurance
		, S.stat_strength
		, S.stat_magic
		, MAX(CASE WHEN Aff.affinity_type = 'Gun' THEN resistance_type END) AS Gun
		, MAX(CASE WHEN Aff.affinity_type = 'Phys' THEN resistance_type END) AS Phys
		, MAX(CASE WHEN Aff.affinity_type = 'Fire' THEN resistance_type END) AS Fire
		, MAX(CASE WHEN Aff.affinity_type = 'Ice' THEN resistance_type END) AS Ice
		, MAX(CASE WHEN Aff.affinity_type = 'Elec' THEN resistance_type END) AS Elec
		, MAX(CASE WHEN Aff.affinity_type = 'Wind' THEN resistance_type END) AS Wind
		, MAX(CASE WHEN Aff.affinity_type = 'Nuclear' THEN resistance_type END) AS Nuke
		, MAX(CASE WHEN Aff.affinity_type = 'Psychic' THEN resistance_type END) AS Psy
		, MAX(CASE WHEN Aff.affinity_type = 'Curse' THEN resistance_type END) AS Curse
		, MAX(CASE WHEN Aff.affinity_type = 'Bless' THEN resistance_type END) AS Bless
	FROM dbo.Persona AS P
		LEFT JOIN Arcana AS Arc
			ON P.arcana_id = Arc.arcana_id
		LEFT JOIN dbo.Stats AS S
			ON P.persona_id = S.stat_id
		LEFT JOIN dbo.[Persona Affinity Connect] AS PAC
			ON P.persona_id = PAC.p_connector_persona_id
		LEFT JOIN dbo.Affinity AS Aff
			ON PAC.p_connector_affinity_id = Aff.affinity_id
		LEFT JOIN (
			SELECT resistance_id
				, CASE WHEN resistance_type = 'None' THEN '-' ELSE resistance_type END AS resistance_type
			FROM dbo.Resistance
		) R
			ON PAC.p_connector_resistance_id = R.resistance_id
	WHERE LOWER(P.persona_name) LIKE LOWER(@persona) + '%'
		OR @persona IS NULL
	GROUP BY P.persona_level 
		, P.persona_name
		, Arc.arcana_type
		, S.stat_luck
		, S.stat_agility
		, S.stat_endurance
		, S.stat_strength
		, S.stat_magic
)
GO
/****** Object:  Table [dbo].[Fusion_Map]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fusion_Map](
	[Arcana_1_id] [int] NOT NULL,
	[Arcana_2_id] [int] NOT NULL,
	[Result_id] [int] NOT NULL,
 CONSTRAINT [PK_Fusion_Map] PRIMARY KEY CLUSTERED 
(
	[Arcana_1_id] ASC,
	[Arcana_2_id] ASC,
	[Result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Fuse]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[Fuse]
(	
	-- Add the parameters for the function here
	@persona varchar(50)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT A_Primary.arcana_type AS Primary_Type
		, P_Primary.persona_name AS Primary_Name
		, P_Primary.persona_level AS Primary_Level
		, A_Secondary.arcana_type AS Secondary_Type
		, P_Secondary.persona_name AS Secondary_Name
		, P_Secondary.persona_level AS Secondary_Level
		, A_Outcome.arcana_type AS Outcome_Type
		, P_Outcome.persona_name AS Outcome_Name
		, P_Outcome.persona_level AS Outcome_Level
	FROM dbo.Persona AS P_Outcome
		CROSS JOIN dbo.Persona AS P_Primary
		CROSS JOIN dbo.Persona AS P_Secondary
		INNER JOIN dbo.Fusion_Map AS Map
			ON P_Primary.arcana_id = Map.Arcana_1_id
			AND P_Secondary.arcana_id = Map.Arcana_2_id
			AND P_Outcome.arcana_id = Map.Result_id
		INNER JOIN dbo.arcana AS A_Primary
			ON P_Primary.arcana_id = A_Primary.arcana_id
		INNER JOIN dbo.arcana AS A_Secondary
			ON P_Secondary.arcana_id = A_Secondary.arcana_id
		INNER JOIN dbo.arcana AS A_Outcome
			ON P_Outcome.arcana_id = A_Outcome.arcana_id
		INNER JOIN dbo.Persona AS Qualifying_Personas
			ON P_Outcome.arcana_id = Qualifying_Personas.arcana_id
	WHERE P_Outcome.persona_name = @persona
		AND P_Outcome.special_fuse_check = 0 
		AND P_Primary.persona_id <> P_Secondary.persona_id
		AND P_Outcome.persona_id <> P_Primary.persona_id
		AND P_Outcome.persona_id <> P_Secondary.persona_id
		AND Qualifying_Personas.persona_id <> P_Primary.persona_id
		AND Qualifying_Personas.persona_id <> P_Secondary.persona_id
		AND (
			(P_Outcome.persona_level > CEILING(CAST(P_Primary.persona_level + P_Secondary.persona_level AS FLOAT) / 2)
				AND P_Primary.arcana_id <> P_Secondary.arcana_id
				AND Qualifying_Personas.persona_level > CEILING(CAST(P_Primary.persona_level + P_Secondary.persona_level AS FLOAT) / 2))
			OR (P_Outcome.persona_level <= CEILING(CAST(P_Primary.persona_level + P_Secondary.persona_level AS FLOAT) / 2)
				AND P_Primary.arcana_id = P_Secondary.arcana_id
				AND Qualifying_Personas.persona_level <= CEILING(CAST(P_Primary.persona_level + P_Secondary.persona_level AS FLOAT) / 2))
	)
	GROUP BY A_Primary.arcana_type
		, P_Primary.arcana_id
		, P_Primary.persona_name
		, P_Primary.persona_level
		, A_Secondary.arcana_type
		, P_Secondary.arcana_id
		, P_Secondary.persona_name
		, P_Secondary.persona_level
		, A_Outcome.arcana_type
		, P_Outcome.persona_name
		, P_Outcome.persona_level
	HAVING CASE 
		WHEN P_Primary.arcana_id = P_Secondary.arcana_id 
			THEN MAX(Qualifying_Personas.persona_level) 
			ELSE MIN(Qualifying_Personas.persona_level)
		END = P_Outcome.persona_level
)
GO
/****** Object:  Table [dbo].[skills]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skills](
	[move_id] [int] IDENTITY(1,1) NOT NULL,
	[affinity_id] [int] NOT NULL,
	[move_name] [varchar](50) NOT NULL,
	[move_description] [varchar](256) NOT NULL,
 CONSTRAINT [PK_skills] PRIMARY KEY CLUSTERED 
(
	[move_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona Skill Connector]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona Skill Connector](
	[skill_connector_persona_id] [int] NOT NULL,
	[skill_connector_skill_id] [int] NOT NULL,
	[skill_level] [int] NULL,
 CONSTRAINT [PK_Persona Skill Connector] PRIMARY KEY CLUSTERED 
(
	[skill_connector_persona_id] ASC,
	[skill_connector_skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Find_Skill]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[Find_Skill] 
(	
	-- Add the parameters for the function here
	@persona varchar(50)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT  Persona_Data.dbo.Persona.persona_name AS p_name--ONLY USED FOR TESTING NOT. NECESSARY FOR TABLE IN PHP
			, Persona_Data.dbo.skills.move_name AS m_name
			, Persona_Data.dbo.skills.move_description AS m_descript
			, conn.skill_level AS s_level
	FROM Persona_Data.dbo.[Persona Skill Connector] AS conn
		INNER JOIN Persona_Data.dbo.Persona ON conn.skill_connector_persona_id = Persona.persona_id
		INNER JOIN Persona_Data.dbo.skills ON conn.skill_connector_skill_id = skills.move_id
	WHERE Persona_Data.dbo.Persona.persona_name = @persona
)
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ((0)) FOR [special_fuse_check]
GO
ALTER TABLE [dbo].[Fusion_Map]  WITH CHECK ADD FOREIGN KEY([Arcana_1_id])
REFERENCES [dbo].[Arcana] ([arcana_id])
GO
ALTER TABLE [dbo].[Fusion_Map]  WITH CHECK ADD FOREIGN KEY([Arcana_2_id])
REFERENCES [dbo].[Arcana] ([arcana_id])
GO
ALTER TABLE [dbo].[Fusion_Map]  WITH CHECK ADD FOREIGN KEY([Result_id])
REFERENCES [dbo].[Arcana] ([arcana_id])
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD FOREIGN KEY([arcana_id])
REFERENCES [dbo].[Arcana] ([arcana_id])
GO
ALTER TABLE [dbo].[Persona Affinity Connect]  WITH CHECK ADD FOREIGN KEY([p_connector_affinity_id])
REFERENCES [dbo].[Affinity] ([affinity_id])
GO
ALTER TABLE [dbo].[Persona Affinity Connect]  WITH CHECK ADD FOREIGN KEY([p_connector_persona_id])
REFERENCES [dbo].[Persona] ([persona_id])
GO
ALTER TABLE [dbo].[Persona Affinity Connect]  WITH CHECK ADD FOREIGN KEY([p_connector_resistance_id])
REFERENCES [dbo].[Resistance] ([resistance_id])
GO
ALTER TABLE [dbo].[Persona Skill Connector]  WITH CHECK ADD FOREIGN KEY([skill_connector_persona_id])
REFERENCES [dbo].[Persona] ([persona_id])
GO
ALTER TABLE [dbo].[skills]  WITH CHECK ADD FOREIGN KEY([affinity_id])
REFERENCES [dbo].[Affinity] ([affinity_id])
GO
ALTER TABLE [dbo].[Affinity]  WITH CHECK ADD  CONSTRAINT [affinity_numerical_check] CHECK  ((isnumeric([affinity_id])=(1)))
GO
ALTER TABLE [dbo].[Affinity] CHECK CONSTRAINT [affinity_numerical_check]
GO
ALTER TABLE [dbo].[Arcana]  WITH CHECK ADD  CONSTRAINT [arcana_numerical_check] CHECK  ((isnumeric([arcana_id])=(1)))
GO
ALTER TABLE [dbo].[Arcana] CHECK CONSTRAINT [arcana_numerical_check]
GO
ALTER TABLE [dbo].[Fusion_Map]  WITH CHECK ADD  CONSTRAINT [fuse_numerical_check] CHECK  ((isnumeric([Arcana_1_id])=(1) AND isnumeric([ARCANA_2_id])=(1) AND isnumeric([Result_id])=(1)))
GO
ALTER TABLE [dbo].[Fusion_Map] CHECK CONSTRAINT [fuse_numerical_check]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [level_check] CHECK  (([persona_level]>=(1) AND [persona_level]<=(99)))
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [level_check]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [level_numerical_check] CHECK  ((isnumeric([persona_level])=(1)))
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [level_numerical_check]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [numerical_check] CHECK  ((isnumeric([arcana_id])=(1)))
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [numerical_check]
GO
ALTER TABLE [dbo].[Resistance]  WITH CHECK ADD  CONSTRAINT [ck_Only_Alphabets] CHECK  ((NOT [resistance_type] like '%[^A-Z]%'))
GO
ALTER TABLE [dbo].[Resistance] CHECK CONSTRAINT [ck_Only_Alphabets]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [agility_cap_check] CHECK  (([stat_agility]>=(1) AND [stat_agility]<=(99)))
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [agility_cap_check]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [endurance_cap_check] CHECK  (([stat_endurance]>=(1) AND [stat_endurance]<=(99)))
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [endurance_cap_check]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [luck_cap_check] CHECK  (([stat_luck]>=(1) AND [stat_luck]<=(99)))
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [luck_cap_check]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [magic_cap_check] CHECK  (([stat_magic]>=(1) AND [stat_magic]<=(99)))
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [magic_cap_check]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [stat_numerical_check] CHECK  ((isnumeric([stat_luck])=(1) AND isnumeric([stat_luck])=(1) AND isnumeric([stat_agility])=(1) AND isnumeric([stat_endurance])=(1) AND isnumeric([stat_strength])=(1) AND isnumeric([stat_magic])=(1)))
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [stat_numerical_check]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [strength_cap_check] CHECK  (([stat_strength]>=(1) AND [stat_strength]<=(99)))
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [strength_cap_check]
GO
/****** Object:  StoredProcedure [dbo].[Complete_Fusion_Chart]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Complete_Fusion_Chart] 
	-- Add the parameters for the stored procedure here
	@persona varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  

IF OBJECT_ID('#FusionTable') IS NOT NULL
	DROP TABLE #FusionTable

SELECT * INTO #FusionTable FROM dbo.Fuse(@persona)

--The temp table is not created with an ID column, so the table is altered to include it here
ALTER TABLE #FusionTable ADD ID INT Identity(1, 1)

--Variable declarations
-- the outer counter is incremented in the outer WHILE loop and the inner counter
-- is incremeted in the inner WHILE loop. @total represents the total number of rows
-- in the table and provides a stopping point for the outer loop
-- The primary and secondary persona variables reflect the primary and secondary personas
-- in the temp table. There is one of each in the inner and outer loop
DECLARE @outerCounter int
DECLARE @innerCounter int
DECLARE @total int
DECLARE @outerPrimaryPersona varchar(50)
DECLARE @outerSecondaryPersona varchar(50)
DECLARE @innerPrimaryPersona varchar(50)
DECLARE @innerSecondaryPersona varchar(50)

-- The value of the first ID is 1, so each counter is initialized accordingly
-- @total is determined by counting the total number of rows in the table
SET @outerCounter = 1
SET @innerCounter = 1
SET @total = (SELECT COUNT(*) FROM #FusionTable)

-- outer WHILE loop continues until the final row has been processed
WHILE @outerCounter <= @total
BEGIN
	-- stores the primary and secondary persona names in the current row
	-- in their respective outer variables. Since the ID column is a 
	-- unique identity, there will only ever be one row returned in this query
	SELECT
		@outerPrimaryPersona = Primary_Name
		, @outerSecondaryPersona = Secondary_Name
	FROM #FusionTable
	WHERE ID = @outerCounter
	
	-- inner WHILE loop looks at all rows prior to the current (outer loop) row
	WHILE @innerCounter < @outerCounter
	BEGIN
		-- Any duplicate rows should be in opposite positions. So in order to
		-- count as a duplicate, the outer primary persona must match the inner
		-- secondary persona, and vice versa for the outer secondary persona

		SELECT
			@innerPrimaryPersona = Primary_Name
			, @innerSecondaryPersona = Secondary_Name
		FROM #FusionTable
		WHERE ID = @innerCounter
		
		IF( @outerPrimaryPersona = @innerSecondaryPersona
			AND @outerSecondaryPersona = @innerPrimaryPersona )
		BEGIN
			-- delete the row matching the position of @innerCounter if the
			-- condition is true. There should only be one duplicate, so 
			-- BREAK out of the loop if this is encountered
			DELETE FROM #FusionTable WHERE ID = @innerCounter
			BREAK
		END
		ELSE
			-- Otherwise, increment the inner counter
			SET @innerCounter += 1
	END;

	-- reset inner counter back to 1 and increment outer counter
	SET @innerCounter = 1
	SET @outerCounter += 1
END;

SELECT * FROM #FusionTable
END
GO
/****** Object:  StoredProcedure [dbo].[Create_Main_Table]    Script Date: 12/11/2020 3:38:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Create_Main_Table]
	@persona varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT P.persona_level 
		, P.persona_name
		, Arc.arcana_type
		, S.stat_luck
		, S.stat_agility
		, S.stat_endurance
		, S.stat_strength
		, S.stat_magic
		, MAX(CASE WHEN Aff.affinity_type = 'Gun' THEN resistance_type END) AS Gun
		, MAX(CASE WHEN Aff.affinity_type = 'Phys' THEN resistance_type END) AS Phys
		, MAX(CASE WHEN Aff.affinity_type = 'Fire' THEN resistance_type END) AS Fire
		, MAX(CASE WHEN Aff.affinity_type = 'Ice' THEN resistance_type END) AS Ice
		, MAX(CASE WHEN Aff.affinity_type = 'Elec' THEN resistance_type END) AS Elec
		, MAX(CASE WHEN Aff.affinity_type = 'Wind' THEN resistance_type END) AS Wind
		, MAX(CASE WHEN Aff.affinity_type = 'Nuclear' THEN resistance_type END) AS Nuke
		, MAX(CASE WHEN Aff.affinity_type = 'Psychic' THEN resistance_type END) AS Psy
		, MAX(CASE WHEN Aff.affinity_type = 'Curse' THEN resistance_type END) AS Curse
		, MAX(CASE WHEN Aff.affinity_type = 'Bless' THEN resistance_type END) AS Bless
--	INTO #MainTable
	FROM dbo.Persona AS P
		LEFT JOIN Arcana AS Arc
			ON P.arcana_id = Arc.arcana_id
		LEFT JOIN dbo.Stats AS S
			ON P.persona_id = S.stat_id
		LEFT JOIN dbo.[Persona Affinity Connect] AS PAC
			ON P.persona_id = PAC.p_connector_persona_id
		LEFT JOIN dbo.Affinity AS Aff
			ON PAC.p_connector_affinity_id = Aff.affinity_id
		LEFT JOIN (
			SELECT resistance_id
				, CASE WHEN resistance_type = 'None' THEN '-' ELSE resistance_type END AS resistance_type
			FROM dbo.Resistance
		) R
			ON PAC.p_connector_resistance_id = R.resistance_id
	WHERE LOWER(P.persona_name) LIKE LOWER(@persona) + '%'
		OR @persona IS NULL
	GROUP BY P.persona_level 
		, P.persona_name
		, Arc.arcana_type
		, S.stat_luck
		, S.stat_agility
		, S.stat_endurance
		, S.stat_strength
		, S.stat_magic
END
GO
USE [master]
GO
ALTER DATABASE [Persona_Data] SET  READ_WRITE 
GO
