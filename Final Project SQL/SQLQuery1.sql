 


 
/****** Object:  Database [Project_SQL]    Script Date: 5/25/2023 8:53:00 PM ******/
--CREATE DATABASE [SQL-Project2]
use [SQL-Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQL-Project', FILENAME = N'D:\ITI\SQL\AProject\Project\SQL-Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQL-Project_log', FILENAME = N'D:\ITI\SQL\AProject\Project\SQL-Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
use [SQL-Project]
ALTER DATABASE [SQL-Project] SET COMPATIBILITY_LEVEL = 140
GO 
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQL-Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
--------------------CREATE TABLE Question--------------------------

--Manager table

--foreign key  [dbo].[Course_Branch]      ([Branch_ID]) REFERENCES [dbo].[Branch] ([Branch_ID])
--CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
--FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
------------------------------------
create table Question(
	Id int identity(1,1) primary key,
	Question nvarchar(max) not null,
	choice1 nvarchar(max) not null,
	choice2 nvarchar(max)not null,
	choice3 nvarchar(max) not null
)
--------------------CREATE TABLE Answer--------------------------

create table Answer(
	Id int identity(1,1) primary key,
	AnswerCorrect nvarchar(max) null,
	QuestionId int null 
)

GO
--------------------CREATE TABLE Intake--------------------------
CREATE TABLE [dbo].[Intake](
	[Intake_ID] [int] NOT NULL,
	[Intake_Name] [nvarchar](max)  NOT NULL,
 ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--------------------CREATE TABLE Branch--------------------------
CREATE TABLE [dbo].[Branch](
	[Branch_ID] [int] NOT NULL,
	[Branch_Name] [nvarchar](max)  NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY ( Branch_ID)
 ) 
GO

--------------------CREATE TABLE Course--------------------------
CREATE TABLE [dbo].[Course](
	[Course_ID] [int] NOT NULL,
	[Min_Degree] [int] NOT NULL,
	[Max_Degree] [int] NOT NULL,
	[Name] [nvarchar](max)   NOT NULL,
	[Description] [nvarchar](max)   NULL,

 CONSTRAINT [PK_Course] PRIMARY KEY  ([Course_ID])
 )
GO


--------------------CREATE TABLE Track--------------------------
CREATE TABLE [dbo].[Track](
	[Track_ID] [int] NOT NULL,
	[Track_Name] [nvarchar](max)   NOT NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY  ([Track_ID])
 ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--------------------CREATE TABLE Students--------------------------
CREATE TABLE [dbo].[Students](
	[Std_ID] [int] NOT NULL,
	[Std_Name] [nvarchar](max) NOT NULL,
	[Std_Age] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY  ([Std_ID])
 ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--------------------CREATE TABLE Exam--------------------------

CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] NOT NULL,
	[Exam_Degree] [int] NOT NULL,
	[Allowance_Option] [nvarchar](max)   NULL,
	[Normal_Exam] [bit] NOT NULL,
	[Corrective_Exam] [bit] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY  ([Exam_ID])
 ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--------------------CREATE TABLE Instructor--------------------------
CREATE TABLE [dbo].[Instructor](
	[Ins_ID] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[Inst_Name] [nvarchar](max)   NOT NULL,
	[Mgr_ID] [int] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY  ([Ins_ID])
 ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

------------------------ Table [dbo].[Students_take_Exam]-------------------------

CREATE TABLE [dbo].[Students_take_Exam](
	--Note
	[Std_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	Answer nvarchar(max) not null,
	--[Questions_result] [int] NULL,
	--[Std_Answer_Text_Question] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	--[Std_Answer_Choose_Question] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	--[Std_Answer_True_or_False] [bit] NOT NULL,
	--[Questions_Id] [int] NOT NULL,
 CONSTRAINT [PK_Students_take_Exam] PRIMARY KEY  ([Std_ID],[Exam_ID])

 ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------- Table [Instructor_Teach_Course] ---------------
CREATE TABLE [dbo].[Instructor_Teach_Course](
		--Note => many-to- many
	[Course_ID] [int] NOT NULL,
	[Inst_ID] [int] NOT NULL,
 CONSTRAINT [PK_Instructor_Teach_Course] PRIMARY KEY  ([Course_ID],[Inst_ID])
 ) ON [PRIMARY]
GO
-------------------- Table [Instructor_Choose_Questions] ---------------
CREATE TABLE [dbo].[Instructor_Choose_Questions](
	[Questions_ID] [int] NOT NULL,
	[Instructor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Instructor_Choose_Questions] PRIMARY KEY  ([Questions_ID],[Instructor_ID])
 ) ON [PRIMARY]
GO
-------------------- Table [Instructor_Sets_Exam] ---------------
CREATE TABLE [dbo].[Instructor_Sets_Exam](
		--Note => many to many  OR one to many
	[Exam_ID] [int] NOT NULL,
	[Inst_ID] [int] NOT NULL,
	[Start_Time] [time](7) NOT NULL,
	[End_Time] [time](7) NOT NULL,
	[Year] [date] NOT NULL,
 CONSTRAINT [PK_Instructor_Sets_Exam] PRIMARY KEY  ([Exam_ID])
) ON [PRIMARY]
GO
-------------------- Table [Course_Exams] ---------------
CREATE TABLE [dbo].[Course_Exams]
(	--Note  => many to many  OR one to many
	[Exam_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Exams] PRIMARY KEY  ([Exam_ID],[Course_ID])

 ) ON [PRIMARY]
GO

 -------------------- TABLE [Course_Intake] ---------------
CREATE TABLE [dbo].[Course_Intake]
(  --Note  => many to many  OR one to many
	[Course_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
  CONSTRAINT [PK_Course_Intake] PRIMARY KEY  ([Course_ID],[Intake_ID])
  ) ON [PRIMARY]
 GO

 -------------------- TABLE [Course_Track] ---------------
   CREATE TABLE [dbo].[Course_Track](
	[Course_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Track] PRIMARY KEY  ([Course_ID],[Track_ID])
 ) ON [PRIMARY]
 GO
 -------------------- TABLE [Instructor's_Selected_Students] ---------------
  CREATE TABLE [dbo].[Instructor's_Selected_Students](
	[Std_ID] [int] NOT NULL,
	[Inst_ID] [int] NOT NULL,
	[Exam_Id] [int] NOT NULL,

 CONSTRAINT [PK_Instructor's_Selected_Students] PRIMARY KEY ([Exam_Id],[Inst_ID],[Std_ID]) 
 ) ON [PRIMARY]
 GO


 -------------------- Table [Course_Branch] ---------------
/*
CREATE TABLE [dbo].[Course_Branch](
	[Course_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Branch] PRIMARY KEY  
(
	[Course_ID] ASC,
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO*/
------------------------------------------------------
 
 -------------------- Table [dbo].[Student_Intake] ---------------
 /*
CREATE TABLE [dbo].[Student_Intake](
	[Std_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Intake] PRIMARY KEY  
(
	[Std_ID] ASC,
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO*/
 --------------------  Table [dbo].[Student_Branch] ---------------
 /*
 CREATE TABLE [dbo].[Student_Branch](
	[Std_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Branch] PRIMARY KEY  
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO*/
--------------------  Table [dbo].[Student_Track]  ---------------
/*
CREATE TABLE [dbo].[Student_Track](
	[Std_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Track] PRIMARY KEY  
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
*/











































-----------------------
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (1, N'Cairo')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (2, N'Alexandria')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (3, N'Beni-Suef')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (4, N'Mansoura')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (5, N'Tanta')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (6, N'Qina')
GO
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (1, 10, 60, N'SQL', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (2, 10, 30, N'Java', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (3, 10, 30, N'BootStrap', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (4, 10, 30, N'C#', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (5, 10, 30, N'HTML', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (6, 10, 30, N'CSS', NULL)
GO
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (1, 60, NULL, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (2, 30, NULL, 0, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (3, 20, NULL, 0, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (4, 30, NULL, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (5, 20, NULL, 0, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (6, 30, NULL, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (7, 60, NULL, 1, 0)
GO
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (1, 24, N'Mrihan Mohamed')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (2, 20, N'Sarah')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (3, 25, N'Mohamed Abdelkhalek')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (4, 25, N'Ahmed Gamal')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (5, 19, N'Yuosef Mansour')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (6, 22, N'Nawal')
GO
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (1, N'Programming')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (2, N'2d')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (3, N'Power Bi')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (4, N'Communication Skills')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (5, N'SQL')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (6, N'C#')
GO
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (1, N'Mohamed Abdelkhalek', 17)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (2, N'Ahmed Gamal', 16)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (3, N'Yuosef Mansour', 19)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (4, N'Ali', 20)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (5, N'Shehab', 20)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (6, N'Ziad', 18)
GO
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (1, N'.net')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (2, N'Devops')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (3, N'2D')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (4, N'SW testing')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (5, N'e-learning')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (6, N'GIS')
GO

 Create view [dbo].[Check_Exams] as
 select [dbo].[Intake].[Intake_ID],[dbo].[Intake].[Intake_Name]
 from [dbo].[Intake]
 GO
--------------------  View [dbo].[Student_Info]  ---------------
Create View [dbo].[Student_Info] as
select Students.Std_ID, Std_Name, Std_Age, Exam.[Exam_Degree],[dbo].[Students_take_Exam].Exam_ID,Intake.Intake_ID, Intake_Name,[Student_Branch].[Branch_ID],[Branch_Name], [Track].[Track_ID], [Track_Name]
from Students  join Students_take_Exam 
on Students.Std_ID = Students_take_Exam.Std_ID
join
Student_Intake
on Student_Intake.Std_ID = Students.Std_ID
join
Intake
on  Student_Intake.Intake_ID = Intake.Intake_ID
join
[Student_Branch]
on [Student_Branch].[Std_ID] = [Students].[Std_ID]
join
[dbo].[Branch]
on [Student_Branch].[Branch_ID] = [Branch].[Branch_ID]
join
[dbo].[Student_Track]
on [Student_Track].[Std_ID] = [Students].[Std_ID]
join
[dbo].[Track]
on [Track].[Track_ID] = [Student_Track].[Track_ID]
join
[dbo].[Exam]
on Exam.Exam_ID = [dbo].[Students_take_Exam].[Exam_ID]
GO


-------------------- view [Course_Info] ---------------
Create view [dbo].[Course_Info] as
select  [dbo].[Course].[Course_ID], [dbo].[Course].[Min_Degree],  [dbo].[Course].[Max_Degree], [dbo].[Course].[Name],Course_Exams.Exam_ID, [dbo].[Branch].Branch_ID, [Branch].[Branch_Name]
from [dbo].[Course] join Course_Exams
on [dbo].[Course].Course_ID = Course_Exams.Course_ID
join
[dbo].[Course_Branch]
on [Course_Branch].[Course_ID] = [dbo].[Course].[Course_ID]
join
[dbo].[Branch]
on [Course_Branch].[Branch_ID] = [dbo].[Branch].[Branch_ID]
GO
---------------------------
 INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (1, 1)
 INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (2, 2)
 INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (3, 3)
 INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (4, 1)
 INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (5, 5)
 INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (1, 1)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (2, 2)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (3, 3)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (4, 4)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (5, 5)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (1, 1)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (2, 2)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (3, 3)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (4, 4)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (5, 5)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (1, 1)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (2, 2)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (3, 3)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (4, 4)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (5, 5)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (1, 1, CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(N'2021-02-02' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (2, 2, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'2022-03-03' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (3, 3, CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'2023-04-04' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (4, 4, CAST(N'05:00:00' AS Time), CAST(N'06:00:00' AS Time), CAST(N'2009-08-08' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (5, 5, CAST(N'03:00:00' AS Time), CAST(N'04:00:00' AS Time), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (6, 6, CAST(N'02:00:00' AS Time), CAST(N'03:00:00' AS Time), CAST(N'2006-07-07' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (7, 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2023-04-28' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (9, 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2023-04-28' AS Date))
GO
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (1, 1)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (2, 2)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (3, 3)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (4, 4)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (5, 5)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Instructor's_Selected_Students] ([Std_ID], [Inst_ID], [Exam_Id]) VALUES (1, 1, 1)
INSERT [dbo].[Instructor's_Selected_Students] ([Std_ID], [Inst_ID], [Exam_Id]) VALUES (1, 1, 2)
GO
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (1, 1)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (2, 1)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (3, 2)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (4, 3)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (5, 4)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (6, 5)
GO
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (1, 1)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (2, 2)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (3, 3)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (4, 4)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (5, 5)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (1, 1)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (2, 2)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (3, 3)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (4, 4)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (5, 5)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Students_take_Exam] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 10, N'collection of table', N'b', 1, 1)
INSERT [dbo].[Students_take_Exam] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 20, N'collection of table', N'b', 1, 2)
GO
select * from Students_take_Exam