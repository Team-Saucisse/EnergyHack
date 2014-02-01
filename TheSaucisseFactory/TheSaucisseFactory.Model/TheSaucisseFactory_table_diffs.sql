﻿/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* column 'Type' was not found in table 'Appartement'. */
ALTER TABLE [dbo].[Appartement] ADD [Type] [nvarchar] (10) NULL
GO
/* column 'Orientation' was not found in table 'Appartement'. */
ALTER TABLE [dbo].[Appartement] ADD [Orientation] [nvarchar] (10) NULL
GO
/* column 'SurfaceHabitable' was not found in table 'Appartement'. */
ALTER TABLE [dbo].[Appartement] ADD [SurfaceHabitable] [float] NULL
GO
/* table '[dbo].[Appartement]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Batiment]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Challenge]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Commerce]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[GainEnergyCoin]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* column 'Contenu', old length:-1, new length: 2147483647*/
ALTER TABLE [dbo].[Illustration] ALTER COLUMN [Contenu] [nvarchar] (max) NULL
/* table '[dbo].[Illustration]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* column 'Fichier', old length:-1, new length: 2147483647*/
ALTER TABLE [dbo].[Media] ALTER COLUMN [Fichier] [varbinary] (max) NULL
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Coe_Id2_Id_Med]') AND parent_obj = object_id(N'[dbo].[Commerce_Publicites_Media_Commerces]'))
 ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] DROP CONSTRAINT [FK_Coe_Id2_Id_Med]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Med_Id_Med]') AND parent_obj = object_id(N'[dbo].[Media]'))
 ALTER TABLE [dbo].[Media] DROP CONSTRAINT [PK_Med_Id_Med]
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Coe_Id2_Id_Med]') AND parent_obj = object_id(N'[dbo].[Commerce_Publicites_Media_Commerces]'))
 ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] DROP CONSTRAINT [FK_Coe_Id2_Id_Med]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Med_Id_Med]') AND parent_obj = object_id(N'[dbo].[Media]'))
 ALTER TABLE [dbo].[Media] DROP CONSTRAINT [PK_Med_Id_Med]
GO
ALTER TABLE [dbo].[Media] ADD CONSTRAINT [PK_Med_Id_Med] PRIMARY KEY NONCLUSTERED
(

 [Id]
 )
/* table '[dbo].[Mesure]' primary key is related to a clustered index and cannot be changed on SQL Azure */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Bat_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Batiment]'))
 ALTER TABLE [dbo].[Batiment] DROP CONSTRAINT [FK_Bat_Res_Id_Res]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Residence]'))
 ALTER TABLE [dbo].[Residence] DROP CONSTRAINT [PK_Res_Id_Res]
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Bat_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Batiment]'))
 ALTER TABLE [dbo].[Batiment] DROP CONSTRAINT [FK_Bat_Res_Id_Res]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Residence]'))
 ALTER TABLE [dbo].[Residence] DROP CONSTRAINT [PK_Res_Id_Res]
GO
ALTER TABLE [dbo].[Residence] ADD CONSTRAINT [PK_Res_Id_Res] PRIMARY KEY NONCLUSTERED
(

 [Id]
 )
/* table '[dbo].[Commerce_Publicites_Media_Commerces]' primary key is related to a clustered index and cannot be changed on SQL Azure */