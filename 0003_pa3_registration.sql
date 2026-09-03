ALTER TABLE students ADD COLUMN registration_pa3 TEXT DEFAULT '';
CREATE INDEX IF NOT EXISTS idx_students_registration_pa3 ON students(registration_pa3);
