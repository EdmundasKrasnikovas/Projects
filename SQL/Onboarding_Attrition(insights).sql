SELECT
  Team_Name,
  SUM(CASE WHEN No_longer_working = 'FALSE' AND Joining_date >= DATE('now', '-3 months') THEN 1 ELSE 0 END) AS hired_last_3_months,
  SUM(CASE WHEN No_longer_working = 'TRUE' AND Leaving_Date >= DATE('now', 'start of year') THEN 1 ELSE 0 END) AS left_this_year
FROM
  Team_Members
GROUP BY
  Team_Name
ORDER BY
  hired_last_3_months DESC;
  
  
  --Insights
  -- EN TN TWW, EN UA HW, and EN EG TP have experienced the most onboarding recently, each hiring over 60 new people in the last three months. In terms of staff leaving this year, EN TN TWW, EN EG TP, and FR TN OS have seen the highest turnover.
 