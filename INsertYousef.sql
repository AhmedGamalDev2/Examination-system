use [SQL-Project]

----------------sp-Course-------------------------
go
CREATE PROCEDURE sp_InsertCourse
    @min_degree int,
    @max_degree int,
    @name nvarchar(max),
    @description nvarchar(max),
    @intake_id int,
    @branch_id int,
    @ins_id int
AS
BEGIN
    INSERT INTO Course (Min_Degree, Max_Degree, [Name],[Description], Intake_ID, Branch_ID, Ins_ID)
    VALUES (@min_degree, @max_degree, @name, @description,@intake_id, @branch_id, @ins_id)
END
--test sp_InsertCourse
EXEC sp_InsertCourse @min_degree = 50, @max_degree = 100, @name = 'Math', @description = 'Introduction to Math', @intake_id = 1, @branch_id = 1, @ins_id = 1


--sp_UpdateCourse
go
CREATE PROCEDURE sp_UpdateCourse
    @course_id int,
    @min_degree int,
    @max_degree int,
    @name nvarchar(max),
    @description nvarchar(max),
    @intake_id int,
    @branch_id int,
    @ins_id int
AS
BEGIN
    UPDATE Course
    SET Min_Degree = @min_degree, Max_Degree = @max_degree,[Name]= @name,[Description]= @description, Intake_ID = @intake_id, Branch_ID = @branch_id, Ins_ID = @ins_id
    WHERE Course_ID = @course_id
END
--test sp_UpdateCourse
EXEC sp_UpdateCourse @course_id = 1, @min_degree = 60, @max_degree = 120, @name = 'Updated Course', @description = 'Updated course description', @intake_id = 2, @branch_id = 2, @ins_id = 2

--sp_DeleteCourse
go
CREATE PROCEDURE sp_DeleteCourse
    @course_id int
AS
BEGIN
    DELETE FROM Course
    WHERE Course_ID = @course_id
END
--test sp_DeleteCourse
EXEC sp_DeleteCourse @course_id = 1


-------------------sp-Exam-----------------

--sp_InsertExam
go  
alter PROCEDURE sp_InsertExam  -------Updated by ahmed
	 @Ins_ID  int,
	@exam_id int,
    @exam_degree int,
    @allowance_option nvarchar(max),
    @normal_exam bit,
    @corrective_exam bit
AS
BEGIN
	if exists( select top(1)  [Ins_ID] from [dbo].[Instructor]   where  [Ins_ID]=@Ins_ID )
		begin
			INSERT INTO Exam (Exam_ID,Exam_Degree, Allowance_Option, Normal_Exam, Corrective_Exam)
			VALUES (@exam_id,@exam_degree, @allowance_option, @normal_exam, @corrective_exam)
		 end
END
--test sp_InsertExam
EXEC sp_InsertExam  @Ins_ID=10, @exam_id=8, @exam_degree = 80, @allowance_option = 'Yes', @normal_exam = 'True', @corrective_exam = 'False'

---sp_UpdateExam
go
CREATE PROCEDURE sp_UpdateExam
	@Ins_ID int,
    @exam_id int,
   @exam_degree int,
    @allowance_option nvarchar(max),
    @normal_exam bit,
    @corrective_exam bit
AS
BEGIN
	if exists( select top(1)  [Ins_ID] from [dbo].[Instructor]   where  [Ins_ID]=@Ins_ID )
		begin
		  UPDATE Exam
				SET Exam_Degree = @exam_degree, Allowance_Option = @allowance_option, Normal_Exam = @normal_exam, Corrective_Exam = @corrective_exam
				WHERE Exam_ID = @exam_id
		end
END
--test sp_UpdateExam
EXEC sp_UpdateExam @Ins_ID=2, @exam_id = 1, @exam_degree = 70, @allowance_option = 'No', @normal_exam = 'False', @corrective_exam = 'True'


go
CREATE PROCEDURE sp_DeleteExam
	@Ins_ID int,
    @exam_id int
AS
BEGIN
	if exists( select top(1)  [Ins_ID] from [dbo].[Instructor]   where  [Ins_ID]=@Ins_ID )
		begin
			DELETE FROM Exam
			WHERE Exam_ID = @exam_id
		end
END
exec sp_DeleteExam @Ins_ID=2, @exam_id = 22
----------------------sp_Instructor----------------
go
--sp_InsertInstructor
CREATE PROCEDURE sp_InsertInstructor
    @Ins_ID int,
    @age int,
    @inst_name varchar(max),
    @mgr_id int,
    @manage_id int
AS
BEGIN
    INSERT INTO Instructor (Ins_ID,Age, Inst_Name, Mgr_ID, Manage_ID)
    VALUES (@Ins_ID,@age, @inst_name, @mgr_id, @manage_id)
