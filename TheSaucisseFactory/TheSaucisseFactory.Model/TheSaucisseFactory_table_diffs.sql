/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* no fk for 'PK_App_Id_App', tableName='Appartement' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_App_Id_App]') AND parent_obj = object_id(N'[dbo].[Appartement]'))
 ALTER TABLE [dbo].[Appartement] DROP CONSTRAINT [PK_App_Id_App]
GO
CREATE TABLE [dbo].[Appartement] (
 [Id] [uniqueidentifier] NOT NULL,
 [CamelId] [nvarchar] (256) NULL,
 [Nom] [nvarchar] (100) NULL,
 [Batiment_Id] [uniqueidentifier] NULL,
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
 [CamelId] [nvarchar] (256) NULL,
 [Nom] [nvarchar] (100) NULL,
 [Residence_Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Bat_Id_Bat] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
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

/* no fk for 'PK_Gai_Id_Gai', tableName='GainEnergyCoin' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Gai_Id_Gai]') AND parent_obj = object_id(N'[dbo].[GainEnergyCoin]'))
 ALTER TABLE [dbo].[GainEnergyCoin] DROP CONSTRAINT [PK_Gai_Id_Gai]
GO
CREATE TABLE [dbo].[GainEnergyCoin] (
 [Id] [uniqueidentifier] NOT NULL,
 [Appartement_Id] [uniqueidentifier] NULL,
 [Date] [datetime] NULL,
 [Quantite] [int] NULL,
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
 CONSTRAINT [PK_Ill_Id_Ill] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* column 'Fichier', old length:-1, new length: 2147483647*/
ALTER TABLE [dbo].[Media] ALTER COLUMN [Fichier] [varbinary] (max) NULL
/* no fk for 'PK_Med_Id_Med', tableName='Media' table='Media' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Med_Id_Med]') AND parent_obj = object_id(N'[dbo].[Media]'))
 ALTER TABLE [dbo].[Media] DROP CONSTRAINT [PK_Med_Id_Med]
GO
/* no fk for 'PK_Med_Id_Med', tableName='Media' table='Media' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Med_Id_Med]') AND parent_obj = object_id(N'[dbo].[Media]'))
 ALTER TABLE [dbo].[Media] DROP CONSTRAINT [PK_Med_Id_Med]
GO
ALTER TABLE [dbo].[Media] ADD CONSTRAINT [PK_Med_Id_Med] PRIMARY KEY NONCLUSTERED
(

 [Id]
 )
/* no fk for 'PK_Res_Id_Res', tableName='Residence' table='Residence' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Residence]'))
 ALTER TABLE [dbo].[Residence] DROP CONSTRAINT [PK_Res_Id_Res]
GO
/* no fk for 'PK_Res_Id_Res', tableName='Residence' table='Residence' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Residence]'))
 ALTER TABLE [dbo].[Residence] DROP CONSTRAINT [PK_Res_Id_Res]
GO
ALTER TABLE [dbo].[Residence] ADD CONSTRAINT [PK_Res_Id_Res] PRIMARY KEY NONCLUSTERED
(

 [Id]
 )
/* no fk for 'PK_Sho_Id_Sho', tableName='Shop' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Sho_Id_Sho]') AND parent_obj = object_id(N'[dbo].[Shop]'))
 ALTER TABLE [dbo].[Shop] DROP CONSTRAINT [PK_Sho_Id_Sho]
GO
CREATE TABLE [dbo].[Shop] (
 [Id] [uniqueidentifier] NOT NULL,
 [Nom] [nvarchar] (100) NULL,
 [Url] [nvarchar] (2000) NULL,
 [Residence_Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Sho_Id_Sho] PRIMARY KEY CLUSTERED
 (

  [Id]
 )
)
GO

/* no fk for 'PK_Bai_Id_Id2_Bai', tableName='Batiment_Appartement_Appartement' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Bai_Id_Id2_Bai]') AND parent_obj = object_id(N'[dbo].[Batiment_Appartement_Appartement]'))
 ALTER TABLE [dbo].[Batiment_Appartement_Appartement] DROP CONSTRAINT [PK_Bai_Id_Id2_Bai]
GO
CREATE TABLE [dbo].[Batiment_Appartement_Appartement] (
 [Id] [uniqueidentifier] NOT NULL,
 [Id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Bai_Id_Id2_Bai] PRIMARY KEY CLUSTERED
 (

  [Id],
  [Id2]
 )
)
GO

/* no fk for 'PK_Chl_Id_Id2_Chl', tableName='Challenge_Illustrations_Illustration' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Chl_Id_Id2_Chl]') AND parent_obj = object_id(N'[dbo].[Challenge_Illustrations_Illustration]'))
 ALTER TABLE [dbo].[Challenge_Illustrations_Illustration] DROP CONSTRAINT [PK_Chl_Id_Id2_Chl]
GO
CREATE TABLE [dbo].[Challenge_Illustrations_Illustration] (
 [Id] [uniqueidentifier] NOT NULL,
 [Id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Chl_Id_Id2_Chl] PRIMARY KEY CLUSTERED
 (

  [Id],
  [Id2]
 )
)
GO

/* no fk for 'PK_Shp_Id_Id2_Shp', tableName='Shop_Publicites_Media' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Shp_Id_Id2_Shp]') AND parent_obj = object_id(N'[dbo].[Shop_Publicites_Media]'))
 ALTER TABLE [dbo].[Shop_Publicites_Media] DROP CONSTRAINT [PK_Shp_Id_Id2_Shp]
GO
CREATE TABLE [dbo].[Shop_Publicites_Media] (
 [Id] [uniqueidentifier] NOT NULL,
 [Id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Shp_Id_Id2_Shp] PRIMARY KEY CLUSTERED
 (

  [Id],
  [Id2]
 )
)
GO

