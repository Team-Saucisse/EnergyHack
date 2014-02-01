/* CodeFluent Generated . TargetVersion:Sql2008, Sql2012, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_DeleteBatimentAppartement]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_DeleteBatimentAppartement]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_SaveBatimentAppartement]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_SaveBatimentAppartement]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_DeleteChallengeIllustrations]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_DeleteChallengeIllustrations]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_SaveChallengeIllustrations]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_SaveChallengeIllustrations]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_DeleteShopPublicites]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_DeleteShopPublicites]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_SaveShopPublicites]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_SaveShopPublicites]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Shop_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Shop_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Shop_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Shop_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Appartement_LoadAppartementByBatiment]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Appartement_LoadAppartementByBatiment]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[GainEnergyCoin_LoadByAppartement]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GainEnergyCoin_LoadByAppartement]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Illustration_LoadIllustrationsByChallenge]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Illustration_LoadIllustrationsByChallenge]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_LoadPublicitesByShop]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_LoadPublicitesByShop]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Shop_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Shop_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Shop_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Shop_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Shop_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Shop_LoadById]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Shop_LoadByResidence]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Shop_LoadByResidence]
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
DELETE [Batiment_Appartement_Appartement] FROM [Batiment_Appartement_Appartement] 
    WHERE ([Batiment_Appartement_Appartement].[Id2] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
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

CREATE PROCEDURE [dbo].[Appartement_DeleteBatimentAppartement]
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
DELETE [Batiment_Appartement_Appartement] FROM [Batiment_Appartement_Appartement] 
    WHERE (([Batiment_Appartement_Appartement].[Id2] = @Id2) AND ([Batiment_Appartement_Appartement].[Id] = @Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Appartement_Save]
(
 @Id [uniqueidentifier],
 @CamelId [nvarchar] (256) = NULL,
 @Nom [nvarchar] (100) = NULL,
 @Batiment_Id [uniqueidentifier] = NULL
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
 [Appartement].[Batiment_Id] = @Batiment_Id
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
        [Appartement].[Batiment_Id])
    VALUES (
        @Id,
        @CamelId,
        @Nom,
        @Batiment_Id)
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

CREATE PROCEDURE [dbo].[Appartement_SaveBatimentAppartement]
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
SELECT DISTINCT TOP 1 [Batiment_Appartement_Appartement].[Id] 
    FROM [Batiment_Appartement_Appartement] 
    WHERE (([Batiment_Appartement_Appartement].[Id2] = @Id2) AND ([Batiment_Appartement_Appartement].[Id] = @Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Batiment_Appartement_Appartement] (
        [Batiment_Appartement_Appartement].[Id],
        [Batiment_Appartement_Appartement].[Id2])
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
DELETE [Batiment_Appartement_Appartement] FROM [Batiment_Appartement_Appartement] 
    WHERE ([Batiment_Appartement_Appartement].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [Batiment] FROM [Batiment] 
    WHERE ([Batiment].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Batiment_Save]
(
 @Id [uniqueidentifier],
 @CamelId [nvarchar] (256) = NULL,
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
DELETE [Challenge_Illustrations_Illustration] FROM [Challenge_Illustrations_Illustration] 
    WHERE ([Challenge_Illustrations_Illustration].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
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
 @Quantite [int] = NULL
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
 [GainEnergyCoin].[Quantite] = @Quantite
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
        [GainEnergyCoin].[Quantite])
    VALUES (
        @Id,
        @Appartement_Id,
        @Date,
        @Quantite)
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
DELETE [Challenge_Illustrations_Illustration] FROM [Challenge_Illustrations_Illustration] 
    WHERE ([Challenge_Illustrations_Illustration].[Id2] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [Illustration] FROM [Illustration] 
    WHERE ([Illustration].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_DeleteChallengeIllustrations]
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
DELETE [Challenge_Illustrations_Illustration] FROM [Challenge_Illustrations_Illustration] 
    WHERE (([Challenge_Illustrations_Illustration].[Id2] = @Id2) AND ([Challenge_Illustrations_Illustration].[Id] = @Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_Save]
(
 @Id [uniqueidentifier],
 @Nom [nvarchar] (100) = NULL,
 @Contenu [nvarchar] (max) = NULL
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
 [Illustration].[Contenu] = @Contenu
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
        [Illustration].[Contenu])
    VALUES (
        @Id,
        @Nom,
        @Contenu)
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

CREATE PROCEDURE [dbo].[Illustration_SaveChallengeIllustrations]
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
SELECT DISTINCT TOP 1 [Challenge_Illustrations_Illustration].[Id] 
    FROM [Challenge_Illustrations_Illustration] 
    WHERE (([Challenge_Illustrations_Illustration].[Id2] = @Id2) AND ([Challenge_Illustrations_Illustration].[Id] = @Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Challenge_Illustrations_Illustration] (
        [Challenge_Illustrations_Illustration].[Id],
        [Challenge_Illustrations_Illustration].[Id2])
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
DELETE [Shop_Publicites_Media] FROM [Shop_Publicites_Media] 
    WHERE ([Shop_Publicites_Media].[Id2] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [Media] FROM [Media] 
    WHERE ([Media].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Media_DeleteShopPublicites]
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
DELETE [Shop_Publicites_Media] FROM [Shop_Publicites_Media] 
    WHERE (([Shop_Publicites_Media].[Id2] = @Id2) AND ([Shop_Publicites_Media].[Id] = @Id))
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

CREATE PROCEDURE [dbo].[Media_SaveShopPublicites]
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
SELECT DISTINCT TOP 1 [Shop_Publicites_Media].[Id] 
    FROM [Shop_Publicites_Media] 
    WHERE (([Shop_Publicites_Media].[Id2] = @Id2) AND ([Shop_Publicites_Media].[Id] = @Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Shop_Publicites_Media] (
        [Shop_Publicites_Media].[Id],
        [Shop_Publicites_Media].[Id2])
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
UPDATE [Appartement] SET
 [Appartement].[Batiment_Id] = NULL
    WHERE ([Appartement].[Batiment_Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
UPDATE [Shop] SET
 [Shop].[Residence_Id] = NULL
    WHERE ([Shop].[Residence_Id] = @Id)
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
 @CamelId [nvarchar] (256) = NULL,
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

CREATE PROCEDURE [dbo].[Shop_Delete]
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
DELETE [Shop_Publicites_Media] FROM [Shop_Publicites_Media] 
    WHERE ([Shop_Publicites_Media].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [Shop] FROM [Shop] 
    WHERE ([Shop].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Shop_Save]
(
 @Id [uniqueidentifier],
 @Nom [nvarchar] (100) = NULL,
 @Url [nvarchar] (2000) = NULL,
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
UPDATE [Shop] SET
 [Shop].[Nom] = @Nom,
 [Shop].[Url] = @Url,
 [Shop].[Residence_Id] = @Residence_Id
    WHERE ([Shop].[Id] = @Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Shop] (
        [Shop].[Id],
        [Shop].[Nom],
        [Shop].[Url],
        [Shop].[Residence_Id])
    VALUES (
        @Id,
        @Nom,
        @Url,
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

CREATE PROCEDURE [dbo].[Appartement_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id] 
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
SELECT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id] 
    FROM [Appartement] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Appartement].[Nom]' AND @_orderByDirection0 = 0 THEN [Appartement].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Appartement].[Nom]' AND @_orderByDirection0 = 1 THEN [Appartement].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Appartement_LoadAppartementByBatiment]
(
 @BatimentId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id] 
    FROM [Appartement]
        LEFT OUTER JOIN [Batiment_Appartement_Appartement] ON ([Appartement].[Id] = [Batiment_Appartement_Appartement].[Id2])
                LEFT OUTER JOIN [Batiment] ON ([Batiment_Appartement_Appartement].[Id] = [Batiment].[Id]) 
    WHERE ([Batiment_Appartement_Appartement].[Id] = @BatimentId)
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
SELECT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id] 
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
SELECT DISTINCT [Appartement].[Id], [Appartement].[CamelId], [Appartement].[Nom], [Appartement].[Batiment_Id] 
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

CREATE PROCEDURE [dbo].[GainEnergyCoin_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite] 
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
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite] 
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
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite] 
    FROM [GainEnergyCoin] 
    WHERE ([GainEnergyCoin].[Appartement_Id] = @AppartementId)

RETURN
GO

CREATE PROCEDURE [dbo].[GainEnergyCoin_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [GainEnergyCoin].[Id], [GainEnergyCoin].[Appartement_Id], [GainEnergyCoin].[Date], [GainEnergyCoin].[Quantite] 
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
SELECT DISTINCT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu] 
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
SELECT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu] 
    FROM [Illustration] 
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
SELECT DISTINCT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu] 
    FROM [Illustration] 
    WHERE ([Illustration].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Illustration_LoadIllustrationsByChallenge]
(
 @ChallengeId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Illustration].[Id], [Illustration].[Nom], [Illustration].[Contenu] 
    FROM [Illustration]
        LEFT OUTER JOIN [Challenge_Illustrations_Illustration] ON ([Illustration].[Id] = [Challenge_Illustrations_Illustration].[Id2])
                LEFT OUTER JOIN [Challenge] ON ([Challenge_Illustrations_Illustration].[Id] = [Challenge].[Id]) 
    WHERE ([Challenge_Illustrations_Illustration].[Id] = @ChallengeId)
    ORDER BY CASE
        WHEN @_orderBy0 = '[Illustration].[Nom]' AND @_orderByDirection0 = 0 THEN [Illustration].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Illustration].[Nom]' AND @_orderByDirection0 = 1 THEN [Illustration].[Nom]
    END DESC

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

CREATE PROCEDURE [dbo].[Media_LoadPublicitesByShop]
(
 @ShopId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Media].[Id], [Media].[Nom], [Media].[Rang], [Media].[Fichier_FileName], [Media].[Fichier_ContentType], [Media].[Fichier_Attributes], [Media].[Fichier_Size], [Media].[Fichier_LastWriteTimeUtc], [Media].[Fichier_LastAccessTimeUtc], [Media].[Fichier_CreationTimeUtc], [Media].[Origine] 
    FROM [Media]
        LEFT OUTER JOIN [Shop_Publicites_Media] ON ([Media].[Id] = [Shop_Publicites_Media].[Id2])
                LEFT OUTER JOIN [Shop] ON ([Shop_Publicites_Media].[Id] = [Shop].[Id]) 
    WHERE ([Shop_Publicites_Media].[Id] = @ShopId)

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

CREATE PROCEDURE [dbo].[Shop_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Shop].[Id], [Shop].[Nom], [Shop].[Url], [Shop].[Residence_Id] 
    FROM [Shop] 
    WHERE ([Shop].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Shop_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Shop].[Id], [Shop].[Nom], [Shop].[Url], [Shop].[Residence_Id] 
    FROM [Shop] 
    ORDER BY CASE
        WHEN @_orderBy0 = '[Shop].[Nom]' AND @_orderByDirection0 = 0 THEN [Shop].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Shop].[Nom]' AND @_orderByDirection0 = 1 THEN [Shop].[Nom]
    END DESC

RETURN
GO

CREATE PROCEDURE [dbo].[Shop_LoadById]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Shop].[Id], [Shop].[Nom], [Shop].[Url], [Shop].[Residence_Id] 
    FROM [Shop] 
    WHERE ([Shop].[Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Shop_LoadByResidence]
(
 @ResidenceId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT [Shop].[Id], [Shop].[Nom], [Shop].[Url], [Shop].[Residence_Id] 
    FROM [Shop] 
    WHERE ([Shop].[Residence_Id] = @ResidenceId)
    ORDER BY CASE
        WHEN @_orderBy0 = '[Shop].[Nom]' AND @_orderByDirection0 = 0 THEN [Shop].[Nom]
    END ASC,
    CASE
        WHEN @_orderBy0 = '[Shop].[Nom]' AND @_orderByDirection0 = 1 THEN [Shop].[Nom]
    END DESC

RETURN
GO

