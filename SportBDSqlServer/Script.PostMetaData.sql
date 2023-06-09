/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET NOCOUNT ON
GO
MERGE INTO [dbo].Roles AS Target
USING (VALUES
    (1,'admin',1,1,1),
    (2,'manager',1,1,0),
    (3,'common_user',1,0,0)
) AS Source (Id, Name, ReadSportEvents, ChangeSportEvents, ChangeUsers)
ON (Target.Id = Source.Id)
WHEN MATCHED THEN
 UPDATE SET
    Name = Source.Name,
    ReadSportEvents = Source.ReadSportEvents,
    ChangeSportEvents = Source.ChangeSportEvents,
    ChangeUsers = Source.ChangeUsers
 WHEN NOT MATCHED BY TARGET THEN
    INSERT(Id, Name,ReadSportEvents,ChangeSportEvents,ChangeUsers)
    VALUES(Source.Id, Source.Name, Source.ReadSportEvents, Source.ChangeSportEvents, Source.ChangeUsers);
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
