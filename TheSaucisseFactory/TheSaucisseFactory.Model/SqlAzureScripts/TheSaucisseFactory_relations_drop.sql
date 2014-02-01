/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Gai_App_Id_App]') AND parent_obj = object_id(N'[dbo].[GainEnergyCoin]'))
 ALTER TABLE [dbo].[GainEnergyCoin] DROP CONSTRAINT [FK_Gai_App_Id_App]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Mes_App_Id_App]') AND parent_obj = object_id(N'[dbo].[Mesure]'))
 ALTER TABLE [dbo].[Mesure] DROP CONSTRAINT [FK_Mes_App_Id_App]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_App_Bat_Id_Bat]') AND parent_obj = object_id(N'[dbo].[Appartement]'))
 ALTER TABLE [dbo].[Appartement] DROP CONSTRAINT [FK_App_Bat_Id_Bat]
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_App_Bat_Id_Bat]') AND parent_obj = object_id(N'[dbo].[Appartement]'))
 ALTER TABLE [dbo].[Appartement] DROP CONSTRAINT [FK_App_Bat_Id_Bat]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Bat_Res_Id_Res]') AND parent_obj = object_id(N'[dbo].[Batiment]'))
 ALTER TABLE [dbo].[Batiment] DROP CONSTRAINT [FK_Bat_Res_Id_Res]
GO
/* no fk for 'FK_Gai_App_Id_App', tableName='GainEnergyCoin' table='GainEnergyCoin' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Gai_App_Id_App]') AND parent_obj = object_id(N'[dbo].[GainEnergyCoin]'))
 ALTER TABLE [dbo].[GainEnergyCoin] DROP CONSTRAINT [FK_Gai_App_Id_App]
GO
/* no fk for 'FK_Gai_Cha_Id_Cha', tableName='GainEnergyCoin' table='GainEnergyCoin' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Gai_Cha_Id_Cha]') AND parent_obj = object_id(N'[dbo].[GainEnergyCoin]'))
 ALTER TABLE [dbo].[GainEnergyCoin] DROP CONSTRAINT [FK_Gai_Cha_Id_Cha]
GO
/* no fk for 'FK_Ill_Cha_Id_Cha', tableName='Illustration' table='Illustration' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Ill_Cha_Id_Cha]') AND parent_obj = object_id(N'[dbo].[Illustration]'))
 ALTER TABLE [dbo].[Illustration] DROP CONSTRAINT [FK_Ill_Cha_Id_Cha]
GO
/* no fk for 'FK_Mes_App_Id_App', tableName='Mesure' table='Mesure' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Mes_App_Id_App]') AND parent_obj = object_id(N'[dbo].[Mesure]'))
 ALTER TABLE [dbo].[Mesure] DROP CONSTRAINT [FK_Mes_App_Id_App]
GO
/* no fk for 'FK_Coe_Id_Id_Com', tableName='Commerce_Publicites_Media_Commerces' table='Commerce_Publicites_Media_Commerces' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Coe_Id_Id_Com]') AND parent_obj = object_id(N'[dbo].[Commerce_Publicites_Media_Commerces]'))
 ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] DROP CONSTRAINT [FK_Coe_Id_Id_Com]
GO
/* no fk for 'FK_Coe_Id2_Id_Med', tableName='Commerce_Publicites_Media_Commerces' table='Commerce_Publicites_Media_Commerces' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Coe_Id2_Id_Med]') AND parent_obj = object_id(N'[dbo].[Commerce_Publicites_Media_Commerces]'))
 ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] DROP CONSTRAINT [FK_Coe_Id2_Id_Med]
GO
