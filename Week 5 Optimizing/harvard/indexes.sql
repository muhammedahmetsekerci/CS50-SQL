CREATE INDEX "student_index" ON "students" ("student_id", "course_id");
CREATE INDEX "student_name" ON "students" ("name");
CREATE INDEX "courses_name" ON "students" ("department","semester","title");
CREATE INDEX "courses_index" ON "students" ("id");
CREATE INDEX "course_2023" ON "courses" ("id","department","semester","title")
WHERE "semester" = 2023;
CREATE INDEX "course_select" ON "courses" ("deparment","number","semester","title");

