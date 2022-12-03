create database if not exists bloodbank;
use bloodbank;

create table if not exists donor(
    donor_id varchar(10) not null primary key,
    donor_name varchar(30) not null,
    donor_gender char(1) not null,
    donor_dob DATE not null,
    donor_bg varchar(3) not null,
    donor_phone varchar(15) not null,
    donor_address text not null
);

create table if not exists staff(
    staff_id varchar(10) not null primary key,
    staff_name varchar(30) not null,
    staff_role varchar(15) not null,
    staff_gender char(1) not null,
    staff_dob date not null,
    staff_bg varchar(3) not null,
    staff_phone varchar(15) not null,
    staff_address text not null
);

create table if not exists hospital(
    hospital_id varchar(12) not null primary key,
    hospital_name text not null,
    hospital_phone varchar(10) not null,
    hospital_address text not null
);

create table if not exists patient(
    patient_id varchar(10) not null primary key,
    patient_name varchar(30) not null,
    patient_gender varchar(1) not null,
    patient_dob date not null,
    patient_bg varchar(3) not null,
    patient_phone varchar(15) not null,
    patient_address text not null
);

create table if not exists donationcamp(
    camp_id varchar(10) not null primary key,
    camp_date date not null,
    camp_location text not null,
    camp_organizers text not null
);

create table if not exists registration(
    camp_id varchar(10) not null,
    donor_id varchar(10) not null,
    reg_date date not null,
    foreign key(donor_id) references donor(donor_id) on delete cascade,
    foreign key(camp_id) references donationcamp(camp_id) on delete cascade
);

create table if not exists repository(
    blood_id varchar(10) not null primary key,
    blood_group varchar(3) not null,
    RBC integer not null,
    Platelets integer not null,
    Plasma integer not null
);

create table if not exists Blood_Components(
    component_type varchar(3) not null;
    blood_id varchar(10) not null,
    packet_id varchar(10) not null primary key,
    ext_date date not null,
    exp_date date not null,
    foreign key(blood_id) references repository(blood_id) on delete cascade
);


create table if not exists donates(
    donor_id varchar(10) not null,
    staff_id varchar(10) not null, 
    don_type char(15) not null,
    don_occasion char(10) not null,
    don_date date not null,
    next_date date not null,
    foreign key(donor_id) references donor(donor_id) on delete cascade,
    foreign key(staff_id) references staff(staff_id) on delete cascade
    
);

create table if not exists admits(
    hospital_id varchar(10) not null,
    patient_id varchar(10) not null,
    patient_case varchar(30) not null,
    admission_date date not null,
    foreign key(hospital_id) references hospital(hospital_id) on delete cascade,
    foreign key(patient_id) references patient(patient_id) on delete cascade
);

create table if not exists blood(
    donor_id varchar(10) not null,
    sample_id varchar(10) not null primary key,
    foreign key(donor_id) references donor(donor_id) on delete cascade
);

create table if not exists tested_by(
    sample_id varchar(10) not null,
    staff_id varchar(10) not null ,
    result varchar(8) not null,
    foreign key(staff_id) references staff(staff_id) on delete cascade,
    foreign key(sample_id) references blood(sample_id) on delete cascade
);

create table if not exists req_rec(
    hospital_id varchar(10) not null,
    patient_id varchar(10) not null,
    patient_case varchar(30) not null,
    req_bg varchar(3) not null,
    req_type varchar(10) not null,
    qty integer not null,
    foreign key(hospital_id) references hospital(hospital_id) on delete cascade,
    foreign key(patient_id) references patient(patient_id) on delete cascade
);

show tables;

insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON22ABN75', 'Brigida Dwane', 'F', '1986-08-30', 'AB-', '6902132339', '31634 Melody Way');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON72BP95', 'Brittney Dmitrichenko', 'M', '1975-03-18', 'B+', '2341093583', '5 1st Alley');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON52ABP55', 'Dallas Bennetts', 'F', '1994-11-12', 'AB+', '3555216529', '2549 Sauthoff Terrace');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON12ON55', 'Reuven De''Vere - Hunt', 'F', '1977-09-09', 'O-', '1041830264', '00 Carberry Parkway');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON42BP75', 'Jacky Suttie', 'F', '1998-03-12', 'B+', '2548560680', '69151 Twin Pines Way');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON72OP75', 'Yorke Thurner', 'F', '1984-10-07', 'O+', '5746638110', '491 Bobwhite Crossing');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON12ABP75', 'Perceval Waterhowse', 'F', '1999-07-14', 'B+', '6822777389', '7 Hoepker Parkway');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON32ABP45', 'Filmer Christene', 'M', '1975-10-14', 'B+', '5206790107', '336 Elmside Park');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON82ABP35', 'Cherin Millwall', 'M', '1977-02-05', 'AB+', '5115548614', '1 Lakeland Alley');
insert into donor (donor_id, donor_name, donor_gender, donor_dob, donor_bg, donor_phone, donor_address) values ('DON12BP55', 'Jaye Whittington', 'M', '1992-02-21', 'B+', '5169777885', '4 Merchant Alley');

insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST2481', 'Gerhard Mottershead', 'Doctor', '1987-08-27', 'AB-', '5629881493', '5660 Delladonna Court');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST7389', 'Tally Fearnsides', 'Doctor', 'F', '1974-11-27', 'O+', '5791401782', '15322 Ryan Hill');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST1424', 'Edy Luigi', 'Doctor', 'F', '1996-08-11', 'AB-', '7165755391', '7 Dexter Crossing');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST8588', 'Hedvige Wippermann', 'Doctor', 'M', '1976-06-09', 'O-', '5657993180', '00131 Tennyson Hill');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST9536', 'Brooks Organ', 'Doctor', 'M', '1990-04-26', 'AB+', '9091032808', '16 Esch Park');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST8119', 'Tybie O''Fairy', 'BloodAnalyst','1994-08-31', 'AB-', '2212200240', '4 Forest Run Avenue');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST6028', 'Shanna Drysdall', 'BloodAnalyst', 'M', '1971-11-28', 'A+', '4418293220', '85 Sutherland Plaza');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST7117', 'Elora Grew', 'BloodAnalyst', 'M', '1997-03-13', 'AB+', '6686698570', '02209 Merrick Crossing');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST6416', 'Dalton Chiese', 'BloodAnalyst', 'M', '1977-04-24', 'AB-', '5562544008', '05 Coleman Drive');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('ST6147', 'Margalit Thomkins', 'BloodAnalyst', 'M', '2002-04-24', 'A-', '5416841356', '557 Anhalt Place');

insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H771', 'Angelica', '(549) 7007177', '9 Badeau Circle');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H887', 'Monika', '(916) 1193148', '104 Donald Lane');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H247', 'Quintana', '(965) 9775771', '8973 Bartillon Alley');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H256', 'Pepita', '(883) 2480785', '4649 Pawling Court');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H546', 'Pam', '(379) 6971248', '85 Brickson Park Place');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H807', 'Coriss', '(982) 7562402', '578 Helena Point');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H919', 'Aurore', '(617) 4669968', '80 Hudson Lane');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H981', 'Burnard', '(409) 4988937', '02039 Burrows Road');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H496', 'Waldo', '(180) 3720352', '5 Bellgrove Court');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H037', 'Elisabetta', '(821) 7330187', '5 Bonner Alley');

insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT1444', 'Austine Worthington', 'M', '2022-10-30', 'AB+', '3304101024', '03796 Hudson Junction');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT6137', 'Hadrian Dumbare', 'F', '2022-05-23', 'AB+', '7265871979', '7762 Summit Trail');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT9437', 'Alikee Gerg', 'M', '2022-01-02', 'O-', '2756162197', '555 Sullivan Hill');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT5815', 'Gladi Buggs', 'M', '2021-05-03', 'O-', '3307784521', '39217 Amoth Alley');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT2575', 'Andreana Effnert', 'M', '2020-04-13', 'B+', '1402535553', '0 Valley Edge Plaza');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT0319', 'Doti Yggo', 'M', '2020-06-16', 'AB-', '6439043521', '3 Dexter Drive');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT0479', 'Rutter Fallow', 'F', '2022-08-22', 'B-', '8905745027', '78502 Merry Circle');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT4437', 'Justin Point', 'F', '2020-07-08', 'O-', '7912348106', '28 North Pass');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT5112', 'Rafi Blanking', 'F', '2022-05-15', 'AB+', '1127538147', '14264 Hoard Road');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone, patient_address) values ('PAT0198', 'Moll Thackray', 'M', '2020-05-10', 'A+', '4007469998', '182 Mockingbird Place');

insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('142020DE', '2019-12-18', 'Reforma', 'McCullough Inc');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('222022DE', '2019-02-10', 'Issoire', 'Koch-O''Kon');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('752021NO', '2021-10-10', 'Sandaogou', 'Friesen Group');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('492021DE', '2019-05-12', 'Qiakeri', 'Armstrong, Friesen and Lynch');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('542021OC', '2021-11-03', 'Kujang-ŭp', 'Schuppe LLC');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('842022NO', '2020-02-09', 'Vyatskiye Polyany', 'Wehner-Ebert');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('092021DE', '2022-09-12', 'Macha', 'Olson-Nader');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('172022SE', '2021-09-26', 'Shaydon', 'White, West and Lind');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('512020DE', '2019-02-14', 'Padang', 'Upton Inc');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('902021NO', '2019-05-17', 'Uinskoye', 'Deckow Inc');

insert into registration (camp_id, donor_id, reg_date) values ('142020DE', 'DON22ABN75', '2022-12-26');
insert into registration (camp_id, donor_id, reg_date) values ('542021OC', 'DON42BP75', '2022-10-25');
insert into registration (camp_id, donor_id, reg_date) values ('092021DE', 'DON72OP75', '2022-11-22');
insert into registration (camp_id, donor_id, reg_date) values ('492021DE', 'DON72BP95', '2022-05-11');
insert into registration (camp_id, donor_id, reg_date) values ('492021DE', 'DON52ABP55', '2022-01-18');
insert into registration (camp_id, donor_id, reg_date) values ('902021NO', 'DON12ON55', '2022-07-06');
insert into registration (camp_id, donor_id, reg_date) values ('902021NO', 'DON82ABP35', '2022-05-13');
insert into registration (camp_id, donor_id, reg_date) values ('142020DE', 'DON12BP55', '2022-12-15');
insert into registration (camp_id, donor_id, reg_date) values ('512020DE', 'DON32ABP45', '2022-09-03');
insert into registration (camp_id, donor_id, reg_date) values ('752021NO', 'DON12ABP75', '2022-09-22');

insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('ON0001', 'O-', '4.7', '4.0', '0.4');
insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('ABP002', 'AB+', '4.8', '0.9', '5.2');
insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('OP0003', 'O+', '5.6', '8.3', '1.6');
insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('AP0004', 'A+', '5.9', '7.6', '9.0');
insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('BN0005', 'B-', '9.1', '8.6', '8.2');
insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('ABN006', 'AB-', '9.3', '7.2', '3.4');
insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('BP0007', 'B+', '5.2', '1.4', '7.2');
insert into repository (blood_id, blood_group, RBC, Platelets, Plasma) values ('AN0008', 'A-', '2.4', '4.9', '3.0');

insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'ON0001', 'P5PL334', '2022-08-08', '2021-12-21');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'ON0001', 'P5PL090', '2022-08-09', '2022-03-21');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'BN0005', 'P6PL705', '2022-03-30', '2022-05-21');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'AP0004', 'P6RB299', '2021-12-17', '2022-10-28');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'ABN006', 'P5PT485', '2022-09-16', '2022-01-19');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'OP0003', 'P5PL599', '2022-01-07', '2022-04-19');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'ABP002', 'P4PL029', '2021-12-30', '2021-12-20');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Platelets', 'BP0007', 'P6RB637', '2022-08-20', '2022-06-25');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'AN0008', 'P6PL037', '2022-11-07', '2022-03-17');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Platelets', 'ON0001', 'P4PL788', '2022-02-18', '2022-01-22');

insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON72BP95', 'ST2481', 'Platelets', 'Emergency', '2022-07-09', '2021-08-09');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON22ABN75', 'ST2481', 'Plasma', 'Normal', '2022-07-16', '2020-04-11');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON52ABP55', 'ST7389', 'Platelets', 'Emergency', '2022-11-09', '2021-09-22');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON42BP75', 'ST7389', 'Plasma', 'Emergency', '2022-11-17', '2021-03-21');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON12ON55', 'ST1424', 'Plasma', 'Normal', '2022-04-28', '2022-06-16');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON12BP55', 'ST1424', 'Plasma', 'Normal', '2022-04-09', '2021-04-06');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON82ABP35', 'ST8588', 'Whole_blood', 'Normal', '2022-09-03', '2020-08-25');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON32ABP45', 'ST8588', 'Platelets', 'Emergency', '2022-05-24', '2021-06-11');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON12ABP75', 'ST9536', 'Whole_blood', 'Normal', '2022-01-08', '2020-05-18');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON72OP75', 'ST9536', 'Power_red', 'Emergency', '2022-08-03', '2021-12-08');

insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H496', 'PAT1444', 'Anaemia', '2018-06-27');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H981', 'PAT6137', 'Malaria', '2020-03-30');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H807', 'PAT9437', 'Malaria', '2022-07-23');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H247', 'PAT5815', 'Anaemia', '2021-06-05');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H256', 'PAT2575', 'Anaemia', '2018-12-01');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H256', 'PAT0319', 'Malaria', '2018-08-02');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H247', 'PAT0479', 'Malaria', '2019-01-28');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H807', 'PAT4437', 'Anaemia', '2019-05-21');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H981', 'PAT5112', 'Surgery', '2022-07-12');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H496', 'PAT0198', 'Malaria', '2020-09-06');

insert into blood (donor_id, sample_id) values ('DON22ABN75', 'SPL5760');
insert into blood (donor_id, sample_id) values ('DON72BP95', 'SPL2141');
insert into blood (donor_id, sample_id) values ('DON52ABP55', 'SPL7553');
insert into blood (donor_id, sample_id) values ('DON12ON55', 'SPL7380');
insert into blood (donor_id, sample_id) values ('DON42BP75', 'SPL0835');
insert into blood (donor_id, sample_id) values ('DON72OP75', 'SPL8239');
insert into blood (donor_id, sample_id) values ('DON12ABP75', 'SPL8009');
insert into blood (donor_id, sample_id) values ('DON32ABP45', 'SPL3175');
insert into blood (donor_id, sample_id) values ('DON82ABP35', 'SPL3029');
insert into blood (donor_id, sample_id) values ('DON12BP55', 'SPL3795');


insert into tested_by (sample_id, staff_id, result) values ('SPL5760', 'ST8119', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL2141', 'ST8119', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL7553', 'ST6028', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL7380', 'ST6028', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL0835', 'ST7117', 'POSITIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL8239', 'ST7117', 'ENGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL8009', 'ST6416', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL3175', 'ST6416', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL3029', 'ST6147', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('SPL3795', 'ST6147', 'POSITIVE');

insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H496', 'PAT1444', 'Anaemia', 'AB+', 'RBC', '328ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H981', 'PAT6137', 'Malaria', 'AB+', 'Plasma', '514ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H807', 'PAT9437', 'Malaria', 'O-', 'Plasma', '658ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H247', 'PAT5815', 'Anaemia', 'O-', 'Platelets', '614ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H256', 'PAT2575', 'Anaemia', 'B+', 'RBC', '995ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H256', 'PAT0319', 'Malaria', 'AB-', 'WholeBlood', '954ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H247', 'PAT0479', 'Malaria', 'B-', 'Platelets', '766ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H807', 'PAT4437', 'Anaemia', 'O-', 'Plasma', '715ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H981', 'PAT5112', 'Surgery', 'AB+', 'WholeBlood', '419ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H496', 'PAT0198', 'Malaria', 'A+', 'RBC', '356ml');









