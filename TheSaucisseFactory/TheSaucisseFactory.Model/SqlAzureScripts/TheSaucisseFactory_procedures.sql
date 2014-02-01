/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Batiment_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Batiment_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Batiment_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Batiment_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Challenge_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Challenge_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Challenge_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Challenge_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Commerce_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Commerce_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Commerce_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Commerce_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_DeleteCommercePublicites]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_DeleteCommercePublicites]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_LoadBlobFichier]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_LoadBlobFichier]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_SaveBlobChunkFichier]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_SaveBlobChunkFichier]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_SaveBlobFichier]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_SaveBlobFichier]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_SaveCommercePublicites]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_SaveCommercePublicites]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Mesure_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Mesure_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Mesure_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Mesure_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_LoadByBatiment]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_LoadByBatiment]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Batiment_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Batiment_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Batiment_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Batiment_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Batiment_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Batiment_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Batiment_LoadByResidence]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Batiment_LoadByResidence]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Challenge_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Challenge_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Challenge_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Challenge_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Challenge_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Challenge_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Commerce_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Commerce_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Commerce_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Commerce_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Commerce_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Commerce_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Commerce_LoadCommercesPublicitesByMedia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Commerce_LoadCommercesPublicitesByMedia]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_LoadByAppartement]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_LoadByAppartement]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_LoadByAppartementDateRange]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_LoadByAppartementDateRange]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_LoadByChallenge]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_LoadByChallenge]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_LoadByChallenge]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_LoadByChallenge]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_LoadPublicitesCommercesByCommerce]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_LoadPublicitesCommercesByCommerce]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Mesure_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Mesure_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Mesure_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Mesure_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Mesure_LoadByAppartement]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Mesure_LoadByAppartement]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Mesure_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Mesure_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_LoadById]
GO

