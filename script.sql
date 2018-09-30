drop schema public cascade;
create schema public;

CREATE TABLE TB_ROLE (
  id SERIAL PRIMARY KEY,
  name  VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW()
);

CREATE TABLE TB_HOSPITAL (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  numbberAddress VARCHAR(100) NOT NULL,
  complement VARCHAR(100) NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW()
);

CREATE TABLE TB_USER (
  id SERIAL PRIMARY  KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  birthday TIMESTAMP NOT NULL,
  role_id INT NOT NULL,
  medical_document VARCHAR(100) UNIQUE NULL,
  personal_document VARCHAR(100) UNIQUE NOT NULL,
  responsable_hospital INT NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP DEFAULT NOW(),
  foreign key (role_id) references TB_ROLE(id),
  foreign key (responsable_hospital) references TB_HOSPITAL(id)
);

CREATE TABLE TB_PATIENT (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  personal_document VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  addressNumber VARCHAR(100) NOT NULL,
  complement VARCHAR(100) NOT NULL,
  zipcode VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  birthday TIMESTAMP NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW(),
  phoneNumber VARCHAR(100) NOT NULL
);

CREATE TABLE TB_TYPE_APPOINTMENT (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW()
);

CREATE TABLE TB_MEDICAL_CATEGORY (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW()
);

CREATE TABLE TYPE_PRONOUNCER (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW()
);

CREATE TABLE TB_USER_HAS_MEDICAL_CATEGORY (
  user_id INT NOT NULL,
  medical_category_id INT NOT NULL,
  PRIMARY KEY (user_id, medical_category_id),
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW(),
   foreign key (user_id) REFERENCES TB_USER(id),
   foreign key (medical_category_id) REFERENCES TB_MEDICAL_CATEGORY(id)
);

CREATE TABLE TB_PRONOUNCER (
  id SERIAL PRIMARY KEY,
  patient_id INT NOT NULL,
  hospital_id INT NOT NULL,
  type_pronouncer INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW(),
  foreign key (patient_id ) references TB_PATIENT(id),
  foreign key (hospital_id ) references TB_HOSPITAL(id),
  foreign key (type_pronouncer ) references TYPE_PRONOUNCER(id)
);

CREATE TABLE TB_APPOINTMENT (
  id SERIAL PRIMARY KEY,
  pronouncer_id INT NOT NULL,
  schedule TIMESTAMP NOT NULL,
  medical_category_id INT NOT NULL,
  type_id INT NOT NULL,
  user_id INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  skin_burn INT DEFAULT 0,
  fever INT DEFAULT 0,
  convulsion BOOLEAN DEFAULT FALSE,
  asthma BOOLEAN DEFAULT FALSE,
  vomit BOOLEAN DEFAULT FALSE,
  diarrhea BOOLEAN DEFAULT FALSE,
  apnea BOOLEAN DEFAULT FALSE,
  heart_attack BOOLEAN DEFAULT FALSE,
  hypovolemic_shock BOOLEAN DEFAULT FALSE,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW(),
  medical_return BOOLEAN DEFAULT FALSE,
  is_pregnant BOOLEAN DEFAULT FALSE,
  foreign key (type_id) references TB_TYPE_APPOINTMENT(id),
  foreign key (pronouncer_id)  references TB_PRONOUNCER(id),
  foreign key (user_id) references TB_USER(id)
);

CREATE TABLE TB_PAIN (
  id SERIAL PRIMARY KEY,
  pain_name VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW()
);

CREATE TABLE TB_TRAUMA (
  id SERIAL PRIMARY KEY,
  trauma_name VARCHAR(255) NOT NULL,
  trauma_type INT NOT NULL,
  createdAt TIMESTAMP NULL DEFAULT NOW(),
  updatedAt TIMESTAMP NULL DEFAULT NOW()
);