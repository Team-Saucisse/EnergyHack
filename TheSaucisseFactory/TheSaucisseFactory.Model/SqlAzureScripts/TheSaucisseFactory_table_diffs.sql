/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
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
/* table '[dbo].[Media]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Mesure]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Residence]' primary key is related to a clustered index and cannot be changed on SQL Azure */
/* table '[dbo].[Commerce_Publicites_Media_Commerces]' primary key is related to a clustered index and cannot be changed on SQL Azure */
