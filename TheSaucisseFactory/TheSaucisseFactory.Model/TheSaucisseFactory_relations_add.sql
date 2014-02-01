/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
ALTER TABLE [dbo].[Appartement] WITH NOCHECK ADD CONSTRAINT [FK_App_Bat_Id_Bat] FOREIGN KEY (
 [Batiment_Id]
) REFERENCES [dbo].[Batiment](

 [Id]
)
ALTER TABLE [dbo].[Appartement] NOCHECK CONSTRAINT [FK_App_Bat_Id_Bat]
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
ALTER TABLE [dbo].[GainEnergyCoin] WITH NOCHECK ADD CONSTRAINT [FK_Gai_Cha_Id_Cha] FOREIGN KEY (
 [Challenge_Id]
) REFERENCES [dbo].[Challenge](

 [Id]
)
ALTER TABLE [dbo].[GainEnergyCoin] NOCHECK CONSTRAINT [FK_Gai_Cha_Id_Cha]
ALTER TABLE [dbo].[Illustration] WITH NOCHECK ADD CONSTRAINT [FK_Ill_Cha_Id_Cha] FOREIGN KEY (
 [Challenge_Id]
) REFERENCES [dbo].[Challenge](

 [Id]
)
ALTER TABLE [dbo].[Illustration] NOCHECK CONSTRAINT [FK_Ill_Cha_Id_Cha]
ALTER TABLE [dbo].[Mesure] WITH NOCHECK ADD CONSTRAINT [FK_Mes_App_Id_App] FOREIGN KEY (
 [Appartement_Id]
) REFERENCES [dbo].[Appartement](

 [Id]
)
ALTER TABLE [dbo].[Mesure] NOCHECK CONSTRAINT [FK_Mes_App_Id_App]
ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] WITH NOCHECK ADD CONSTRAINT [FK_Coe_Id_Id_Com] FOREIGN KEY (
 [Id]
) REFERENCES [dbo].[Commerce](

 [Id]
)
ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] NOCHECK CONSTRAINT [FK_Coe_Id_Id_Com]
ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] WITH NOCHECK ADD CONSTRAINT [FK_Coe_Id2_Id_Med] FOREIGN KEY (
 [Id2]
) REFERENCES [dbo].[Media](

 [Id]
)
ALTER TABLE [dbo].[Commerce_Publicites_Media_Commerces] NOCHECK CONSTRAINT [FK_Coe_Id2_Id_Med]
