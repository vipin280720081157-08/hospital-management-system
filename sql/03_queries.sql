-- ============================================
-- HOSPITAL MANAGEMENT SYSTEM - QUERIES
-- ============================================

-- ==============================
-- SECTION 1: BASIC SELECTS
-- ==============================

-- 1. Display all patients
SELECT * FROM patients ORDER BY patient_id;

-- 2. Display all doctors
SELECT * FROM doctors ORDER BY doctor_id;

-- 3. Display all medicines
SELECT * FROM medicines ORDER BY medicine_id;

-- ==============================
-- SECTION 2: APPOINTMENT STATUS
-- ==============================

-- 4. Display upcoming appointments
SELECT * FROM appointments WHERE status = 'Scheduled' ORDER BY appointment_date;

-- 5. Display completed appointments
SELECT * FROM appointments WHERE status = 'Completed' ORDER BY appointment_date;

-- 6. Display cancelled appointments
SELECT * FROM appointments WHERE status = 'Cancelled' ORDER BY appointment_date;

-- ==============================
-- SECTION 3: HISTORY & SCHEDULES
-- ==============================

-- 7. Patient appointment history
SELECT p.full_name, a.appointment_date, a.appointment_time, a.status, a.reason
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
WHERE p.full_name = 'Alex Carter'
ORDER BY a.appointment_date;

-- 8. Doctor appointment schedule
SELECT d.full_name, a.appointment_date, a.appointment_time, a.status
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE d.full_name = 'Dr. Robert Smith'
ORDER BY a.appointment_date;

-- 9. Patient + doctor + appointment details (multi-table JOIN)
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
JOIN doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;

-- ==============================
-- SECTION 4: COUNTS & AGGREGATES
-- ==============================

-- 10. Count appointments per doctor
SELECT d.full_name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.full_name
ORDER BY total_appointments DESC;

-- 11. Count appointments per patient
SELECT p.full_name, COUNT(a.appointment_id) AS total_appointments
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.full_name
ORDER BY total_appointments DESC;

-- 12. Doctors with the most appointments
SELECT d.full_name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.full_name
ORDER BY total_appointments DESC
LIMIT 3;

-- 13. Patients with multiple appointments (HAVING)
SELECT p.full_name, COUNT(a.appointment_id) AS total_appointments
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.full_name
HAVING COUNT(a.appointment_id) > 1
ORDER BY total_appointments DESC;

-- ==============================
-- SECTION 5: MEDICINE QUERIES
-- ==============================

-- 14. Medicine search by category
SELECT name, category, unit_price, stock_quantity
FROM medicines
WHERE category = 'Antibiotic';

-- Medicine search by name (partial match)
SELECT name, category, unit_price FROM medicines
WHERE name ILIKE '%vitamin%';

-- 15. Aggregate analysis - total inventory value
SELECT SUM(unit_price * stock_quantity) AS total_inventory_value FROM medicines;

-- ==============================
-- SECTION 6: GROUP BY / HAVING
-- ==============================

-- 16. Appointment count by status (GROUP BY)
SELECT status, COUNT(*) AS count_by_status
FROM appointments
GROUP BY status
ORDER BY count_by_status DESC;

-- 17. Specializations with more than 2 appointments (HAVING)
SELECT d.specialization, COUNT(a.appointment_id) AS total
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.specialization
HAVING COUNT(a.appointment_id) > 2
ORDER BY total DESC;

-- ==============================
-- SECTION 7: CASE EXPRESSIONS
-- ==============================

-- 18. Label appointments as Past/Today/Upcoming using CASE
SELECT
    appointment_id,
    appointment_date,
    status,
    CASE
        WHEN appointment_date < CURRENT_DATE THEN 'Past'
        WHEN appointment_date = CURRENT_DATE THEN 'Today'
        ELSE 'Upcoming'
    END AS timing
FROM appointments
ORDER BY appointment_date;

-- ==============================
-- SECTION 8: JOIN VARIATIONS
-- ==============================

-- 19. INNER JOIN - only patients with at least one appointment
SELECT DISTINCT p.full_name
FROM patients p
INNER JOIN appointments a ON p.patient_id = a.patient_id;

-- 20. LEFT JOIN - all patients, including those with zero appointments
SELECT p.full_name, a.appointment_id
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
ORDER BY p.full_name;

-- 21. Multi-table JOIN - appointment with prescribed medicines
SELECT
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_date,
    m.name AS medicine_name,
    pr.dosage,
    pr.quantity
FROM prescriptions pr
JOIN appointments a ON pr.appointment_id = a.appointment_id
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN medicines m ON pr.medicine_id = m.medicine_id
ORDER BY a.appointment_date;

-- ==============================
-- SECTION 9: SUBQUERY
-- ==============================

-- 22. Patients who have never had an appointment (subquery)
SELECT full_name, email
FROM patients
WHERE patient_id NOT IN (SELECT DISTINCT patient_id FROM appointments);

-- Doctors whose experience is above the average (subquery)
SELECT full_name, specialization, years_experience
FROM doctors
WHERE years_experience > (SELECT AVG(years_experience) FROM doctors);

-- ==============================
-- SECTION 10: DATE-BASED ANALYSIS
-- ==============================

-- 23. Appointments in the next 30 days
SELECT p.full_name, d.full_name AS doctor_name, a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days'
ORDER BY a.appointment_date;

-- Medicines expiring within 6 months
SELECT name, expiry_date, (expiry_date - CURRENT_DATE) AS days_until_expiry
FROM medicines
WHERE expiry_date <= CURRENT_DATE + INTERVAL '6 months'
ORDER BY expiry_date;