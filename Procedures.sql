


use [SQL-Project]
--------Instructor-----------
--sp_InsertInstructor
go
CREATE PROCEDURE sp_InsertInstructor
    @age int,
    @inst_name nvarchar(max),
    @mgr_id int
AS
BEGIN
    INSERT INTO Instructor (Age, Inst_Name, Mgr_ID)
    VALUES (@age, @inst_name, @mgr_id)
END

--test  sp_InsertInstructor
EXEC sp_InsertInstructor @age = 30, @inst_name = ' youssef mansour', @mgr_id = 200


--sp_UpdateInstructor
go
--sp_UpdateInstructor
CREATE PROCEDURE sp_UpdateInstructor
    @ins_id int,
    @age int,
    @inst_name nvarchar(max),
    @mgr_id int
AS
BEGIN
    UPDATE Instructor
    SET Age = @age, Inst_Name = @inst_name, Mgr_ID = @mgr_id
    WHERE Ins_ID = @ins_id
END
--test sp_UpdateInstructor
EXEC sp_UpdateInstructor @ins_id = 200, @age = 35, @inst_name = 'Jane Doe', @mgr_id = 2;

--sp_DeleteInstructor
go
CREATE PROCEDURE sp_DeleteInstructor
    @ins_id int
AS
BEGIN
    DELETE FROM Instructor
    WHERE Ins_ID = @ins_id
END
go
EXEC sp_DeleteInstructor @ins_id = 1

---------Course-------------
--sp_InsertCourse
go
CREATE PROCEDURE sp_InsertCourse
    @min_degree int,
    @max_degree int,
    @name nvarchar(max),
    @description nvarchar(max)
AS
BEGIN
    INSERT INTO Course (Min_Degree, Max_Degree, [Name], [Description])
    VALUES (@min_degree, @max_degree, @name, @description)
END

--test sp_InsertCourse 
EXEC sp_InsertCourse @min_degree = 50, @max_degree = 100, @name = 'Math', @description = 'Introduction to Math'

--sp_UpdateCourse
go
CREATE PROCEDURE sp_UpdateCourse
    @course_id int,
    @min_degree int,
    @max_degree int,
    @name nvarchar(max),
    @description nvarchar(max)
AS
BEGIN
    UPDATE Course
    SET Min_Degree = @min_degree, Max_Degree = @max_degree, Name = @name, Description = @description
    WHERE Course_ID = @course_id
END

--test sp_UpdateCourse
EXEC sp_UpdateCourse @course_id = 1, @min_degree = 60, @max_degree = 120, @name = 'Updated Course', @description = 'Updated course description'

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

--sp_InsertQuestion 
 go
 CREATE PROCEDURE sp_InsertQuestion
    @degree int,
    @text_questions nvarchar(max),
    @correct_answer_text_questions nvarchar(max),
    @true_or_false_questions nvarchar(max),
    @correct_answer_true_or_false bit,
    @choose_an_answer_question nvarchar(max),
    @correct_answer_choose_question nvarchar(1),
    @course_id int
AS
BEGIN
    INSERT INTO [dbo].[Questions] (Degree, Text_Questions, Correct_Answer_Text_Questions, True_or_False_Questions, Correct_Answer_True_or_False, Choose_An_Answer_Question, Correct_Answer_Choose_Question, Course_Id)
    VALUES (@degree, @text_questions, @correct_answer_text_questions, @true_or_false_questions, @correct_answer_true_or_false, @choose_an_answer_question, @correct_answer_choose_question, @course_id)
END

--test sp_InsertQuestion
EXEC sp_InsertQuestion @degree = 10, @text_questions = 'Sample question', @correct_answer_text_questions = 'Sample answer', @true_or_false_questions = 'True', @correct_answer_true_or_false = 'True', @choose_an_answer_question = 'Sample question', @correct_answer_choose_question = 'Sample answer', @course_id = 1

--sp_UpdateQuestion
go
CREATE PROCEDURE sp_UpdateQuestion
    @questions_id int,
    @degree int,
    @text_questions nvarchar(max),
    @correct_answer_text_questions nvarchar(max),
    @true_or_false_questions nvarchar(max),
    @correct_answer_true_or_false bit,
    @choose_an_answer_question nvarchar(max),
    @correct_answer_choose_question nvarchar(1),
    @course_id int
