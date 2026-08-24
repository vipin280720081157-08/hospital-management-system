-- ============================================
-- HOSPITAL MANAGEMENT SYSTEM - SAMPLE DATA
-- ============================================

-- ============================================
-- PATIENTS (16 records)
-- ============================================
INSERT INTO patients (full_name, email, phone, date_of_birth, gender, registered_date) VALUES
('Alex Carter', 'alex.carter@example.com', '5550100001', '1990-03-14', 'Male', '2023-01-10'),
('Emma Wilson', 'emma.wilson@example.com', '5550100002', '1985-07-22', 'Female', '2023-01-12'),
('Daniel Brooks', 'daniel.brooks@example.com', '5550100003', '1978-11-05', 'Male', '2023-01-15'),
('Sophie Miller', 'sophie.miller@example.com', '5550100004', '1995-02-18', 'Female', '2023-01-18'),
('James Anderson', 'james.anderson@example.com', '5550100005', '1982-09-30', 'Male', '2023-02-01'),
('Olivia Bennett', 'olivia.bennett@example.com', '5550100006', '1999-05-12', 'Female', '2023-02-05'),
('Noah Parker', 'noah.parker@example.com', '5550100007', '1975-12-25', 'Male', '2023-02-10'),
('Grace Thompson', 'grace.thompson@example.com', '5550100008', '1988-04-08', 'Female', '2023-02-14'),
('Ethan Collins', 'ethan.collins@example.com', '5550100009', '1992-08-17', 'Male', '2023-02-20'),
('Mia Davis', 'mia.davis@example.com', '5550100010', '2001-01-29', 'Female', '2023-03-01'),
('Liam Foster', 'liam.foster@example.com', '5550100011', '1970-06-11', 'Male', '2023-03-05'),
('Chloe Bennett', 'chloe.bennett@example.com', '5550100012', '1993-10-03', 'Female', '2023-03-10'),
('Lucas Reed', 'lucas.reed@example.com', '5550100013', '1987-03-27', 'Male', '2023-03-15'),
('Isabella Cook', 'isabella.cook@example.com', '5550100014', '1996-07-09', 'Female', '2023-03-20'),
('Henry Ward', 'henry.ward@example.com', '5550100015', '1980-12-01', 'Male', '2023-03-25'),
('Amelia Ross', 'amelia.ross@example.com', '5550100016', '1991-11-19', 'Female', '2023-04-01');

-- ============================================
-- DOCTORS (9 records)
-- ============================================
INSERT INTO doctors (full_name, email, phone, specialization, license_number, years_experience, joined_date) VALUES
('Dr. Robert Smith', 'robert.smith@hospital.example.com', '5550200001', 'Cardiology', 'LIC-10001', 15, '2015-01-10'),
('Dr. Emily Johnson', 'emily.johnson@hospital.example.com', '5550200002', 'Pediatrics', 'LIC-10002', 8, '2018-03-15'),
('Dr. Michael Brown', 'michael.brown@hospital.example.com', '5550200003', 'Orthopedics', 'LIC-10003', 12, '2016-06-01'),
('Dr. Sarah Wilson', 'sarah.wilson@hospital.example.com', '5550200004', 'Dermatology', 'LIC-10004', 6, '2019-09-20'),
('Dr. David Taylor', 'david.taylor@hospital.example.com', '5550200005', 'Neurology', 'LIC-10005', 20, '2010-02-05'),
('Dr. Laura Martinez', 'laura.martinez@hospital.example.com', '5550200006', 'General Medicine', 'LIC-10006', 5, '2020-07-11'),
('Dr. James White', 'james.white@hospital.example.com', '5550200007', 'ENT', 'LIC-10007', 10, '2017-04-25'),
('Dr. Anna Clark', 'anna.clark@hospital.example.com', '5550200008', 'Gynecology', 'LIC-10008', 9, '2018-11-30'),
('Dr. Peter Hall', 'peter.hall@hospital.example.com', '5550200009', 'Psychiatry', 'LIC-10009', 14, '2014-08-14');

