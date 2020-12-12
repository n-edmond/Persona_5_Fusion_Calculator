SELECT * FROM Persona_Data.dbo.Affinity
SELECT * FROM Persona_Data.dbo.Arcana
SELECT * FROM Persona_Data.dbo.Fusion_Map
SELECT * FROM Persona_Data.dbo.Persona
SELECT * FROM Persona_Data.dbo.[Persona Affinity Connect]
SELECT * FROM Persona_Data.dbo.[Persona Skill Connector]
SELECT * FROM Persona_Data.dbo.Resistance
SELECT * FROM Persona_Data.dbo.skills
SELECT * FROM Persona_Data.dbo.Stats

--functions
SELECT * FROM Persona_Data.dbo.Find_Skill ('Arsene')
SELECT * FROM Create_MainTable(DEFAULT)
SELECT * FROM Persona_Data.dbo.Fuse('Arsene') -- duplicates info. fixed in stored procedure

--STORED PROCEDURE
EXEC Persona_Data.dbo.Complete_Fusion_Chart 'Arsene'
EXEC Persona_Data.dbo.Create_Main_Table 'Arsene'



