SELECT  "users"."username" FROM "messages" 
JOIN "users" ON "users"."id" = "messages"."from_user_id"
GROUP BY "messages"."to_user_id"
ORDER BY COUNT("messages"."from_user_id") DESC,"users"."username" limit 1;