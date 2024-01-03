SELECT "friends"."friend_id" FROM "users"
INNER JOIN "friends" ON "friends"."user_id" = "users"."id"
WHERE "users"."username" = "lovelytrust487"
INTERSECT 
SELECT  "friends"."friend_id" FROM "users" 
INNER JOIN "friends" ON "friends"."user_id" = "users"."id"
WHERE "users"."username" = "exceptionalinspiration482"