CREATE PROCEDURE [dbo].[Appartement_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Mesure] SET
 [Mesure].[Appartement_Id] = NULL
    WHERE ([Mesure].[Appartement_Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
UPDATE [GainEnergyCoin] SET
 [GainEnergyCoin].[Appartement_Id] = NULL
    WHERE ([GainEnergyCoin].[Appartement_Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
DELETE [Appartement] FROM [Appartement] 
    WHERE ([Appartement].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Appartement_Save]
(
 @Id [uniqueidentifier],
 @CamelId [nvarchar] (10) = NULL,
 @Nom [nvarchar] (100) = NULL,
 @Batiment_Id [uniqueidentifier] = NULL,
 @Type [nvarchar] (10) = NULL,
 @Orientation [nvarchar] (10) = NULL,
 @SurfaceHabitable [float] = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Appartement] SET
 [Appartement].[CamelId] = @CamelId,
 [Appartement].[Nom] = @Nom,
 [Appartement].[Batiment_Id] = @Batiment_Id,
 [Appartement].[Type] = @Type,
 [Appartement].[Orientation] = @Orientation,
 [Appartement].[SurfaceHabitable] = @SurfaceHabitable
    WHERE ([Appartement].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Appartement] (
        [Appartement].[Id],
        [Appartement].[CamelId],
        [Appartement].[Nom],
        [Appartement].[Batiment_Id],
        [Appartement].[Type],
        [Appartement].[Orientation],
        [Appartement].[SurfaceHabitable])
    VALUES (
        @Id,
        @CamelId,
        @Nom,
        @Batiment_Id,
        @Type,
        @Orientation,
        @SurfaceHabitable)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Batiment_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Appartement] SET
 [Appartement].[Batiment_Id] = NULL
    WHERE ([Appartement].[Batiment_Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
DELETE [Batiment] FROM [Batiment] 
    WHERE ([Batiment].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Batiment_Save]
(
 @Id [uniqueidentifier],
 @CamelId [nvarchar] (10) = NULL,
 @Nom [nvarchar] (100) = NULL,
 @Residence_Id [uniqueidentifier] = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Batiment] SET
 [Batiment].[CamelId] = @CamelId,
 [Batiment].[Nom] = @Nom,
 [Batiment].[Residence_Id] = @Residence_Id
    WHERE ([Batiment].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Batiment] (
        [Batiment].[Id],
        [Batiment].[CamelId],
        [Batiment].[Nom],
        [Batiment].[Residence_Id])
    VALUES (
        @Id,
        @CamelId,
        @Nom,
        @Residence_Id)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Challenge_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Illustration] SET
 [Illustration].[Challenge_Id] = NULL
    WHERE ([Illustration].[Challenge_Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
UPDATE [GainEnergyCoin] SET
 [GainEnergyCoin].[Challenge_Id] = NULL
    WHERE ([GainEnergyCoin].[Challenge_Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
DELETE [Challenge] FROM [Challenge] 
    WHERE ([Challenge].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Challenge_Save]
(
 @Id [uniqueidentifier],
 @Nom [nvarchar] (100) = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Challenge] SET
 [Challenge].[Nom] = @Nom
    WHERE ([Challenge].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Challenge] (
        [Challenge].[Id],
        [Challenge].[Nom])
    VALUES (
        @Id,
        @Nom)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Commerce_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [Commerce_Publicites_Media_Commerces] FROM [Commerce_Publicites_Media_Commerces] 
    WHERE ([Commerce_Publicites_Media_Commerces].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [Commerce] FROM [Commerce] 
    WHERE ([Commerce].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Commerce_Save]
(
 @Id [uniqueidentifier],
 @Nom [nvarchar] (100) = NULL,
 @Url [nvarchar] (2000) = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Commerce] SET
 [Commerce].[Nom] = @Nom,
 [Commerce].[Url] = @Url
    WHERE ([Commerce].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Commerce] (
        [Commerce].[Id],
        [Commerce].[Nom],
        [Commerce].[Url])
    VALUES (
        @Id,
        @Nom,
        @Url)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [GainEnergyCoin] FROM [GainEnergyCoin] 
    WHERE ([GainEnergyCoin].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_Save]
(
 @Id [uniqueidentifier],
 @Appartement_Id [uniqueidentifier] = NULL,
 @Date [datetime] = NULL,
 @Quantite [int] = NULL,
 @Challenge_Id [uniqueidentifier] = NULL,
 @Meta [nvarchar] (300) = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [GainEnergyCoin] SET
 [GainEnergyCoin].[Appartement_Id] = @Appartement_Id,
 [GainEnergyCoin].[Date] = @Date,
 [GainEnergyCoin].[Quantite] = @Quantite,
 [GainEnergyCoin].[Challenge_Id] = @Challenge_Id,
 [GainEnergyCoin].[Meta] = @Meta
    WHERE ([GainEnergyCoin].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [GainEnergyCoin] (
        [GainEnergyCoin].[Id],
        [GainEnergyCoin].[Appartement_Id],
        [GainEnergyCoin].[Date],
        [GainEnergyCoin].[Quantite],
        [GainEnergyCoin].[Challenge_Id],
        [GainEnergyCoin].[Meta])
    VALUES (
        @Id,
        @Appartement_Id,
        @Date,
        @Quantite,
        @Challenge_Id,
        @Meta)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [Illustration] FROM [Illustration] 
    WHERE ([Illustration].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_Save]
(
 @Id [uniqueidentifier],
 @Nom [nvarchar] (100) = NULL,
 @Contenu [nvarchar] (max) = NULL,
 @Challenge_Id [uniqueidentifier] = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Illustration] SET
 [Illustration].[Nom] = @Nom,
 [Illustration].[Contenu] = @Contenu,
 [Illustration].[Challenge_Id] = @Challenge_Id
    WHERE ([Illustration].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Illustration] (
        [Illustration].[Id],
        [Illustration].[Nom],
        [Illustration].[Contenu],
        [Illustration].[Challenge_Id])
    VALUES (
        @Id,
        @Nom,
        @Contenu,
        @Challenge_Id)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Media_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [Commerce_Publicites_Media_Commerces] FROM [Commerce_Publicites_Media_Commerces] 
    WHERE ([Commerce_Publicites_Media_Commerces].[Id2] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [Media] FROM [Media] 
    WHERE ([Media].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Media_DeleteCommercePublicites]
(
 @Id [uniqueidentifier] = NULL,
 @Id2 [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [Commerce_Publicites_Media_Commerces] FROM [Commerce_Publicites_Media_Commerces] 
    WHERE (([Commerce_Publicites_Media_Commerces].[Id2] = @Id2) AND ([Commerce_Publicites_Media_Commerces].[Id] = @Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Media_LoadBlobFichier]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT [Media].[Fichier] 
    FROM [Media] 
    WHERE ([Media].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Media_Save]
(
 @Id [uniqueidentifier],
 @Nom [nvarchar] (100) = NULL,
 @Rang [int] = NULL,
 @Fichier_FileName [nvarchar] (256) = NULL,
 @Fichier_ContentType [nvarchar] (128) = NULL,
 @Fichier_Attributes [int] = NULL,
 @Fichier_Size [bigint] = NULL,
 @Fichier_LastWriteTimeUtc [datetime] = NULL,
 @Fichier_LastAccessTimeUtc [datetime] = NULL,
 @Fichier_CreationTimeUtc [datetime] = NULL,
 @Origine [nvarchar] (256) = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Media] SET
 [Media].[Nom] = @Nom,
 [Media].[Rang] = @Rang,
 [Media].[Fichier_FileName] = @Fichier_FileName,
 [Media].[Fichier_ContentType] = @Fichier_ContentType,
 [Media].[Fichier_Attributes] = @Fichier_Attributes,
 [Media].[Fichier_Size] = @Fichier_Size,
 [Media].[Fichier_LastWriteTimeUtc] = @Fichier_LastWriteTimeUtc,
 [Media].[Fichier_LastAccessTimeUtc] = @Fichier_LastAccessTimeUtc,
 [Media].[Fichier_CreationTimeUtc] = @Fichier_CreationTimeUtc,
 [Media].[Origine] = @Origine
    WHERE ([Media].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Media] (
        [Media].[Id],
        [Media].[Nom],
        [Media].[Rang],
        [Media].[Fichier_FileName],
        [Media].[Fichier_ContentType],
        [Media].[Fichier_Attributes],
        [Media].[Fichier_Size],
        [Media].[Fichier_LastWriteTimeUtc],
        [Media].[Fichier_LastAccessTimeUtc],
        [Media].[Fichier_CreationTimeUtc],
        [Media].[Origine])
    VALUES (
        @Id,
        @Nom,
        @Rang,
        @Fichier_FileName,
        @Fichier_ContentType,
        @Fichier_Attributes,
        @Fichier_Size,
        @Fichier_LastWriteTimeUtc,
        @Fichier_LastAccessTimeUtc,
        @Fichier_CreationTimeUtc,
        @Origine)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Media_SaveBlobChunkFichier]
(
 @Id [uniqueidentifier],
 @Pointer [binary] (16) = NULL OUTPUT,
 @Offset [int],
 @Bytes [varbinary] (max)
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
IF(@Pointer IS NULL)
BEGIN
    UPDATE [Media] SET
     [Media].[Fichier] = 0x
        WHERE ([Media].[Id] = @Id)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    IF(@rowcount = 0)
    BEGIN
        INSERT INTO [Media] (
            [Media].[Id],
            [Media].[Fichier])
        VALUES (
            @Id,
            0x)
        SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
        IF(@error != 0)
        BEGIN
            IF @tran = 1 ROLLBACK TRANSACTION
            RETURN
        END
    END
    SELECT @Pointer = 0
END
UPDATE [Media] SET [Fichier].WRITE(@Bytes, NULL, NULL)
    WHERE ([Media].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Media_SaveBlobFichier]
(
 @Id [uniqueidentifier],
 @Fichier [varbinary] (max) = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Media] SET
 [Media].[Fichier] = @Fichier
    WHERE ([Media].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Media_SaveCommercePublicites]
(
 @Id [uniqueidentifier],
 @Id2 [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
SELECT DISTINCT TOP 1 [Commerce_Publicites_Media_Commerces].[Id] 
    FROM [Commerce_Publicites_Media_Commerces] 
    WHERE (([Commerce_Publicites_Media_Commerces].[Id2] = @Id2) AND ([Commerce_Publicites_Media_Commerces].[Id] = @Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Commerce_Publicites_Media_Commerces] (
        [Commerce_Publicites_Media_Commerces].[Id],
        [Commerce_Publicites_Media_Commerces].[Id2])
    VALUES (
        @Id,
        @Id2)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Mesure_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [Mesure] FROM [Mesure] 
    WHERE ([Mesure].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Mesure_Save]
(
 @Id [uniqueidentifier],
 @Appartement_Id [uniqueidentifier] = NULL,
 @Type [nvarchar] (10) = NULL,
 @Date [datetime] = NULL,
 @Valeur [float] = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Mesure] SET
 [Mesure].[Appartement_Id] = @Appartement_Id,
 [Mesure].[Type] = @Type,
 [Mesure].[Date] = @Date,
 [Mesure].[Valeur] = @Valeur
    WHERE ([Mesure].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Mesure] (
        [Mesure].[Id],
        [Mesure].[Appartement_Id],
        [Mesure].[Type],
        [Mesure].[Date],
        [Mesure].[Valeur])
    VALUES (
        @Id,
        @Appartement_Id,
        @Type,
        @Date,
        @Valeur)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Residence_Delete]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Batiment] SET
 [Batiment].[Residence_Id] = NULL
    WHERE ([Batiment].[Residence_Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
DELETE [Residence] FROM [Residence] 
    WHERE ([Residence].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Residence_Save]
(
 @Id [uniqueidentifier],
 @CamelId [nvarchar] (10) = NULL,
 @Nom [nvarchar] (100) = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
UPDATE [Residence] SET
 [Residence].[CamelId] = @CamelId,
 [Residence].[Nom] = @Nom
    WHERE ([Residence].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Residence] (
        [Residence].[Id],
        [Residence].[CamelId],
        [Residence].[Nom])
    VALUES (
        @Id,
        @CamelId,
        @Nom)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Appartement_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id], [Appartement].[Type], [Appartement].[Orientation], [Appartement].[SurfaceHabitable] 
    FROM [Appartement] 
    WHERE ([Appartement].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Appartement_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id], [Appartement].[Type], [Appartement].[Orientation], [Appartement].[SurfaceHabitable] 
    FROM [Appartement] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Appartement].[Nom]' AND @_orderByDirection0 = 0 THEN [Appartement].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Appartement].[Nom]' AND @_orderByDirection0 = 1 THEN [Appartement].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Appartement_LoadByBatiment]
(
 @BatimentId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id], [Appartement].[Type], [Appartement].[Orientation], [Appartement].[SurfaceHabitable] 
    FROM [Appartement] 
    WHERE ([Appartement].[Batiment_Id] = @BatimentId)
    ORDER BY CASE
        WHEN @_orderBy0 = '[Appartement].[Nom]' AND @_orderByDirection0 = 0 THEN [Appartement].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Appartement].[Nom]' AND @_orderByDirection0 = 1 THEN [Appartement].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Appartement_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id], [Appartement].[Type], [Appartement].[Orientation], [Appartement].[SurfaceHabitable] 
    FROM [Appartement] 
    WHERE ([Appartement].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Batiment_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Batiment].[Id], [Batiment].[CamelId], [Batiment].[Nom], [Batiment].[Residence_Id] 
    FROM [Batiment] 
    WHERE ([Batiment].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Batiment_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Batiment].[Id], [Batiment].[CamelId], [Batiment].[Nom], [Batiment].[Residence_Id] 
    FROM [Batiment] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Batiment].[Nom]' AND @_orderByDirection0 = 0 THEN [Batiment].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Batiment].[Nom]' AND @_orderByDirection0 = 1 THEN [Batiment].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Batiment_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Batiment].[Id], [Batiment].[CamelId], [Batiment].[Nom], [Batiment].[Residence_Id] 
    FROM [Batiment] 
    WHERE ([Batiment].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Batiment_LoadByResidence]
(
 @ResidenceId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Batiment].[Id], [Batiment].[CamelId], [Batiment].[Nom], [Batiment].[Residence_Id] 
    FROM [Batiment] 
    WHERE ([Batiment].[Residence_Id] = @ResidenceId)
    ORDER BY CASE
        WHEN @_orderBy0 = '[Batiment].[Nom]' AND @_orderByDirection0 = 0 THEN [Batiment].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Batiment].[Nom]' AND @_orderByDirection0 = 1 THEN [Batiment].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Challenge_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Challenge].[Id], [Challenge].[Nom] 
    FROM [Challenge] 
    WHERE ([Challenge].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Challenge_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Challenge].[Id], [Challenge].[Nom] 
    FROM [Challenge] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Challenge].[Nom]' AND @_orderByDirection0 = 0 THEN [Challenge].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Challenge].[Nom]' AND @_orderByDirection0 = 1 THEN [Challenge].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Challenge_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Challenge].[Id], [Challenge].[Nom] 
    FROM [Challenge] 
    WHERE ([Challenge].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Commerce_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Commerce].[Id], [Commerce].[Nom], [Commerce].[Url] 
    FROM [Commerce] 
    WHERE ([Commerce].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Commerce_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Commerce].[Id], [Commerce].[Nom], [Commerce].[Url] 
    FROM [Commerce] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Commerce].[Nom]' AND @_orderByDirection0 = 0 THEN [Commerce].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Commerce].[Nom]' AND @_orderByDirection0 = 1 THEN [Commerce].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Commerce_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Commerce].[Id], [Commerce].[Nom], [Commerce].[Url] 
    FROM [Commerce] 
    WHERE ([Commerce].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Commerce_LoadCommercesPublicitesByMedia]
(
 @MediaId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Commerce].[Id], [Commerce].[Nom], [Commerce].[Url] 
    FROM [Commerce]
        LEFT OUTER JOIN [Commerce_Publicites_Media_Commerces] ON ([Commerce].[Id] = [Commerce_Publicites_Media_Commerces].[Id])
                LEFT OUTER JOIN [Media] ON ([Commerce_Publicites_Media_Commerces].[Id2] = [Media].[Id]) 
    WHERE ([Commerce_Publicites_Media_Commerces].[Id2] = @MediaId)
    ORDER BY CASE
        WHEN @_orderBy0 = '[Commerce].[Nom]' AND @_orderByDirection0 = 0 THEN [Commerce].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Commerce].[Nom]' AND @_orderByDirection0 = 1 THEN [Commerce].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite], [GainEnergyCoin].[Challenge_Id], [GainEnergyCoin].[Meta] 
    FROM [GainEnergyCoin] 
    WHERE ([GainEnergyCoin].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite], [GainEnergyCoin].[Challenge_Id], [GainEnergyCoin].[Meta] 
    FROM [GainEnergyCoin] 

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_LoadByAppartement]
(
 @AppartementId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite], [GainEnergyCoin].[Challenge_Id], [GainEnergyCoin].[Meta] 
    FROM [GainEnergyCoin] 
    WHERE ([GainEnergyCoin].[Appartement_Id] = @AppartementId)

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_LoadByAppartementDateRange]
(
 @AppartementId [uniqueidentifier],
 @Date [datetime],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite], [GainEnergyCoin].[Challenge_Id], [GainEnergyCoin].[Meta] 
    FROM [GainEnergyCoin] 
    WHERE ((DATEDIFF(day, Date, @Date) < 30 AND DATEDIFF(s, Date, @Date) > 0) AND ([GainEnergyCoin].[Appartement_Id] = @AppartementId))

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_LoadByChallenge]
(
 @ChallengeId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite], [GainEnergyCoin].[Challenge_Id], [GainEnergyCoin].[Meta] 
    FROM [GainEnergyCoin] 
    WHERE ([GainEnergyCoin].[Challenge_Id] = @ChallengeId)

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite], [GainEnergyCoin].[Challenge_Id], [GainEnergyCoin].[Meta] 
    FROM [GainEnergyCoin] 
    WHERE ([GainEnergyCoin].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu], [Illustration].[Challenge_Id] 
    FROM [Illustration] 
    WHERE ([Illustration].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu], [Illustration].[Challenge_Id] 
    FROM [Illustration] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Illustration].[Nom]' AND @_orderByDirection0 = 0 THEN [Illustration].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Illustration].[Nom]' AND @_orderByDirection0 = 1 THEN [Illustration].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_LoadByChallenge]
(
 @ChallengeId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu], [Illustration].[Challenge_Id] 
    FROM [Illustration] 
    WHERE ([Illustration].[Challenge_Id] = @ChallengeId)
    ORDER BY CASE
        WHEN @_orderBy0 = '[Illustration].[Nom]' AND @_orderByDirection0 = 0 THEN [Illustration].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Illustration].[Nom]' AND @_orderByDirection0 = 1 THEN [Illustration].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu], [Illustration].[Challenge_Id] 
    FROM [Illustration] 
    WHERE ([Illustration].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Media_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Media].[Id], [Media].[Nom], [Media].[Rang], [Media].[Fichier_FileName], [Media].[Fichier_ContentType], [Media].[Fichier_Attributes], [Media].[Fichier_Size], [Media].[Fichier_LastWriteTimeUtc], [Media].[Fichier_LastAccessTimeUtc], [Media].[Fichier_CreationTimeUtc], [Media].[Origine] 
    FROM [Media] 
    WHERE ([Media].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Media_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Media].[Id], [Media].[Nom], [Media].[Rang], [Media].[Fichier_FileName], [Media].[Fichier_ContentType], [Media].[Fichier_Attributes], [Media].[Fichier_Size], [Media].[Fichier_LastWriteTimeUtc], [Media].[Fichier_LastAccessTimeUtc], [Media].[Fichier_CreationTimeUtc], [Media].[Origine] 
    FROM [Media] 

