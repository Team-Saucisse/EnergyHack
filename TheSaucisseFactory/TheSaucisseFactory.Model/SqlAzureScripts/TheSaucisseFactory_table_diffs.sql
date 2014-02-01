/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* table '[dbo].[Appartement]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Batiment]' primary key is related to a clustered index and cannot be changed on SQL Azure */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_App_Bat_Id_Bat]') AND parent_obj = object_id(N'[dbo].[Appartement]'))
 ALTER TABLE [dbo].[Appartement] DROP CONSTRAINT [FK_App_Bat_Id_Bat]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[IX_Bat_Cam_Bat]') AND parent_obj = object_id(N'[dbo].[Batiment]'))
 ALTER TABLE [dbo].[Batiment] DROP CONSTRAINT [IX_Bat_Cam_Bat]
GO
ALTER TABLE [dbo].[Batiment] ADD CONSTRAINT [IX_Bat_Cam_Bat] UNIQUE
(

  [CamelId] )
/* table '[dbo].[Challenge]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Commerce]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[GainEnergyCoin]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* column 'Contenu', old length:-1, new length: 2147483647*/
ALTER TABLE [dbo].[Illustration] ALTER COLUMN [Contenu] [nvarchar] (max) NULL
/* table '[dbo].[Illustration]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* column 'Fichier', old length:-1, new length: 2147483647*/
ALTER TABLE [dbo].[Media] ALTER COLUMN [Fichier] [varbinary] (max) NULL
/* table '[dbo].[Media]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Mesure]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Residence]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Commerce_Publicites_Media_Commerces]' primary key is related to a clustered index and cannot be changed on SQL Azure */