END
---test sp_InsertInstructor
EXEC sp_InsertInstructor @Ins_ID=2, @age = 40, @inst_name = 'Ai', @mgr_id = 2, @manage_id = 2

--sp_UpdateInstructor
go
CREATE PROCEDURE sp_UpdateInstructor
    @ins_id int,
    @age int,
    @inst_name nvarchar(max),
    @mgr_id int,
    @manage_id int
AS
BEGIN
    UPDATE Instructor
    SET Age = @age, Inst_Name = @inst_name, Mgr_ID = @mgr_id, Manage_ID = @manage_id
    WHERE Ins_ID = @ins_id
END
--test sp_UpdateInstructor
EXEC sp_UpdateInstructor @Ins_ID = 22, @Age = 40, @Inst_Name = 'Updated Instructor', @Mgr_ID = 2, @Manage_ID = 3

--sp_DeleteInstructor
go
CREATE PROCEDURE sp_DeleteInstructor
    @ins_id int
AS
BEGIN
    DELETE FROM Instructor
    WHERE Ins_ID = @ins_id
END
--test sp_DeleteInstructor
exec sp_DeleteInstructor @ins_id = 22



----------------------sp_Question--------------
--sp_InsertQuestion
go
CREATE PROCEDURE sp_InsertQuestion
    @question_id int,
    @question nvarchar(max),
    @choice1 nvarchar(max),
    @choice2 nvarchar(max),
    @choice3 nvarchar(max),
    @course_id int,
    
    @ins_id int
AS
BEGIN
    INSERT INTO Question (Id,Question, Choice1, Choice2, Choice3, Course_ID,  Ins_ID)
    VALUES (@question_id,@question, @choice1, @choice2, @choice3, @course_id,  @ins_id)
END
--test  sp_InsertQuestion
EXEC sp_InsertQuestion @question_id=22 ,@question = 'What is your name?', @choice1 = 'John', @choice2 = 'Jane', @choice3 = 'Mike', @course_id = 1,  @ins_id = 1

--sp_UpdateQuestion
go
CREATE PROCEDURE sp_UpdateQuestion
    @question_id int,
    @question nvarchar(max),
    @choice1 nvarchar(max),
    @choice2 nvarchar(max),
    @choice3 nvarchar(max),
    @course_id int,
  
    @ins_id int
AS
BEGIN
    UPDATE Question
    SET Question = @question, Choice1 = @choice1, Choice2 = @choice2, Choice3 = @choice3, Course_ID = @course_id, Ins_ID = @ins_id
    WHERE Id = @question_id
END
--test sp_UpdateQuestion
EXEC sp_UpdateQuestion @question_id = 1, @question = 'What is your age?', @choice1 = '20', @choice2 = '30', @choice3 = '40', @course_id = 1, @ins_id = 1

--sp_DeleteQuestion
go
CREATE PROCEDURE sp_DeleteQuestion
    @question_id int
AS
BEGIN
    DELETE FROM Question
    WHERE Id = @question_id
END

--test sp_DeleteQuestion 
EXEC sp_DeleteQuestion @question_id = 1


----------------------sp_Student-----------
--sp_InsertStudent
go
CREATE PROCEDURE sp_InsertStudents
    @std_id int ,
    @std_name nvarchar(max),
    @std_age int,
    @intake_id int,
    @branch_id int,
    @ins_id int
AS
BEGIN
    INSERT INTO Students (Std_ID,Std_Name, Std_Age, Intake_ID, Branch_ID, Ins_ID)
    VALUES (@std_id,@std_name, @std_age, @intake_id, @branch_id, @ins_id)
END
--test sp_InsertStudents
EXEC sp_InsertStudents @std_id=22 , @std_name = 'John cena', @std_age = 20, @intake_id = 1, @branch_id = 1, @ins_id = 1

---sp_UpdateStudents
go
CREATE PROCEDURE sp_UpdateStudents
    @std_id int,
    @std_name nvarchar(max),
    @std_age int,
    @intake_id int,
    @branch_id int,
    @ins_id int
AS
BEGIN
    UPDATE Students
    SET Std_Name = @std_name, Std_Age = @std_age, Intake_ID = @intake_id, Branch_ID = @branch_id, Ins_ID = @ins_id
    WHERE Std_ID = @std_id
END

EXEC sp_UpdateStudents @std_id = 22, @std_name = 'Updated Student', @std_age = 25, @intake_id = 2, @branch_id = 2, @ins_id = 2



--sp_DeleteStudents
go
CREATE PROCEDURE sp_DeleteStudents
    @std_id int
AS
BEGIN
    DELETE FROM Students
    WHERE Std_ID = @std_id
END
EXEC sp_DeleteStudents @std_id = 22