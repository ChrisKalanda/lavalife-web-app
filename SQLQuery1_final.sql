CREATE TABLE Members(
  Id            INT IDENTITY PRIMARY KEY,
  Username      NVARCHAR(30) NOT NULL UNIQUE,
  PasswordHash  NVARCHAR(200) NOT NULL,
  Sex           NVARCHAR(10)  NULL,
  AgeGroup      NVARCHAR(20)  NULL,
  GroupName     NVARCHAR(50)  NULL,
  Reason        NVARCHAR(50)  NULL,
  Interests     NVARCHAR(200) NULL,
  City          NVARCHAR(50)  NULL,
  CreatedAt     DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE Messages(
  Id       INT IDENTITY PRIMARY KEY,
  FromId   INT NOT NULL,
  ToId     INT NOT NULL,
  Body     NVARCHAR(1000) NOT NULL,
  SentAt   DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  IsRead   BIT NOT NULL DEFAULT 0,
  CONSTRAINT FK_Msg_From FOREIGN KEY(FromId) REFERENCES Members(Id),
  CONSTRAINT FK_Msg_To   FOREIGN KEY(ToId)   REFERENCES Members(Id)
);

CREATE INDEX IX_Members_Search ON Members(Sex, AgeGroup, GroupName, Reason);
CREATE INDEX IX_Messages_Inbox ON Messages(ToId, IsRead, SentAt DESC);