RETURN
GO

CREATE PROCEDURE [dbo].[Media_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Media].[Id], [Media].[Nom], [Media].[Rang], [Media].[Fichier_FileName], [Media].[Fichier_ContentType], [Media].[Fichier_Attributes], [Media].[Fichier_Size], [Media].[Fichier_LastWriteTimeUtc], [Media].[Fichier_LastAccessTimeUtc], [Media].[Fichier_CreationTimeUtc], [Media].[Origine] 
    FROM [Media] 
    WHERE ([Media].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Media_LoadPublicitesCommercesByCommerce]
(
 @CommerceId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Media].[Id], [Media].[Nom], [Media].[Rang], [Media].[Fichier_FileName], [Media].[Fichier_ContentType], [Media].[Fichier_Attributes], [Media].[Fichier_Size], [Media].[Fichier_LastWriteTimeUtc], [Media].[Fichier_LastAccessTimeUtc], [Media].[Fichier_CreationTimeUtc], [Media].[Origine] 
    FROM [Media]
        LEFT OUTER JOIN [Commerce_Publicites_Media_Commerces] ON ([Media].[Id] = [Commerce_Publicites_Media_Commerces].[Id2])
                LEFT OUTER JOIN [Commerce] ON ([Commerce_Publicites_Media_Commerces].[Id] = [Commerce].[Id]) 
    WHERE ([Commerce_Publicites_Media_Commerces].[Id] = @CommerceId)

