SELECT "city",COUNT("name") AS "Number of Schools" FROM schools 
WHERE type = "Public School"
GROUP BY "city"
HAVING "Number of Schools"<= 3
ORDER BY "Number of Schools" DESC,"city";