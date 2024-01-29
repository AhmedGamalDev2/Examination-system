--Some non-Clustered indexes to help with the Search--
-----This query will create a nonclustered index on the "Exam" table, which will improve the performance of queries that involve searching, filtering, or sorting based on the "Normal_Exam" and "Corrective_Exam" columns. The nonclustered index will store the indexed values of these columns in a separate structure, allowing for faster data retrieval when these columns are involved in queries.
CREATE NONCLUSTERED INDEX S_E
ON [Exam] (Normal_Exam,Corrective_Exam);

