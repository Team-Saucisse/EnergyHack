/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
DECLARE @rv rowversion
DECLARE @su nvarchar(64)
SELECT @su=SYSTEM_USER
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26001', @Nom=N'Eau froide entre voisins'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26002', @Nom=N'Eau chaude entre voisins'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26003', @Nom=N'Appareil en veille'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26004', @Nom=N'Podium général entre voisins'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26005', @Nom=N'Température idéale'
EXECUTE [dbo].[Challenge_Save] @Id='ca41f533-faef-435f-8b11-21e7da5b4575', @Nom=N'Electricité entre voisins'
