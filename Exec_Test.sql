-- Testing constraint Instructor does not teach course
EXEC GenerateRandomExam @crs_id = 1, @ins_id = 5,
@exam_degree = 50, @is_normal_exam = 1,
@is_corrective_exam = 0, 
@start_time = '10:00:00', @end_time = '12:00:00';


-- Testing constraint Exam degree not multiple of 50
EXEC GenerateRandomExam @crs_id = 1, @ins_id = 1,
@exam_degree = 20, @is_normal_exam = 1,
@is_corrective_exam = 0, 
@start_time = '10:00:00', @end_time = '12:00:00';


-- Testing that it is working
EXEC GenerateRandomExam @crs_id = 1, @ins_id = 1,
@exam_degree = 50, @is_normal_exam = 1,
@is_corrective_exam = 0, 
@start_time = '10:00:00', @end_time = '12:00:00';
  


  select * from [dbo].[Exam]

  select * from  [dbo].[Instructor_Sets_Exam]

  select * from  [dbo].[Question_Exam]


  --- student Answer
EXEC StudentAnswerExamQuestion 2, 1, 2, 'a'

  select * from [dbo].[Std_Exam_Quest_Answer]  



  -----CorrectExamForStudent ------------
exec  CorrectExamForStudent 2,2

 select * from   [dbo].[Students_take_Exam]



 --- view for Student_Info
 SELECT * FROM Student_Info -- Check student information


 --- view for Instructor_Info
 select * from Instructor_Info


 ----View for Course_info
 select * from Course_Info