AS
BEGIN
    UPDATE [dbo].[Questions]
    SET Degree = @degree, Text_Questions = @text_questions, Correct_Answer_Text_Questions = @correct_answer_text_questions, True_or_False_Questions = @true_or_false_questions, Correct_Answer_True_or_False = @correct_answer_true_or_false, Choose_An_Answer_Question = @choose_an_answer_question, Correct_Answer_Choose_Question = @correct_answer_choose_question, Course_Id = @course_id
    WHERE Questions_ID = @questions_id
END
--test sp_UpdateQuestion
EXEC sp_UpdateQuestion @questions_id = 1, @degree = 15, @text_questions = 'Updated question', @correct_answer_text_questions = 'Updated answer', @true_or_false_questions = 'False', @correct_answer_true_or_false = 'False', @choose_an_answer_question = 'Updated question', @correct_answer_choose_question = 'Updated answer', @course_id = 2
go
--sp_DeleteQuestion
CREATE PROCEDURE sp_DeleteQuestion
    @questions_id int
AS
BEGIN
    DELETE FROM Questions
    WHERE Questions_ID = @questions_id
END
--test sp_DeleteQuestion
EXEC sp_DeleteQuestion @questions_id = 1
go










------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
use [SQL-Project]
---------Student--------
----sp_InsertStudent
go
CREATE PROCEDURE sp_InsertStudent
    @Std_ID INT,
    @Std_Name NVARCHAR(max),
    @Std_Age INT
AS
BEGIN
    INSERT INTO [SQL-Project].[dbo].[Students] ([Std_ID], [Std_Name], [Std_Age])
    VALUES (@Std_ID, @Std_Name, @Std_Age)
END

-- Execute the Insert stored procedure
EXEC sp_InsertStudent 22, 'samy', 22

---sp_UpdateStudent
go
CREATE PROCEDURE sp_UpdateStudent
    @Std_ID INT,
    @Std_Name NVARCHAR(max),
    @Std_Age INT
AS
BEGIN
    UPDATE [SQL-Project].[dbo].[Students]
    SET [Std_Name] = @Std_Name, [Std_Age] = @Std_Age
    WHERE [Std_ID] = @Std_ID
END

-- Execute the Update stored procedure
EXEC sp_UpdateStudent 22, 'Sandy', 26


---sp_DeleteStudent
go
CREATE PROCEDURE sp_DeleteStudent
    @Std_ID INT
AS
BEGIN
    DELETE FROM [SQL-Project].[dbo].[Students]
    WHERE [Std_ID] = @Std_ID
END
go
-- Execute the Delete stored procedure
EXEC sp_DeleteStudent 22





 
---------------Exam---------------
--sp_InsertExam
go
CREATE PROCEDURE sp_InsertExam
    @Exam_ID INT,
    @Exam_Degree INT,
    @Allowance_Option NVARCHAR(Max),
    @Normal_Exam BIT,
    @Corrective_Exam BIT
AS
BEGIN
    INSERT INTO [SQL-Project].[dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam])
    VALUES (@Exam_ID, @Exam_Degree, @Allowance_Option, @Normal_Exam, @Corrective_Exam)
END
-- Execute the Insert stored procedure
EXEC sp_InsertExam 22, 90.5, 'Option A', 1, 0

--sp_UpdateExam
go
CREATE PROCEDURE sp_UpdateExam
    @Exam_ID INT,
    @Exam_Degree INT,
    @Allowance_Option NVARCHAR(max),
    @Normal_Exam BIT,
    @Corrective_Exam BIT
AS
BEGIN
    UPDATE [SQL-Project].[dbo].[Exam]
    SET [Exam_Degree] = @Exam_Degree, [Allowance_Option] = @Allowance_Option, [Normal_Exam] = @Normal_Exam, [Corrective_Exam] = @Corrective_Exam
    WHERE [Exam_ID] = @Exam_ID
END
-- Execute the Update stored procedure
EXEC sp_UpdateExam 22, 95.0, 'Option B', 0, 1


--sp_DeleteExam
go
CREATE PROCEDURE sp_DeleteExam
    @Exam_ID INT
AS
BEGIN
    DELETE FROM [SQL-Project].[dbo].[Exam]
    WHERE [Exam_ID] = @Exam_ID
END

-- Execute the Delete stored procedure
EXEC sp_DeleteExam 22










