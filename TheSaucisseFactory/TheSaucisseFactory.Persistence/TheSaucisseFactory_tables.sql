/* CodeFluent Generated . TargetVersion:Sql2008. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Media]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Residence]
GO

/* no fk for 'PK_Med_Id_Med', tableName='Media' table='Media' */
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
 CONSTRAINT [PK_Med_Id_Med] PRIMARY KEY NONCLUSTERED
 (

  [Id]
 ) ON [PRIMARY]
)
GO

/* no fk for 'PK_Res_Id_Res', tableName='Residence' table='Residence' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Residence]'))
 ALTER TABLE [dbo].[Residence] DROP CONSTRAINT [PK_Res_Id_Res]
GO
CREATE TABLE [dbo].[Residence] (
 [Id] [uniqueidentifier] NOT NULL,
 [CamelId] [nvarchar] (256) NULL,
 [Nom] [nvarchar] (100) NULL,
 CONSTRAINT [PK_Res_Id_Res] PRIMARY KEY NONCLUSTERED
 (

  [Id]
 ) ON [PRIMARY]
)
GO

