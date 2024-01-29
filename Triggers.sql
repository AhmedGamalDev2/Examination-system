


--Trigger on table branch
Create trigger PreventDeleteBranch
on [dbo].[Branch]  instead of delete
	as 
		begin
			print 'You can not delete from this table'	
		end
 ----- test------------
delete from [dbo].[Branch] 
	where [Branch_ID]=1

 ---------------------------------------------------
 
--Trigger on table branch
Create trigger PreventDeleteIntake 
on [dbo].[Intake]    instead of delete
	as 
		begin
			print 'You can not delete from this table'	
		end
 ----- test------------
delete from [dbo].[Intake]  
	where[Intake_ID]=1
 ---------------------------------------------------

create trigger [dbo].[Check_Max_Degree]

ON [dbo].[Course]
after insert
as
begin

   IF EXISTS (SELECT 1 FROM inserted WHERE Max_Degree > 30)
   begin
      raiserror ('Value must be 30 or lower', 16, 1)
      rollback transaction
      return
   end
end;
GO
ALTER TABLE [dbo].[Course] ENABLE TRIGGER [Check_Max_Degree]
GO 

select * from   [dbo].[Check_Max_Degree]

insert into [Course](Max_Degree)  values(40)