RETURN
GO

CREATE PROCEDURE [dbo].[Mesure_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Mesure].[Id], [Mesure].[Appartement_Id], [Mesure].[Type], [Mesure].[Date], [Mesure].[Valeur] 
    FROM [Mesure] 
    WHERE ([Mesure].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Mesure_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Mesure].[Id], [Mesure].[Appartement_Id], [Mesure].[Type], [Mesure].[Date], [Mesure].[Valeur] 
    FROM [Mesure] 

RETURN
GO

CREATE PROCEDURE [dbo].[Mesure_LoadByAppartement]
(
 @AppartementId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Mesure].[Id], [Mesure].[Appartement_Id], [Mesure].[Type], [Mesure].[Date], [Mesure].[Valeur] 
    FROM [Mesure] 
    WHERE ([Mesure].[Appartement_Id] = @AppartementId)

RETURN
GO

CREATE PROCEDURE [dbo].[Mesure_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Mesure].[Id], [Mesure].[Appartement_Id], [Mesure].[Type], [Mesure].[Date], [Mesure].[Valeur] 
    FROM [Mesure] 
    WHERE ([Mesure].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Residence_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Residence].[Id], [Residence].[CamelId], [Residence].[Nom] 
    FROM [Residence] 
    WHERE ([Residence].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Residence_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Residence].[Id], [Residence].[CamelId], [Residence].[Nom] 
    FROM [Residence] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Residence].[Nom]' AND @_orderByDirection0 = 0 THEN [Residence].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Residence].[Nom]' AND @_orderByDirection0 = 1 THEN [Residence].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Residence_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Residence].[Id], [Residence].[CamelId], [Residence].[Nom] 
    FROM [Residence] 
    WHERE ([Residence].[Id] = @Id)

RETURN
GO

