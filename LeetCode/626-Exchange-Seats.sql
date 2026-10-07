-- LeetCode 626: Exchange Seats

-- Logic:
-- Odd ID  -> next student's name
-- Even ID -> previous student's name
-- Last ID -> same student

SELECT
    id,
    CASE
        WHEN id = (SELECT MAX(id) FROM Seat)
            THEN student

        WHEN id % 2 = 1
            THEN LEAD(student) OVER (ORDER BY id)

        ELSE
            LAG(student) OVER (ORDER BY id)
    END AS student

FROM Seat
ORDER BY id;
