/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* no fk for 'FK_App_Bat_Id_Res', tableName='Appartement' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_App_Bat_Id_Res]') AND parent_obj = object_id(N'[dbo].[Appartement]'))
 ALTER TABLE [dbo].[Appartement] DROP CONSTRAINT [FK_App_Bat_Id_Res]
GO
/* no fk for 'FK_Bat_Res_Id_Res', tableName='Batiment' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Bat_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Batiment]'))
 ALTER TABLE [dbo].[Batiment] DROP CONSTRAINT [FK_Bat_Res_Id_Res]
GO
/* no fk for 'FK_Gai_App_Id_App', tableName='GainEnergyCoin' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Gai_App_Id_App]') AND parent_obj = object_id(N'[dbo].[GainEnergyCoin]'))
 ALTER TABLE [dbo].[GainEnergyCoin] DROP CONSTRAINT [FK_Gai_App_Id_App]
GO
/* no fk for 'FK_Sho_Res_Id_Res', tableName='Shop' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Sho_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Shop]'))
 ALTER TABLE [dbo].[Shop] DROP CONSTRAINT [FK_Sho_Res_Id_Res]
GO
/* no fk for 'FK_Bai_Id_Id_Bat', tableName='Batiment_Appartement_Appartement' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Bai_Id_Id_Bat]') AND parent_obj = object_id(N'[dbo].[Batiment_Appartement_Appartement]'))
 ALTER TABLE [dbo].[Batiment_Appartement_Appartement] DROP CONSTRAINT [FK_Bai_Id_Id_Bat]
GO
/* no fk for 'FK_Bai_Id2_Id_App', tableName='Batiment_Appartement_Appartement' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Bai_Id2_Id_App]') AND parent_obj = object_id(N'[dbo].[Batiment_Appartement_Appartement]'))
 ALTER TABLE [dbo].[Batiment_Appartement_Appartement] DROP CONSTRAINT [FK_Bai_Id2_Id_App]
GO
/* no fk for 'FK_Chl_Id_Id_Cha', tableName='Challenge_Illustrations_Illustration' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Chl_Id_Id_Cha]') AND parent_obj = object_id(N'[dbo].[Challenge_Illustrations_Illustration]'))
 ALTER TABLE [dbo].[Challenge_Illustrations_Illustration] DROP CONSTRAINT [FK_Chl_Id_Id_Cha]
GO
/* no fk for 'FK_Chl_Id2_Id_Ill', tableName='Challenge_Illustrations_Illustration' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Chl_Id2_Id_Ill]') AND parent_obj = object_id(N'[dbo].[Challenge_Illustrations_Illustration]'))
 ALTER TABLE [dbo].[Challenge_Illustrations_Illustration] DROP CONSTRAINT [FK_Chl_Id2_Id_Ill]
GO
/* no fk for 'FK_Shp_Id_Id_Sho', tableName='Shop_Publicites_Media' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Shp_Id_Id_Sho]') AND parent_obj = object_id(N'[dbo].[Shop_Publicites_Media]'))
 ALTER TABLE [dbo].[Shop_Publicites_Media] DROP CONSTRAINT [FK_Shp_Id_Id_Sho]
GO
/* no fk for 'FK_Shp_Id2_Id_Med', tableName='Shop_Publicites_Media' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Shp_Id2_Id_Med]') AND parent_obj = object_id(N'[dbo].[Shop_Publicites_Media]'))
 ALTER TABLE [dbo].[Shop_Publicites_Media] DROP CONSTRAINT [FK_Shp_Id2_Id_Med]
GO
