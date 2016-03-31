CREATE OR REPLACE VIEW children_index AS
WITH
current_work_status AS (
  SELECT
    child_id, work_status_id, start_date AS current_date
  FROM child_statuses
  WHERE work_status_id IS NOT NULL
  GROUP BY child_id, work_status_id, start_date
  ORDER BY start_date DESC
  LIMIT 1
),
current_education_status AS (
  SELECT
    child_id, education_status_id, start_date AS current_date
  FROM child_statuses
  WHERE education_status_id IS NOT NULL
  GROUP by child_id, education_status_id, start_date
  ORDER by start_date DESC
  LIMIT 1
)
SELECT
  c.*,
  current_work_status.current_date AS work_status_date, ws.name AS work_status_name,
  current_education_status.current_date AS education_status_date, es.name AS education_status_name
FROM children c
  LEFT JOIN current_work_status ON c.id = current_work_status.child_id
  LEFT JOIN current_education_status ON c.id = current_education_status.child_id
  LEFT JOIN work_statuses ws ON current_work_status.work_status_id = ws.id
  LEFT JOIN education_statuses es ON current_education_status.education_status_id = es.id;
