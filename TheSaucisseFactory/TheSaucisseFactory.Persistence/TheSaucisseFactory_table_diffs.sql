/* CodeFluent Generated . TargetVersion:Sql2008. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
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
 ) ON [PRIMARY]
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
 ) ON [PRIMARY]