-- ============================================
-- MEDICINES (16 records)
-- ============================================
INSERT INTO medicines (name, category, unit_price, stock_quantity, expiry_date) VALUES
('Paracetamol 500mg', 'Analgesic', 2.50, 500, '2027-06-30'),
('Amoxicillin 250mg', 'Antibiotic', 5.75, 300, '2026-12-31'),
('Ibuprofen 400mg', 'Anti-inflammatory', 3.20, 400, '2027-03-15'),
('Cetirizine 10mg', 'Antihistamine', 1.80, 250, '2027-01-20'),
('Metformin 500mg', 'Antidiabetic', 4.10, 350, '2027-08-10'),
('Amlodipine 5mg', 'Antihypertensive', 3.90, 280, '2027-05-05'),
('Omeprazole 20mg', 'Antacid', 4.50, 320, '2027-02-28'),
('Azithromycin 500mg', 'Antibiotic', 8.60, 150, '2026-11-15'),
('Salbutamol Inhaler', 'Bronchodilator', 12.00, 100, '2026-10-01'),
('Loratadine 10mg', 'Antihistamine', 2.10, 220, '2027-04-12'),
('Atorvastatin 20mg', 'Statin', 6.30, 200, '2027-07-22'),
('Insulin Glargine', 'Antidiabetic', 25.00, 80, '2026-09-30'),
('Vitamin D3 1000IU', 'Supplement', 3.00, 400, '2027-12-01'),
('Diclofenac Gel', 'Analgesic', 5.20, 150, '2027-01-05'),
('Losartan 50mg', 'Antihypertensive', 4.75, 260, '2027-06-18'),
('Multivitamin Syrup', 'Supplement', 6.90, 180, '2027-09-25');

-- ============================================
-- APPOINTMENTS (24 records - Scheduled/Completed/Cancelled)
-- ============================================
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status, reason) VALUES
(1, 1, '2024-01-10', '09:00', 'Completed', 'Chest pain evaluation'),
(2, 2, '2024-01-11', '10:30', 'Completed', 'Child routine checkup'),
(3, 3, '2024-01-12', '11:00', 'Completed', 'Knee pain'),
(4, 4, '2024-01-15', '14:00', 'Completed', 'Skin rash'),
(5, 5, '2024-01-16', '09:30', 'Completed', 'Migraine follow-up'),
(6, 6, '2024-01-18', '10:00', 'Completed', 'General fever'),
(7, 1, '2024-01-20', '11:30', 'Completed', 'Hypertension review'),
(8, 7, '2024-01-22', '15:00', 'Completed', 'Ear infection'),
(9, 8, '2024-01-25', '09:00', 'Completed', 'Routine gynecological exam'),
(10, 9, '2024-01-28', '13:00', 'Completed', 'Anxiety consultation'),
(11, 3, '2024-02-01', '10:00', 'Cancelled', 'Shoulder pain'),
(12, 4, '2024-02-03', '11:00', 'Cancelled', 'Allergy consultation'),
(13, 2, '2024-02-05', '09:30', 'Completed', 'Vaccination'),
(14, 5, '2024-02-08', '14:30', 'Completed', 'Headache evaluation'),
(15, 6, '2024-02-10', '10:00', 'Completed', 'Diabetes checkup'),
(1, 6, '2026-09-01', '09:00', 'Scheduled', 'Diabetes follow-up'),
(2, 1, '2026-09-02', '10:00', 'Scheduled', 'Cardiac screening'),
(3, 3, '2026-09-03', '11:00', 'Scheduled', 'Post-surgery review'),
(16, 8, '2026-09-05', '09:30', 'Scheduled', 'Prenatal checkup'),
(9, 9, '2026-09-06', '13:00', 'Scheduled', 'Follow-up therapy session'),
(4, 4, '2026-09-08', '14:00', 'Scheduled', 'Skin allergy recheck'),
(10, 7, '2026-09-10', '15:30', 'Scheduled', 'Sinus infection'),
(5, 5, '2026-09-12', '09:00', 'Scheduled', 'Neurological review'),
(6, 2, '2026-09-15', '10:30', 'Scheduled', 'Child vaccination');

-- ============================================
-- PRESCRIPTIONS (linked to COMPLETED appointments)
-- ============================================
INSERT INTO prescriptions (appointment_id, medicine_id, dosage, quantity) VALUES
(1, 6, '1 tablet daily', 30),
(1, 11, '1 tablet daily', 30),
(2, 1, '5ml twice daily', 10),
(3, 3, '1 tablet twice daily', 14),
(3, 14, 'Apply twice daily', 1),
(4, 4, '1 tablet daily', 10),
(5, 1, '1 tablet as needed', 20),
(6, 1, '1 tablet every 6 hours', 12),
(6, 2, '1 capsule three times daily', 15),
(7, 6, '1 tablet daily', 30),
(7, 15, '1 tablet daily', 30),
(8, 8, '1 tablet twice daily', 10),
(9, 13, '1 tablet daily', 30),
(10, 16, '10ml daily', 1),
(13, 1, '5ml as needed', 10),
(14, 3, '1 tablet twice daily', 14),
(15, 5, '1 tablet twice daily', 60),
(15, 12, 'As directed', 1);