/* =========================================================
   Friendbook / Lavalife Clone - Database Setup Script
   Author: Chris Kalanda
   Description:
   Creates the Members and Messages tables with sample data
   for local testing.
   ========================================================= */

-- Safety: drop child table first
IF OBJECT_ID('dbo.Messages', 'U') IS NOT NULL
    DROP TABLE dbo.Messages;

IF OBJECT_ID('dbo.Members', 'U') IS NOT NULL
    DROP TABLE dbo.Members;
GO

/* =========================================================
   TABLE: Members
   ========================================================= */
CREATE TABLE dbo.Members (
    Id           INT IDENTITY(1,1) PRIMARY KEY,
    Username     NVARCHAR(30)  NOT NULL UNIQUE,
    PasswordHash NVARCHAR(200) NOT NULL,
    Sex          NVARCHAR(10)  NULL,
    AgeGroup     NVARCHAR(20)  NULL,
    GroupName    NVARCHAR(50)  NULL,
    Reason       NVARCHAR(50)  NULL,
    Interests    NVARCHAR(200) NULL,
    City         NVARCHAR(50)  NULL,
    CreatedAt    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

/* =========================================================
   TABLE: Messages
   ========================================================= */
CREATE TABLE dbo.Messages (
    Id      INT IDENTITY(1,1) PRIMARY KEY,
    FromId  INT            NOT NULL,
    ToId    INT            NOT NULL,
    Body    NVARCHAR(1000) NOT NULL,
    SentAt  DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    IsRead  BIT            NOT NULL DEFAULT 0,

    CONSTRAINT FK_Messages_From
        FOREIGN KEY (FromId) REFERENCES dbo.Members(Id),

    CONSTRAINT FK_Messages_To
        FOREIGN KEY (ToId) REFERENCES dbo.Members(Id)
);
GO

/* =========================================================
   INDEXES
   ========================================================= */
CREATE INDEX IX_Members_Search
    ON dbo.Members (Sex, AgeGroup, GroupName, Reason);
GO

CREATE INDEX IX_Messages_Inbox
    ON dbo.Messages (ToId, IsRead, SentAt DESC);
GO

/* =========================================================
   SAMPLE DATA: Members
   Note:
   PasswordHash is stored as plain text in the current app logic.
   In a real application, passwords should be hashed securely.
   ========================================================= */
INSERT INTO dbo.Members
    (Username, PasswordHash, Sex, AgeGroup, GroupName, Reason, Interests, City)
VALUES
    ('chris',   '1234', 'M', '26-35', 'African', 'serious',   'Music, coding, travel',   'Montreal'),
    ('sarah',   '1234', 'F', '18-25', 'Canadian', 'friendship', 'Movies, coffee, art',     'Laval'),
    ('amina',   '1234', 'F', '26-35', 'African', 'serious',   'Reading, fitness, cooking','Longueuil'),
    ('kevin',   '1234', 'M', '36-45', 'Caribbean', 'chat',    'Sports, tech, gaming',     'Brossard');
GO

/* =========================================================
   SAMPLE DATA: Messages
   ========================================================= */
INSERT INTO dbo.Messages
    (FromId, ToId, Body, IsRead)
VALUES
    (1, 2, N'Bonjour Sarah, j’ai bien aimé ton profil.', 1),
    (2, 1, N'Merci Chris 😊 J’aime aussi ton profil.', 0),
    (1, 3, N'Salut Amina, nous avons plusieurs intérêts en commun.', 0),
    (4, 2, N'Hi Sarah, how is your day going?', 0);
GO

/* =========================================================
   QUICK TEST QUERIES
   ========================================================= */
SELECT * FROM dbo.Members;
SELECT * FROM dbo.Messages;
GO