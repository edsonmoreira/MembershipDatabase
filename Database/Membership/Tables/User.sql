﻿CREATE TABLE [Membership].[User] (
    [UserID]                                  INT            IDENTITY (1000, 1) NOT NULL,
    [UserName]                                [dbo].[Name]   NOT NULL,
    [DisplayName]                             [dbo].[Name]   NULL,
    [Email]                                   [dbo].[Email]  NOT NULL,
    [EmailHash]                               AS             (lower(CONVERT([varchar](32),hashbytes('MD5',CONVERT([varchar],lower(rtrim(ltrim([Email]))),(0))),(2)))) PERSISTED,
    [PasswordHash]                            VARBINARY (24) NULL,
    [PasswordSalt]                            VARBINARY (24) NULL,
    [PasswordQuestion]                        NVARCHAR (256) NULL,
    [PasswordAnswer]                          NVARCHAR (128) NULL,
    [IsApproved]                              BIT            NOT NULL,
    [IsLockedOut]                             BIT            NOT NULL,
    [CreatedDate]                             DATETIME       CONSTRAINT [DF_User_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [LastLoginDate]                           DATETIME       NOT NULL,
    [LastActivityDate]                        DATETIME       NOT NULL,
    [LastPasswordChangedDate]                 DATETIME       NULL,
    [LastLockoutDate]                         DATETIME       NULL,
    [FailedPasswordAttemptCount]              INT            NOT NULL,
    [FailedPasswordAttemptWindowStart]        DATETIME       NULL,
    [FailedPasswordAnswerAttemptCount]        INT            NOT NULL,
    [FailedPasswordAnswerAttemptWindowsStart] DATETIME       NULL,
    [Comment]                                 NVARCHAR (256) NULL,
    CONSTRAINT [PK_User_UserID] PRIMARY KEY CLUSTERED ([UserID] ASC),
    CONSTRAINT [UK_User_UserName] UNIQUE NONCLUSTERED ([UserName] ASC)
);