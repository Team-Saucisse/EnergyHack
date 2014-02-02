/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
DECLARE @rv rowversion
DECLARE @su nvarchar(64)
SELECT @su=SYSTEM_USER
EXECUTE [dbo].[Challenge_Save] @Id='0102eeb9-e934-4b60-8ea1-f7bd1ab8b237', @Nom=N'Mon challenge appareils en veille'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26001', @Nom=N'Eau froide entre voisins'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26002', @Nom=N'Eau chaude entre voisins'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26003', @Nom=N'Appareil en veille'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26004', @Nom=N'Podium général entre voisins'
EXECUTE [dbo].[Challenge_Save] @Id='4a522da4-40d7-4d00-b70d-8920e4a26005', @Nom=N'Température idéale'
EXECUTE [dbo].[Challenge_Save] @Id='6d8da3f2-08cf-4f8a-a72b-f54ad63d3cf0', @Nom=N'Mon challenge eau froide'
EXECUTE [dbo].[Challenge_Save] @Id='c9ef0bd9-2ee3-4c4d-acd4-d98e284d9605', @Nom=N'Mon challenge électricité'
EXECUTE [dbo].[Challenge_Save] @Id='ca41f533-faef-435f-8b11-21e7da5b4575', @Nom=N'Electricité entre voisins'
EXECUTE [dbo].[Challenge_Save] @Id='d3d6a5bb-46e3-4a1c-9254-fd853655e850', @Nom=N'Mon challenge eau chaude'
