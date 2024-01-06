-- ****************************STORED PROCEDURES FOR THE Users TABLE****************************
-- =============================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoUsers @user_name NVARCHAR(20), @user_fname NVARCHAR(20), @user_lname NVARCHAR(20),
                                    @user_email NVARCHAR(50), @user_password NVARCHAR(50), @role_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Users (user_name, user_fname, user_lname, email_address, password, role_id)
    VALUES (@user_name, @user_fname, @user_lname, @user_email, @user_password, @role_id)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- UPDATE STATEMENT
CREATE PROCEDURE st_updateUsers @user_id INT, @user_fname NVARCHAR(20), @user_lname NVARCHAR(20),
                                @user_email NVARCHAR(50), @user_password NVARCHAR(50)
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Users
    SET user_fname    = @user_fname,
        user_lname    = @user_lname,
        email_address = @user_email,
        password      = @user_password
    WHERE user_id = @user_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromUsers @user_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Users
    WHERE user_id = @user_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- ****************************STORED PROCEDURES FOR THE Role TABLE****************************
-- ============================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoRole @role_name NVARCHAR(20), @role_desc NVARCHAR(50)
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Role (role_name, role_desc)
    VALUES (@role_name, @role_desc)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- UPDATE STATEMENT
CREATE PROCEDURE st_updateRole @role_id INT, @role_name NVARCHAR(20), @role_desc NVARCHAR(50)
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Role
    SET role_name = @role_name,
        role_desc = @role_desc
    WHERE role_id = @role_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromRole @role_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Role
    WHERE role_id = @role_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- ****************************STORED PROCEDURES FOR THE Consists_of TABLE****************************
-- ===================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoConsistsOf @question_id INT, @choice_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Consists_of (qs_id, ch_id)
    VALUES (@question_id, @choice_id)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- UPDATE STATEMENT
CREATE PROCEDURE st_updateConsistsOf @question_id INT, @old_choice_id INT, @choice_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Consists_of
    SET ch_id = @choice_id
    WHERE qs_id = @question_id
      AND ch_id = @old_choice_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromConsistsOf @question_id INT, @choice_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Consists_of
    WHERE qs_id = @question_id
      AND ch_id = @choice_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- ****************************STORED PROCEDURES FOR THE Course TABLE****************************
-- ==============================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoCourse @course_name NVARCHAR(50), @course_duration INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Course (crs_name, crs_duration)
    VALUES (@course_name, @course_duration)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- UPDATE STATEMENT
CREATE PROCEDURE st_updateCourse @course_id INT, @course_name NVARCHAR(50), @course_duration INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Course
    SET crs_name     = @course_name,
        crs_duration = @course_duration
    WHERE crs_id = @course_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromCourse @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Course
    WHERE crs_id = @course_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- ****************************STORED PROCEDURES FOR THE Department TABLE****************************
-- ==================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoDepartment @department_name NVARCHAR(50), @department_desc NVARCHAR(50),
                                         @department_location NVARCHAR(30), @department_mgr_id INT,
                                         @manager_hire_date DATE
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Department (dept_name, dept_desc, dept_location, dept_mgr_id, mgr_hire_date)
    VALUES (@department_name, @department_desc, @department_location, @department_mgr_id, @manager_hire_date);
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- UPDATE STATEMENT
CREATE PROCEDURE st_updateDepartment @department_id INT, @department_name NVARCHAR(50), @department_desc NVARCHAR(50),
                                     @department_location NVARCHAR(30), @department_mgr_id INT,
                                     @manager_hire_date DATE
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Department
    SET dept_name     = @department_name,
        dept_desc     = @department_desc,
        dept_location = @department_location,
        dept_mgr_id   = @department_mgr_id,
        mgr_hire_date = @manager_hire_date
    WHERE dept_id = @department_id;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromDepartment @department_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Department
    WHERE dept_id = @department_id;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- ****************************STORED PROCEDURES FOR THE Exam TABLE****************************
