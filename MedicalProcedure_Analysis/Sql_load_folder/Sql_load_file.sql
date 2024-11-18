/*The script creates a dataset called Operations of individual eye operations
from the same day, and a lookup table for eye names (e.g. Left and Right) 
called EyeLookup. The SQL code is also printed at the end of this document.
We would like you to provide answers using SQL to the following questions: 
*/

--LIST OF ANALYSIS
/*
1.	How many completed operations took place for left eye, right eye and both eyes?
2.	What was the most common cancelled procedure?
The final question is open and intended for you to show us what other analyses 
you might start if you were asked to investigate this dataset:
3.	What other analysis would you do?
*/

-- Create table of operations
CREATE TABLE Operations (
  OperationID SERIAL PRIMARY KEY,
  PatientID INT,
  EyeID INT,
  OperationDate DATE,
  ProcedureID INT,
  ProcedureName VARCHAR(100),
  SurgeonID INT,
  SurgeonName VARCHAR(100),
  TouchtimeMinutes INT,
  ComplexityID INT,
  ComplexityName VARCHAR(100),
  TheatreName VARCHAR(100),
  BookingDate DATE,
  PatientAge INT,
  SexID INT,
  SexName VARCHAR(100),
  EthnicityID INT,
  EthnicityName VARCHAR(100),
  IsCompleted INT,
  IsCancelled INT
);

INSERT INTO Operations(PatientID,EyeID,OperationDate,ProcedureID,ProcedureName,SurgeonID
,SurgeonName,TouchtimeMinutes,ComplexityID,ComplexityName,TheatreName,BookingDate,PatientAge
,SexID,SexName,EthnicityID,EthnicityName,IsCompleted,IsCancelled) 
VALUES 
(3911,2,'2024-05-03',3,'Blepharoplasty',12,'M Watson',36,2,'Medium','Theatre 3','2023-12-26',64,1,'Female',5,'Other ethnic group',0,1),
(9761,2,'2024-05-03',2,'Vitrectomy',12,'M Watson',39,2,'Medium','Theatre 1','2024-01-09',74,2,'Male',3,'Mixed or multiple ethnic groups',0,1),
(4076,1,'2024-05-03',1,'Cataract surgey',15,'M Coren',25,1,'Low','Theatre 1','2023-12-20',79,1,'Female',4,'White',0,1),
(6879,1,'2024-05-03',3,'Blepharoplasty',13,'S Phillips',39,3,'High','Theatre 2','2023-12-24',81,1,'Female',4,'White',1,0),
(5634,2,'2024-05-03',3,'Blepharoplasty',12,'M Watson',22,2,'Medium','Theatre 1','2023-12-14',42,2,'Male',5,'Other ethnic group',1,0),
(5034,1,'2024-05-03',2,'Vitrectomy',13,'S Phillips',8,1,'Low','Theatre 2','2023-09-07',41,2,'Male',5,'Other ethnic group',0,1),
(4178,2,'2024-05-03',2,'Vitrectomy',12,'M Watson',33,2,'Medium','Theatre 2','2024-02-05',78,1,'Female',3,'Mixed or multiple ethnic groups',0,1),
(6536,1,'2024-05-03',3,'Blepharoplasty',15,'M Coren',13,1,'Low','Theatre 2','2023-10-10',71,1,'Female',4,'White',1,0),
(8457,1,'2024-05-03',1,'Cataract surgey',12,'M Watson',76,3,'High','Theatre 1','2024-01-09',92,2,'Male',3,'Mixed or multiple ethnic groups',1,0),
(8077,1,'2024-05-03',1,'Cataract surgey',12,'M Watson',12,1,'Low','Theatre 3','2023-11-25',54,2,'Male',2,'Black, Black British, Caribbean or African',1,0),
(5345,1,'2024-05-03',3,'Blepharoplasty',14,'K Ryan',29,2,'Medium','Theatre 1','2023-09-07',72,2,'Male',2,'Black, Black British, Caribbean or African',1,0),
(3251,1,'2024-05-03',1,'Cataract surgey',15,'M Coren',28,2,'Medium','Theatre 3','2023-11-19',64,1,'Female',3,'Mixed or multiple ethnic groups',1,0),
(9596,1,'2024-05-03',3,'Blepharoplasty',15,'M Coren',31,3,'High','Theatre 1','2023-11-09',63,2,'Male',5,'Other ethnic group',1,0),
(7628,2,'2024-05-03',2,'Vitrectomy',15,'M Coren',18,1,'Low','Theatre 1','2023-12-22',72,1,'Female',2,'Black, Black British, Caribbean or African',0,1),
(1421,1,'2024-05-03',1,'Cataract surgey',14,'K Ryan',19,1,'Low','Theatre 3','2023-09-12',74,2,'Male',4,'White',1,0),
(3357,2,'2024-05-03',3,'Blepharoplasty',14,'K Ryan',92,3,'High','Theatre 3','2023-11-22',60,1,'Female',3,'Mixed or multiple ethnic groups',1,0),
(5896,1,'2024-05-03',3,'Blepharoplasty',11,'N Kumar',28,2,'Medium','Theatre 2','2024-02-29',53,1,'Female',5,'Other ethnic group',0,1),
(8340,1,'2024-05-03',3,'Blepharoplasty',11,'N Kumar',24,1,'Low','Theatre 3','2023-12-18',69,1,'Female',2,'Black, Black British, Caribbean or African',0,1),
(7694,2,'2024-05-03',3,'Blepharoplasty',13,'S Phillips',44,2,'Medium','Theatre 3','2023-09-10',56,1,'Female',2,'Black, Black British, Caribbean or African',0,1),
(4007,1,'2024-05-03',3,'Blepharoplasty',11,'N Kumar',12,1,'Low','Theatre 2','2024-05-01',78,2,'Male',3,'Mixed or multiple ethnic groups',0,1),
(1077,1,'2024-05-03',2,'Vitrectomy',11,'N Kumar',8,1,'Low','Theatre 2','2024-01-20',58,2,'Male',4,'White',0,1),
(3911,1,'2024-05-03',3,'Blepharoplasty',12,'M Watson',36,2,'Medium','Theatre 3','2023-12-26',64,1,'Female',5,'Other ethnic group',0,1),
(9761,1,'2024-05-03',2,'Vitrectomy',12,'M Watson',39,2,'Medium','Theatre 1','2024-01-09',74,2,'Male',3,'Mixed or multiple ethnic groups',0,1),
(4076,2,'2024-05-03',1,'Cataract surgey',15,'M Coren',25,1,'Low','Theatre 1','2023-12-20',79,1,'Female',4,'White',0,1),
(6879,2,'2024-05-03',3,'Blepharoplasty',13,'S Phillips',39,3,'High','Theatre 2','2023-12-24',81,1,'Female',4,'White',1,0),
(5634,1,'2024-05-03',3,'Blepharoplasty',12,'M Watson',22,2,'Medium','Theatre 1','2023-12-14',42,2,'Male',5,'Other ethnic group',1,0)
;

-- Create eye lookup table
CREATE TABLE EyeLookup (
  EyeID INT PRIMARY KEY,
  EyeName VARCHAR(10)
);

INSERT INTO EyeLookup(EyeID, EyeName)
VALUES
(1, 'Left'),
(2, 'Right');



SELECT *
FROM operations;