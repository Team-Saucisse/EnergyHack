/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
ALTER TABLE [dbo].[Appartement] WITH NOCHECK ADD CONSTRAINT [FK_App_Bat_Id_Res] FOREIGN KEY (
 [Batiment_Id]
) REFERENCES [dbo].[Residence](

 [Id]
)
ALTER TABLE [dbo].[Appartement] NOCHECK CONSTRAINT [FK_App_Bat_Id_Res]
ALTER TABLE [dbo].[Batiment] WITH NOCHECK ADD CONSTRAINT [FK_Bat_Res_Id_Res] FOREIGN KEY (
 [Residence_Id]
) REFERENCES [dbo].[Residence](

 [Id]
)
ALTER TABLE [dbo].[Batiment] NOCHECK CONSTRAINT [FK_Bat_Res_Id_Res]
ALTER TABLE [dbo].[GainEnergyCoin] WITH NOCHECK ADD CONSTRAINT [FK_Gai_App_Id_App] FOREIGN KEY (
 [Appartement_Id]
) REFERENCES [dbo].[Appartement](

 [Id]
)
ALTER TABLE [dbo].[GainEnergyCoin] NOCHECK CONSTRAINT [FK_Gai_App_Id_App]
ALTER TABLE [dbo].[Shop] WITH NOCHECK ADD CONSTRAINT [FK_Sho_Res_Id_Res] FOREIGN KEY (
 [Residence_Id]
) REFERENCES [dbo].[Residence](

 [Id]
)
ALTER TABLE [dbo].[Shop] NOCHECK CONSTRAINT [FK_Sho_Res_Id_Res]
ALTER TABLE [dbo].[Batiment_Appartement_Appartement] WITH NOCHECK ADD CONSTRAINT [FK_Bai_Id_Id_Bat] FOREIGN KEY (
 [Id]
) REFERENCES [dbo].[Batiment](

 [Id]
)
ALTER TABLE [dbo].[Batiment_Appartement_Appartement] NOCHECK CONSTRAINT [FK_Bai_Id_Id_Bat]
ALTER TABLE [dbo].[Batiment_Appartement_Appartement] WITH NOCHECK ADD CONSTRAINT [FK_Bai_Id2_Id_App] FOREIGN KEY (
 [Id2]
) REFERENCES [dbo].[Appartement](

 [Id]
)
ALTER TABLE [dbo].[Batiment_Appartement_Appartement] NOCHECK CONSTRAINT [FK_Bai_Id2_Id_App]
ALTER TABLE [dbo].[Challenge_Illustrations_Illustration] WITH NOCHECK ADD CONSTRAINT [FK_Chl_Id_Id_Cha] FOREIGN KEY (
 [Id]
) REFERENCES [dbo].[Challenge](

 [Id]
)
ALTER TABLE [dbo].[Challenge_Illustrations_Illustration] NOCHECK CONSTRAINT [FK_Chl_Id_Id_Cha]
ALTER TABLE [dbo].[Challenge_Illustrations_Illustration] WITH NOCHECK ADD CONSTRAINT [FK_Chl_Id2_Id_Ill] FOREIGN KEY (
 [Id2]
) REFERENCES [dbo].[Illustration](

 [Id]
)
ALTER TABLE [dbo].[Challenge_Illustrations_Illustration] NOCHECK CONSTRAINT [FK_Chl_Id2_Id_Ill]
ALTER TABLE [dbo].[Shop_Publicites_Media] WITH NOCHECK ADD CONSTRAINT [FK_Shp_Id_Id_Sho] FOREIGN KEY (
 [Id]
) REFERENCES [dbo].[Shop](

 [Id]
)
ALTER TABLE [dbo].[Shop_Publicites_Media] NOCHECK CONSTRAINT [FK_Shp_Id_Id_Sho]
ALTER TABLE [dbo].[Shop_Publicites_Media] WITH NOCHECK ADD CONSTRAINT [FK_Shp_Id2_Id_Med] FOREIGN KEY (
 [Id2]
) REFERENCES [dbo].[Media](

 [Id]
)
ALTER TABLE [dbo].[Shop_Publicites_Media] NOCHECK CONSTRAINT [FK_Shp_Id2_Id_Med]
