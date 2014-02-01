/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* no fk for 'PK_App_Id_App', tableName='Appartement' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_App_Id_App]') AND parent_obj = object_id(N'[dbo].[Appartement]'))
 ALTER TABLE [dbo].[Appartement] DROP CONSTRAINT [PK_App_Id_App]
GO
CREATE TABLE [dbo].[Appartement] (
 [Id] [uniqueidentifier] NOT NULL,
 [CamelId] [nvarchar] (10) NULL,
 [Nom] [nvarchar] (100) NULL,
 [Batiment_Id] [uniqueidentifier] NULL,
 [Type] [nvarchar] (10) NULL,
 [Orientation] [nvarchar] (10) NULL,
 [SurfaceHabitable] [float] NULL,
 CONSTRAINT [PK_App_Id_App] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Bat_Id_Bat', tableName='Batiment' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Bat_Id_Bat]') AND parent_obj = object_id(N'[dbo].[Batiment]'))
 ALTER TABLE [dbo].[Batiment] DROP CONSTRAINT [PK_Bat_Id_Bat]
GO
CREATE TABLE [dbo].[Batiment] (
 [Id] [uniqueidentifier] NOT NULL,
 [CamelId] [nvarchar] (10) NULL,
 [Nom] [nvarchar] (100) NULL,
 [Residence_Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Bat_Id_Bat] PRIMARY KEY CLUSTERED
 (

  [Id]
 ),
 CONSTRAINT [IX_Bat_Cam_Bat] UNIQUE
 (

  [CamelId] )
)
GO

/* no fk for 'PK_Cha_Id_Cha', tableName='Challenge' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Cha_Id_Cha]') AND parent_obj = object_id(N'[dbo].[Challenge]'))
 ALTER TABLE [dbo].[Challenge] DROP CONSTRAINT [PK_Cha_Id_Cha]
GO
CREATE TABLE [dbo].[Challenge] (
 [Id] [uniqueidentifier] NOT NULL,
 [Nom] [nvarchar] (100) NULL,
 CONSTRAINT [PK_Cha_Id_Cha] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Com_Id_Com', tableName='Commerce' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Com_Id_Com]') AND parent_obj = object_id(N'[dbo].[Commerce]'))
 ALTER TABLE [dbo].[Commerce] DROP CONSTRAINT [PK_Com_Id_Com]
GO
CREATE TABLE [dbo].[Commerce] (
 [Id] [uniqueidentifier] NOT NULL,
 [Nom] [nvarchar] (100) NULL,
 [Url] [nvarchar] (2000) NULL,
 CONSTRAINT [PK_Com_Id_Com] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Gai_Id_Gai', tableName='GainEnergyCoin' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Gai_Id_Gai]') AND parent_obj = object_id(N'[dbo].[GainEnergyCoin]'))
 ALTER TABLE [dbo].[GainEnergyCoin] DROP CONSTRAINT [PK_Gai_Id_Gai]
GO
CREATE TABLE [dbo].[GainEnergyCoin] (
 [Id] [uniqueidentifier] NOT NULL,
 [Appartement_Id] [uniqueidentifier] NULL,
 [Date] [datetime] NULL,
 [Quantite] [int] NULL,
 [Challenge_Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Gai_Id_Gai] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Ill_Id_Ill', tableName='Illustration' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Ill_Id_Ill]') AND parent_obj = object_id(N'[dbo].[Illustration]'))
 ALTER TABLE [dbo].[Illustration] DROP CONSTRAINT [PK_Ill_Id_Ill]
GO
CREATE TABLE [dbo].[Illustration] (
 [Id] [uniqueidentifier] NOT NULL,
 [Nom] [nvarchar] (100) NULL,
 [Contenu] [nvarchar] (max) NULL,
 [Challenge_Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Ill_Id_Ill] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Med_Id_Med', tableName='Media' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Med_Id_Med]') AND parent_obj = object_id(N'[dbo].[Media]'))
 ALTER TABLE [dbo].[Media] DROP CONSTRAINT [PK_Med_Id_Med]
GO
CREATE TABLE [dbo].[Media] (
 [Id] [uniqueidentifier] NOT NULL,
 [Nom] [nvarchar] (100) NULL,
 [Rang] [int] NULL,
 [Fichier] [varbinary] (max) NULL,
 [Fichier_FileName] [nvarchar] (256) NULL,
 [Fichier_ContentType] [nvarchar] (128) NULL,
 [Fichier_Attributes] [int] NULL,
 [Fichier_Size] [bigint] NULL,
 [Fichier_LastWriteTimeUtc] [datetime] NULL,
 [Fichier_LastAccessTimeUtc] [datetime] NULL,
 [Fichier_CreationTimeUtc] [datetime] NULL,
 [Origine] [nvarchar] (256) NULL,
 CONSTRAINT [PK_Med_Id_Med] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Mes_Id_Mes', tableName='Mesure' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Mes_Id_Mes]') AND parent_obj = object_id(N'[dbo].[Mesure]'))
 ALTER TABLE [dbo].[Mesure] DROP CONSTRAINT [PK_Mes_Id_Mes]
GO
CREATE TABLE [dbo].[Mesure] (
 [Id] [uniqueidentifier] NOT NULL,
 [Appartement_Id] [uniqueidentifier] NULL,
 [Type] [nvarchar] (10) NULL,
 [Date] [datetime] NULL,
 [Valeur] [float] NULL,
 CONSTRAINT [PK_Mes_Id_Mes] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Res_Id_Res', tableName='Residence' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Residence]'))
 ALTER TABLE [dbo].[Residence] DROP CONSTRAINT [PK_Res_Id_Res]
GO
CREATE TABLE [dbo].[Residence] (
 [Id] [uniqueidentifier] NOT NULL,
 [CamelId] [nvarchar] (10) NULL,
 [Nom] [nvarchar] (100) NULL,
 CONSTRAINT [PK_Res_Id_Res] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Coe_Id_Id2_Coe', tableName='Commerce_Publicites_Media_Commerces' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Coe_Id_Id2_Coe]') AND parent_obj = object_id(N'[dbo].[Commerce_Publicites_Media_Commerces]'))
 ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] DROP CONSTRAINT [PK_Coe_Id_Id2_Coe]
GO
CREATE TABLE [dbo].[Commerce_Publicites_Media_Commerces] (
 [Id] [uniqueidentifier] NOT NULL,
 [Id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Coe_Id_Id2_Coe] PRIMARY KEY CLUSTERED
 (

  [Id],
  [Id2]
 )
)
GO

