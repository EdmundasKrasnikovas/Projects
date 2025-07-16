SELECT
  Team_Name,
  SUM(CASE WHEN Title = 'CSR' THEN 1 ELSE 0 END) AS CSR_Total,
  SUM(CASE WHEN Title = 'SCSR' THEN 1 ELSE 0 END) AS SCSR_Total,
  SUM(CASE WHEN Primary_Specialisation = 'A_Specialisation' THEN 1 ELSE 0 END) AS A_Specialisation,
  SUM(CASE WHEN Primary_Specialisation = 'B_Specialisation' THEN 1 ELSE 0 END) AS B_Specialisation,
  SUM(CASE WHEN Primary_Specialisation = 'C_Specialisation' THEN 1 ELSE 0 END) AS C_Specialisation,
  SUM(CASE WHEN Primary_Specialisation = 'D_Specialisation' THEN 1 ELSE 0 END) AS D_Specialisation,
  SUM(CASE WHEN Primary_Specialisation = 'E_Specialisation' THEN 1 ELSE 0 END) AS E_Specialisation

FROM
  Team_Members
WHERE
  No_longer_working = 'FALSE'
  AND (Title = 'CSR' OR Title = 'SCSR')
GROUP BY
  Team_Name
ORDER BY
  Team_Name;
  
  --Insights -
 --   Biggest  Variety of specialisations -  A, B, C, D, and E Specialisations are mostly found in the largest teams. 
 -- EN TN TWW, EN UA HW, and EN EG TP have a wide variety of specialisations and the highest numbers in categories like A and B Specialisation.
 -- Smaller teams have tendency to have E  Specialisation