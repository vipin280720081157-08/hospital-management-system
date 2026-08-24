-- ============================================
-- HOSPITAL MANAGEMENT SYSTEM - TABLE CREATION
-- ============================================

DROP TABLE IF EXISTS prescriptions;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS patients;

-- ============================================
-- TABLE: patients
-- ============================================
CREATE TABLE patients (
    patient_id      SERIAL PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(15) UNIQUE,
    date_of_birth   DATE NOT NULL,
    gender          VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
    registered_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- ============================================
-- TABLE: doctors
-- ============================================
CREATE TABLE doctors (
    doctor_id       SERIAL PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(15) UNIQUE,
    specialization  VARCHAR(60) NOT NULL,
    license_number  VARCHAR(30) NOT NULL UNIQUE,
    years_experience INTEGER NOT NULL CHECK (years_experience >= 0),
    joined_date     DATE NOT NULL DEFAULT CURRENT_DATE
);

-- ============================================
-- TABLE: medicines
-- ============================================
CREATE TABLE medicines (
    medicine_id     SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    category        VARCHAR(50) NOT NULL,
    unit_price      NUMERIC(8,2) NOT NULL CHECK (unit_price >= 0),
    stock_quantity  INTEGER NOT NULL CHECK (stock_quantity >= 0),
    expiry_date     DATE NOT NULL
);

-- ============================================
-- TABLE: appointments
-- ============================================
CREATE TABLE appointments (
    appointment_id   SERIAL PRIMARY KEY,
    patient_id       INTEGER NOT NULL REFERENCES patients(patient_id) ON DELETE CASCADE,
    doctor_id        INTEGER NOT NULL REFERENCES doctors(doctor_id) ON DELETE CASCADE,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status           VARCHAR(20) NOT NULL DEFAULT 'Scheduled'
                     CHECK (status IN ('Scheduled', 'Completed', 'Cancelled')),
    reason           VARCHAR(150),
    created_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABLE: prescriptions
-- (links appointments to medicines - many-to-many)
-- ============================================
CREATE TABLE prescriptions (
    prescription_id  SERIAL PRIMARY KEY,
    appointment_id   INTEGER NOT NULL REFERENCES appointments(appointment_id) ON DELETE CASCADE,
    medicine_id      INTEGER NOT NULL REFERENCES medicines(medicine_id) ON DELETE CASCADE,
    dosage           VARCHAR(50) NOT NULL,
    quantity         INTEGER NOT NULL CHECK (quantity > 0),
    UNIQUE (appointment_id, medicine_id)
);

-- ============================================
-- INDEXES
-- ============================================
CREATE INDEX idx_appt_patient ON appointments(patient_id);
CREATE INDEX idx_appt_doctor ON appointments(doctor_id);
CREATE INDEX idx_appt_status ON appointments(status);
CREATE INDEX idx_presc_appt ON prescriptions(appointment_id);
CREATE INDEX idx_presc_med ON prescriptions(medicine_id);