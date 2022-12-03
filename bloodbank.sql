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
    date_of_reg date not null,
    foreign key(donor_id) references donor(donor_id) on delete cascade,
    foreign key(camp_id) references donationcamp(camp_id) on delete cascade
);

create table if not exists repository(
    blood_id varchar(10) not null primary key,
    blood_group varchar(3) not null,
    RBC integer not null,
    Platelets integer not null,
    PLasma integer not null
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
    date_of_admission date not null,
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


insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('63-9145880', 'Corbet Bloss', 'Sheet Metal Worker', 'F', 'Male', 'AB+', '569-109-6364', '23 Old Gate Terrace');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('51-2418025', 'Una Osmon', 'Pipelayer', 'M', 'Female', 'A+', '679-220-7980', '31020 Blackbird Avenue');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('62-0320805', 'Merralee Ratcliff', 'Tile Setter', 'M', 'Polygender', 'A-', '248-908-5121', '9532 New Castle Crossing');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('68-5949756', 'Mickie Cochrane', 'Welder', 'F', 'Male', 'AB-', '687-203-1552', '9 Heffernan Junction');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('36-2764166', 'Blondie Waddy', 'Refridgeration', 'F', 'Female', 'A-', '754-223-9058', '43 Jenna Crossing');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('97-5990597', 'Frederico Allmann', 'Plumber', 'F', 'Male', 'A+', '902-579-8576', '3 Parkside Street');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('39-6069792', 'Melisandra Schober', 'Cement Mason', 'M', 'Female', 'AB-', '823-498-8197', '78 Sundown Circle');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('91-9278458', 'Elka Draisey', 'Equipment Operator', 'F', 'Bigender', 'AB-', '417-826-8314', '5 Forest Dale Hill');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('88-4469118', 'Alfie Errey', 'Millwright', 'F', 'Female', 'O-', '878-686-7819', '278 Loeprich Pass');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('52-1081623', 'Raymond Larmet', 'Ironworker', 'M', 'Male', 'AB-', '581-346-8772', '369 Melby Park');

