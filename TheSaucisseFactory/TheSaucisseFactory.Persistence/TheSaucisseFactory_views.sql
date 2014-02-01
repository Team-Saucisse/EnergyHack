/* CodeFluent Generated . TargetVersion:Sql2008. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vMedia' AND TABLE_SCHEMA = 'dbo')
DROP VIEW [dbo].[vMedia]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vResidence' AND TABLE_SCHEMA = 'dbo')
DROP VIEW [dbo].[vResidence]
GO

CREATE VIEW [dbo].[vMedia]
AS
SELECT [Media].[Id], [Media].[Nom], [Media].[Rang], [Media].[Fichier_FileName], [Media].[Fichier_ContentType], [Media].[Fichier_Attributes], [Media].[Fichier_Size], [Media].[Fichier_LastWriteTimeUtc], [Media].[Fichier_LastAccessTimeUtc], [Media].[Fichier_CreationTimeUtc], [Media].[Origine] 
    FROM [Media]
GO

CREATE VIEW [dbo].[vResidence]
AS
SELECT [Residence].[Id], [Residence].[CamelId], [Residence].[Nom] 
    FROM [Residence]
GO

