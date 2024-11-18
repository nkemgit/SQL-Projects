
--What was the most common cancelled procedure?

SELECT 
    ProcedureName,
    COUNT(OperationID) AS CancelledCount
FROM 
    Operations
WHERE 
    IsCancelled = 1
GROUP BY 
    ProcedureName
ORDER BY 
    CancelledCount DESC
LIMIT 1;

--Insight from the Analysis:
/*
--The data shows that the "Blepharoplasty" procedure has been 
cancelled six times, indicating possible scheduling conflicts, 
patient-related factors, or operational inefficiencies. 

--Further investigation is needed to uncover the underlying reasons for 
these cancellations and improve the process to reduce them.

[
  {
    "procedurename": "Blepharoplasty",
    "cancelledcount": "6"
  }
]
*/