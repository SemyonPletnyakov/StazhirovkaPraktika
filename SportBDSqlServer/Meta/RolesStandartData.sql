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


SET NOCOUNT OFF
GO