/* CodeFluent Generated . TargetVersion:Sql2008. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Media_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Media_Delete]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Save]
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

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Residence_LoadById]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Residence_LoadById]
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
DELETE [Media] FROM [Media] 
    WHERE ([Media].[Id] = @Id)
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

