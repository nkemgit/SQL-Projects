
--Surgeon Performance Analysis

SELECT 
    SurgeonName,
    COUNT(OperationID) AS TotalOperations,
    ROUND(AVG(TouchtimeMinutes), 2) AS AvgTouchtime,
    SUM(CASE WHEN IsCancelled = 1 THEN 1 ELSE 0 END) AS CancelledOperations,
    SUM(CASE WHEN IsCompleted = 1 THEN 1 ELSE 0 END) AS CompletedOperations
FROM 
    Operations
GROUP BY 
    SurgeonName
ORDER BY 
    TotalOperations DESC;

/*
Insight from the Analysis:
--Total Operations: M Watson performed the most (9), while K Ryan had the fewest (3).

--Average Touch Time: K Ryan’s touch time is longest at 46.67 mins, while N Kumar’s
is shortest at 18 mins. M Coren’s efficient 23.33 mins suggests quicker procedures.

--Cancelled vs Completed Operations: M Watson has the highest cancellations (5) but 
also 4 completions; N Kumar faced 4 cancellations with no completions, while K Ryan 
completed all scheduled operations smoothly.

[
  {
    "surgeonname": "M Watson",
    "totaloperations": "9",
    "avgtouchtime": "35.00",
    "cancelledoperations": "5",
    "completedoperations": "4"
  },
  {
    "surgeonname": "M Coren",
    "totaloperations": "6",
    "avgtouchtime": "23.33",
    "cancelledoperations": "3",
    "completedoperations": "3"
  },
  {
    "surgeonname": "S Phillips",
    "totaloperations": "4",
    "avgtouchtime": "32.50",
    "cancelledoperations": "2",
    "completedoperations": "2"
  },
  {
    "surgeonname": "N Kumar",
    "totaloperations": "4",
    "avgtouchtime": "18.00",
    "cancelledoperations": "4",
    "completedoperations": "0"
  },
  {
    "surgeonname": "K Ryan",
    "totaloperations": "3",
    "avgtouchtime": "46.67",
    "cancelledoperations": "0",
    "completedoperations": "3"
  }
]*/