-- ============================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoExam @exam_name NVARCHAR(50), @exam_final_grade DECIMAL(5, 2), @student_id INT,
                                   @exam_id INT OUT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Exam (ex_name, ex_final_grade, st_id)
    VALUES (@exam_name, @exam_final_grade, @student_id);

    SELECT TOP 1 @exam_id = ex_id FROM Exam ORDER BY ex_id DESC;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- UPDATE STATEMENT
CREATE PROCEDURE st_updateExam @exam_id INT, @exam_name NVARCHAR(50), @exam_final_grade DECIMAL(5, 2), @student_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Exam
    SET ex_name        = @exam_name,
        ex_final_grade = @exam_final_grade,
        st_id          = @student_id
    WHERE ex_id = @exam_id;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromExam @exam_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Exam
    WHERE ex_id = @exam_id;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- ****************************STORED PROCEDURES FOR THE Includes TABLE****************************
-- ================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoIncludes @exam_id INT, @question_id INT, @student_answer NCHAR(1)
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Includes (ex_id, qs_id, st_answer)
    VALUES (@exam_id, @question_id, @student_answer)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- UPDATE STATEMENT
CREATE PROCEDURE st_updateIncludes @exam_id INT, @question_id INT, @student_answer NCHAR(1)
AS
    SET NOCOUNT ON;

    IF ((SELECT st_answer
         FROM Includes
         WHERE ex_id = @exam_id
           AND qs_id = @question_id) IS NULL)
        BEGIN
            BEGIN TRY
                UPDATE Includes
                SET st_answer = @student_answer
                WHERE ex_id = @exam_id
                  AND qs_id = @question_id
            END TRY
            BEGIN CATCH
                SELECT ERROR_NUMBER()    AS ErrorNumber,
                       ERROR_MESSAGE()   AS ErrorMessage,
                       ERROR_PROCEDURE() AS ErrorProcedure,
                       ERROR_LINE()      AS ErrorLine
            END CATCH
        END
GO



-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromIncludes @exam_id INT, @question_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Includes
    WHERE ex_id = @exam_id
      AND qs_id = @question_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO

-- ****************************STORED PROCEDURES FOR THE Instructor TABLE****************************
-- ==================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoInstructor @instructor_id INT, @instructor_degree NVARCHAR(20), @instructor_salary MONEY
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Instructor (ins_id, ins_degree, ins_salary)
    VALUES (@instructor_id, @instructor_degree, @instructor_salary)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- UPDATE STATEMENT
CREATE PROCEDURE st_updateInstructor @instructor_id INT, @instructor_degree NVARCHAR(20), @instructor_salary MONEY
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE dbo.Instructor
    SET ins_degree = @instructor_degree,
        ins_salary = @instructor_salary
    WHERE ins_id = @instructor_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromInstructor @instructor_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    BEGIN TRANSACTION
        IF (@instructor_id IN (SELECT dept_mgr_id FROM Department))
            BEGIN
                DECLARE @department_id INT

                SELECT @department_id = dept_id
                FROM Department d
                    INNER JOIN Instructor i
                        ON i.ins_id = d.dept_mgr_id
                WHERE i.ins_id = @instructor_id

                UPDATE Department
                SET dept_mgr_id   = NULL,
                    mgr_hire_date = NULL
                WHERE dept_id = @department_id
            END

        DELETE
        FROM Instructor
        WHERE ins_id = @instructor_id
    COMMIT TRANSACTION

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- ****************************STORED PROCEDURES FOR THE Multiple_choices TABLE****************************
-- ========================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoMultipleChoices @choice_title NCHAR(10)
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Multiple_choices (ch_title)
    VALUES (@choice_title)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- UPDATE STATEMENT
CREATE PROCEDURE st_updateMultipleChoices @choice_id INT, @choice_title NCHAR(10)
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Multiple_choices
    SET ch_title = @choice_title
    WHERE ch_id = @choice_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO

