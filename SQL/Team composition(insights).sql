SELECT
  Team_Name,
  SUM(CASE WHEN Title = 'CSR' THEN 1 ELSE 0 END) AS CSR_total,
  SUM(CASE WHEN Title = 'SCSR' THEN 1 ELSE 0 END) AS SCSR_total,
  SUM(CASE WHEN Title = 'MGMT' THEN 1 ELSE 0 END) AS MGMT_total,
  SUM(CASE WHEN Title = 'TL' THEN 1 ELSE 0 END) AS TL_total,
  SUM(CASE WHEN Title = 'BM' THEN 1 ELSE 0 END) AS BM_total,
  SUM(CASE WHEN Title = 'QL' THEN 1 ELSE 0 END) AS QL_total
FROM
  Team_Members
WHERE
  No_longer_working = 'FALSE'
GROUP BY
  Team_Name
ORDER BY
  Team_Name;
  
  -- Insights - The majority of accounts consist of CSR and SCSR roles, making up approximately 87% of all active positions. The biggest teams by total headcount are EN TN TWW, EN UA HW, and EN EG TP, each of which has over 250 active members, mainly in CSR positions.
