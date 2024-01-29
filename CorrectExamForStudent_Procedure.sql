

-----------------------------------------------------------------------
exec  CorrectExamForStudent 2,2

alter Procedure  CorrectExamForStudent  @std_id INT, @exam_id INT
AS
BEGIN
	 ----- Check if the row exists for the specified Std_ID, Exam_ID, and Question_ID in Students_take_Exam
	IF NOT EXISTS (
				SELECT 1
				FROM Students_take_Exam 
				WHERE Std_ID =  @std_id AND Exam_ID =  @exam_id  
			)
			BEGIN
				-- The row doesn't exist, insert it with a default value
				INSERT INTO Students_take_Exam (Std_ID, Exam_ID, Answer)
				VALUES (@std_id, @exam_id, 0)
			END
    -- Create a temp table to hold the student exam results
    CREATE TABLE #tmpExamResults(
        [Std_ID] [int] NOT NULL,
        [Exam_ID] [int] NOT NULL,
        [Questions_result] [int] NULL,
        --[Std_Answer_Text_Question] [nvarchar](max) NOT NULL,
        [Std_Answer_Choose_Question] [nvarchar](max) NOT NULL,
        --[Std_Answer_True_or_False] [bit] NOT NULL,
        [Questions_Id] [int] NOT NULL
    )
	select * from #tmpExamResults
    -- Insert student exam results into temp table
    INSERT INTO #tmpExamResults (Std_ID, Exam_ID, Questions_Id, Std_Answer_Choose_Question )
    SELECT   Std_ID, Exam_ID, Id, Answer FROM [dbo].[Std_Exam_Quest_Answer]  WHERE Std_ID =@std_id AND Exam_ID =@exam_id
	 


    -- Loop over each row in the temp table
    DECLARE @questionId INT
   -- DECLARE @textAnswer NVARCHAR(MAX)
    DECLARE @chooseAnswer NVARCHAR(max)
    --DECLARE @trueFalseAnswer BIT
   -- DECLARE @correctTextAnswer NVARCHAR(MAX)
    DECLARE @correctChooseAnswer NVARCHAR(max)
    --DECLARE @correctTrueFalseAnswer BIT
    DECLARE @questionsResult INT

    DECLARE examCursor CURSOR FOR 
    SELECT tr.Questions_Id, tr.Std_Answer_Choose_Question
        ,q.[AnswerCorrect] , tr.Questions_result
    FROM #tmpExamResults tr
    INNER JOIN [dbo].[Answer] q ON tr.Questions_Id = q.Id
	select * from #tmpExamResults
    OPEN examCursor
    FETCH NEXT FROM examCursor INTO @questionId,  @chooseAnswer,
       @correctChooseAnswer,   @questionsResult
	   --while loop for cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check if the student's answer matches the model answer for each question
		DECLARE @student_mark INT = 0;
		
		IF (@chooseAnswer LIKE '%' + @correctChooseAnswer + '%' 
		OR @chooseAnswer LIKE '%[^a-zA-Z]'+ @correctChooseAnswer + '[^a-zA-Z]%') -- Use Regex
			SET @student_mark = @student_mark + 10
		------------
	 -- Update the question result by increasing it by student's mark
            SET @questionsResult = @student_mark
			/* UPDATE ste
					SET ste.Answer =ste. Answer + qe.Degree
					FROM Students_take_Exam ste
					INNER JOIN  #tmpExamResults tr ON ste.Std_ID = tr.Std_ID
						AND ste.Exam_ID = tr.Exam_ID
						--AND ste.Questions_Id = tr.Questions_Id
					inner join [dbo].[Std_Exam_Quest_Answer] sq on ste.Std_ID = sq.[Std_ID] and tr.Std_ID =sq.[Std_ID]
					INNER JOIN Question_Exam qe ON sq.Id = qe.QuestionID
					WHERE ste.Std_ID = @std_id AND ste.Exam_ID = @exam_id --and  sq.Id = qe.QuestionID
			*/
             
	UPDATE Students_take_Exam SET Answer = Answer+@questionsResult 
             WHERE Std_ID = @std_id AND Exam_ID = @exam_id  -- AND Questions_Id = @questionId
			 
-------------------------
		 
        FETCH NEXT FROM examCursor INTO @questionId, @chooseAnswer,
            @correctChooseAnswer, @questionsResult
			print @student_mark
			print @questionsResult
    END

    CLOSE examCursor
    DEALLOCATE examCursor
		
    -- Drop the temp table
    DROP TABLE #tmpExamResults
END
GO


select * from  [dbo].[Std_Exam_Quest_Answer]


select * from [dbo].[Students_take_Exam]  