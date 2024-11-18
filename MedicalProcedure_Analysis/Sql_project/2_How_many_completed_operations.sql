
--How many completed operations took place for left eye, right eye and both eyes?
SELECT 
    e.EyeName,
    COUNT(o.OperationID) AS CompletedOperations
FROM 
    Operations o
JOIN 
    EyeLookup e ON o.EyeID = e.EyeID
WHERE 
    o.IsCompleted = 1
GROUP BY 
    e.EyeName;

/*This query counts completed operations by EyeName (left or right) 
by filtering for records where IsCompleted = 1.

Insight from the Analysis:
--The data indicates that there were more operations completed on the 
left eye than on the right eye, with the left eye having three times
as many completed operations (9) compared to the right eye (3).

--This suggests a potential trend or need for more procedures involving 
the left eye, which could warrant further investigation into 
underlying causes or patterns in the patient population.

[
  {
    "eyename": "Left",
    "completedoperations": "9"
  },
  {
    "eyename": "Right",
    "completedoperations": "3"
  }
]
*/