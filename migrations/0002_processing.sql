ALTER TABLE students ADD COLUMN processing_status TEXT NOT NULL DEFAULT 'OPEN';
ALTER TABLE students ADD COLUMN processed_by TEXT;
ALTER TABLE students ADD COLUMN processed_at TEXT;
ALTER TABLE students ADD COLUMN resolution_note TEXT DEFAULT '';
CREATE INDEX IF NOT EXISTS idx_students_processing_status ON students(processing_status);
