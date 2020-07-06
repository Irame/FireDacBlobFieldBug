USE FDTestDB;

DROP TABLE TestTable;
GO

CREATE TABLE TestTable (Id INT IDENTITY(1,1) PRIMARY KEY, Memo NVARCHAR(max));
GO

INSERT INTO dbo.TestTable (Memo) VALUES
('Test0'), ('Test1'), ('Test2'), ('Test3'), ('Test4'),
('Test5'), ('Test6'), ('Test7'), ('Test8'), ('Test9');
