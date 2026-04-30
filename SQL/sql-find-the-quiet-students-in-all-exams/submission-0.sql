WITH max_min AS (
    SELECT
        s.student_id AS student_id,
        s.student_name AS student_name
    FROM student AS s
    LEFT JOIN exam AS e
    ON s.student_id = e.student_id
    WHERE (e.exam_id, e.score) IN ((
        SELECT
            exam_id,
            MAX(score)
        FROM exam
        GROUP BY exam_id
    ) UNION (
        SELECT
            exam_id,
            MIN(score)
        FROM exam
        GROUP BY exam_id
    )) OR e.exam_id IS NULL
)

SELECT
    DISTINCT(student_id),
    student_name
FROM student
WHERE (student_id, student_name) NOT IN (
    SELECT
        student_id,
        student_name
    FROM max_min
);

