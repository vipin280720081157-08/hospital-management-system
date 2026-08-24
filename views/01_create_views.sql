-- ============================================
-- HOSPITAL MANAGEMENT SYSTEM - VIEWS
-- ============================================

-- ============================================
-- VIEW 1: Appointment details (patient, doctor, date, status)
-- ============================================
DROP VIEW IF EXISTS view_appointment_details;
CREATE VIEW view_appointment_details AS
SELECT
    a.appointment_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    d.specialization,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- ============================================
-- VIEW 2: Doctor appointment statistics
-- ============================================
DROP VIEW IF EXISTS view_doctor_statistics;
CREATE VIEW view_doctor_statistics AS
SELECT
    d.doctor_id,
    d.full_name,
    d.specialization,
    COUNT(a.appointment_id) AS total_appointments,
    SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS completed_count,
    SUM(CASE WHEN a.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_count,
    SUM(CASE WHEN a.status = 'Scheduled' THEN 1 ELSE 0 END) AS scheduled_count
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.full_name, d.specialization;

-- ============================================
-- VIEW 3: Patient appointment/history view
-- ============================================
DROP VIEW IF EXISTS view_patient_history;
CREATE VIEW view_patient_history AS
SELECT
    p.patient_id,
    p.full_name AS patient_name,
    a.appointment_date,
    d.full_name AS doctor_name,
    d.specialization,
    a.status,
    a.reason
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;