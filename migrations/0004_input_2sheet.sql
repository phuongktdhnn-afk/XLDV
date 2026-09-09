ALTER TABLE students ADD COLUMN class_name TEXT DEFAULT '';
ALTER TABLE students ADD COLUMN certificate TEXT DEFAULT '';
CREATE INDEX IF NOT EXISTS idx_students_class ON students(class_name);
