SELECT "users"."username" FROM "users" 
JOIN "messages" ON "users"."id" = "messages"."from_user_id"
GROUP BY ("to_user_id")
ORDER BY COUNT("messages"."from_user_id") DESC,"users"."username" limit 1;