SET NOCOUNT ON
GO

MERGE INTO [dbo].Users AS Target
USING (VALUES
    (1,1, 'admin', 'password', 'Иванов Иван Иванович'),
    (2,2, 'manager', 'password', 'Сергеев Сергей Сергеевич'),
    (3,3, 'common_user', 'password', 'Алексеев Алексей Алексеевич')
) AS Source (Id, RoleId , Login , Password , FIO)
ON (Target.Id = Source.Id)
WHEN MATCHED THEN
 UPDATE SET
    RoleId = Source.RoleId,
    Login = Source.Login,
    Password = Source.Password,
    FIO = Source.FIO
 WHEN NOT MATCHED BY TARGET THEN
    INSERT(Id, RoleId , Login , Password , FIO)
    VALUES(Source.Id, Source.RoleId , Source.Login , Source.Password , Source.FIO);
GO

SET NOCOUNT OFF
GO