-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromMultipleChoices @choice_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Multiple_choices
    WHERE ch_id = @choice_id
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- ****************************STORED PROCEDURES FOR THE Question TABLE****************************
-- ================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoQuestion @question_title NVARCHAR(100), @question_type NVARCHAR(20),
                                       @question_difficulty NVARCHAR(20), @question_grade DECIMAL(4, 2),
                                       @m_answer NCHAR(1), @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Question (qs_title, qs_type, qs_difficulty, qs_grade, model_answer, crs_id)
    VALUES (@question_title, @question_type, @question_difficulty, @question_grade, @m_answer, @course_id)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- UPDATE STATEMENT
CREATE PROCEDURE st_updateQuestion @question_id INT, @question_title NVARCHAR(100), @question_type NVARCHAR(20),
                                   @question_difficulty NVARCHAR(20), @question_grade DECIMAL(4, 2), @m_answer NCHAR(1),
                                   @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Question
    SET qs_title      = @question_title,
        qs_type       = @question_type,
        qs_difficulty = @question_difficulty,
        qs_grade      = @question_grade,
        model_answer  = @m_answer,
        crs_id        = @course_id
    WHERE qs_id = @question_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromQuestion @question_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Question
    WHERE qs_id = @question_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- ****************************STORED PROCEDURES FOR THE Student TABLE****************************
-- ================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoStudent @student_id INT, @st_address NVARCHAR(50), @department_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Student (st_id, st_address, dept_id)
    VALUES (@student_id, @st_address, @department_id)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- UPDATE STATEMENT
CREATE PROCEDURE st_updateStudent @student_id INT, @st_address NVARCHAR(50), @department_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Student
    SET st_address = @st_address,
        dept_id    = @department_id
    WHERE st_id = @student_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromStudent @student_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Student
    WHERE st_id = @student_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- ****************************STORED PROCEDURES FOR THE Studies TABLE****************************
-- ===============================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoStudies @student_id INT, @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Studies (st_id, crs_id)
    VALUES (@student_id, @course_id)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- UPDATE STATEMENT
CREATE PROCEDURE st_updateStudies @student_id INT, @old_course_id INT, @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Studies
    SET crs_id = @course_id
    WHERE st_id = @student_id
      AND crs_id = @old_course_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromStudies @student_id INT, @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Studies
    WHERE st_id = @student_id
      AND crs_id = @course_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO

-- ****************************STORED PROCEDURES FOR THE Teaches TABLE****************************
-- ===============================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoTeaches @instructor_id INT, @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Teaches(ins_id, crs_id)
    VALUES (@instructor_id, @course_id)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- UPDATE STATEMENT
CREATE PROCEDURE st_updateTeaches @instructor_id INT, @old_course_id INT, @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Teaches
    SET crs_id = @course_id
    WHERE ins_id = @instructor_id
      AND crs_id = @old_course_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromTeaches @instructor_id INT, @course_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Teaches
    WHERE ins_id = @instructor_id
      AND crs_id = @course_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO

-- ****************************STORED PROCEDURES FOR THE Works_in TABLE****************************
-- ================================================================================================
-- INSERT STATEMENT
CREATE PROCEDURE st_insertIntoWorksIn @instructor_id INT, @department_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    INSERT INTO Works_in(ins_id, dept_id)
    VALUES (@instructor_id, @department_id)
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO



-- UPDATE STATEMENT
CREATE PROCEDURE st_updateWorksIn @instructor_id INT, @old_department_id INT, @department_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    UPDATE Works_in
    SET dept_id = @department_id
    WHERE ins_id = @instructor_id
      AND dept_id = @old_department_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- DELETE STATEMENT
CREATE PROCEDURE st_deleteFromWorksIn @instructor_id INT, @department_id INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    DELETE
    FROM Works_in
    WHERE ins_id = @instructor_id
      AND dept_id = @department_id

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO


-- ****************************STORED PROCEDURE FOR EXAM GENERATION****************************
-- ============================================================================================
CREATE PROCEDURE st_generateExam @course_name NVARCHAR(50), @true_false_questions_count INT, @other_questions_count INT
AS
    SET NOCOUNT ON;

