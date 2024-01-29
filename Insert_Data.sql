
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (1, 24, N'Mrihan Mohamed')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (2, 20, N'Sarah')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (3, 25, N'Mohamed Abdelkhalek')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (4, 25, N'Ahmed Gamal')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (5, 19, N'Yuosef Mansour')
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name]) VALUES (6, 22, N'Nawal')
GO

INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (1, N'.net')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (2, N'Devops')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (3, N'2D')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (4, N'SW testing')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (5, N'e-learning')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (6, N'GIS')
GO

INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (1, N'Mohamed Abdelkhalek', 17)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (2, N'Ahmed Gamal', 16)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (3, N'Yuosef Mansour', 19)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (4, N'Ali', 20)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (5, N'Shehab', 20)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (6, N'Ziad', 18)
GO

INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (1, N'Programming')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (2, N'2d')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (3, N'Power Bi')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (4, N'Communication Skills')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (5, N'SQL')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (6, N'C#')
GO

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


 INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (1, 1)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (2, 2)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (3, 3)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (4, 1)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (5, 5)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (6, 6)
GO