--Theatre Utilisation Analysis

SELECT 
    TheatreName,
    COUNT(OperationID) AS OperationsCount,
    ROUND(AVG(TouchtimeMinutes), 2) AS AvgTouchtime
FROM 
    Operations
GROUP BY 
    TheatreName
ORDER BY 
    OperationsCount DESC;

/*
--Insight from the analysis:

--The data highlights performance differences across theatres:
Theatre 1 led with 10 completed operations and an average 
touch time of 32.6 minutes, indicating solid throughput.

--Theatre 3 completed 8 operations but had a longer average touch 
time of 36.38 minutes, suggesting inefficiencies.

--Theatre 2 matched Theatre 3's completions but excelled with a lower 
average touch time of 22.5 minutes, demonstrating greater efficiency.

--Conclusion, The findings suggest that Theatre 2 is the most efficient, while 
Theatre 3 may need process improvements.
[
  {
    "theatrename": "Theatre 1",
    "operationscount": "10",
    "avgtouchtime": "32.60"
  },
  {
    "theatrename": "Theatre 3",
    "operationscount": "8",
    "avgtouchtime": "36.38"
  },
  {
    "theatrename": "Theatre 2",
    "operationscount": "8",
    "avgtouchtime": "22.50"
  }
]
*/