BEGIN TRY
    BEGIN TRANSACTION
        DECLARE @tf_table_count INT, @other_table_count INT, @exam_id INT, @course_id INT, @question_id INT, @count INT;

        SELECT @course_id = crs_id FROM Course WHERE crs_name = @course_name;

        EXECUTE st_insertIntoExam @course_name, NULL, NULL, @exam_id OUT;

        DECLARE @summary_true_false TABLE
                                    (
                                        Row#          INT,
                                        qs_id         INT,
                                        qs_title      NVARCHAR(100),
                                        qs_type       NVARCHAR(20),
                                        qs_difficulty NVARCHAR(20),
                                        qs_grade      DECIMAL(4, 2),
                                        model_answer  NCHAR(1),
                                        crs_id        INT
                                    )
        DECLARE @summary_other TABLE
                               (
                                   Row#          INT,
                                   qs_id         INT,
                                   qs_title      NVARCHAR(100),
                                   qs_type       NVARCHAR(20),
                                   qs_difficulty NVARCHAR(20),
                                   qs_grade      DECIMAL(4, 2),
                                   model_answer  NCHAR(1),
                                   crs_id        INT
                               )
        DECLARE @summary_final TABLE
                               (
                                   qs_id         INT,
                                   qs_title      NVARCHAR(100),
                                   qs_type       NVARCHAR(20),
                                   qs_difficulty NVARCHAR(20),
                                   qs_grade      DECIMAL(4, 2),
                                   model_answer  NCHAR(1),
                                   crs_id        INT
                               )

        INSERT INTO @summary_true_false
        SELECT ROW_NUMBER() OVER (ORDER BY qs_id) AS "Row#",
               q.*
        FROM Question q
            INNER JOIN Course c
                ON q.crs_id = c.crs_id
        WHERE c.crs_name = @course_name
          AND q.qs_type = 'T/F';

        SELECT @tf_table_count = MAX(Row#) FROM @summary_true_false;
        SET @count = 1;

        WHILE @count <= @true_false_questions_count
            BEGIN
                SELECT @question_id = qs_id
                FROM @summary_true_false
                WHERE Row# = FLOOR(RAND() * (@tf_table_count - 1 + 1)) + 1;

                IF @question_id NOT IN (SELECT qs_id FROM Includes WHERE ex_id = @exam_id)
                    BEGIN
                        EXECUTE st_insertIntoIncludes @exam_id, @question_id, NULL;

                        INSERT INTO @summary_final
                        SELECT *
                        FROM Question
                        WHERE qs_id = @question_id;

                        SET @count += 1;
                    END
            END

        INSERT INTO @summary_other
        SELECT ROW_NUMBER() OVER (ORDER BY qs_id) AS "Row#",
               q.*
        FROM Question q
            INNER JOIN Course c
                ON q.crs_id = c.crs_id
        WHERE c.crs_name = @course_name
          AND q.qs_type = 'other';

        SELECT @other_table_count = MAX(Row#) FROM @summary_other;
        SET @count = 1;

        WHILE @count <= @other_questions_count
            BEGIN
                SELECT @question_id = qs_id
                FROM @summary_other
                WHERE Row# = FLOOR(RAND() * (@other_table_count - 1 + 1)) + 1;

                IF @question_id NOT IN (SELECT qs_id FROM Includes WHERE ex_id = @exam_id)
                    BEGIN
                        EXECUTE st_insertIntoIncludes @exam_id, @question_id, NULL;

                        INSERT INTO @summary_final
                        SELECT *
                        FROM Question
                        WHERE qs_id = @question_id;

                        SET @count += 1;
                    END
            END

        SELECT * FROM @summary_final;
    COMMIT TRANSACTION

END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER()    AS ErrorNumber,
           ERROR_MESSAGE()   AS ErrorMessage,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE()      AS ErrorLine
END CATCH
GO