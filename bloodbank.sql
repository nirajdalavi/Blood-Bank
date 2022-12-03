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


insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('07-1388053', 'Car Barnwell', 'Landscaper', 'F', 'Male', 'AB-', '1434520581', '028 Buell Circle');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('97-5745426', 'Galen Errichelli', 'Carpenter', 'F', 'Male', 'B+', '5649631213', '3980 Mallard Park');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('57-6117875', 'Sella Humbell', 'Cement Mason', 'F', 'Female', 'O+', '1352377028', '6238 Meadow Ridge Center');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('89-8871035', 'Beilul di Rocca', 'Plasterers', 'F', 'Female', 'B+', '9361083378', '8 Reinke Terrace');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('25-8346204', 'Aileen Beadell', 'Waterproofer', 'M', 'Female', 'AB-', '4908385029', '662 Morning Place');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('41-9018217', 'Tabbatha Ropkes', 'Glazier', 'M', 'Female', 'AB-', '6051801939', '7 Sunnyside Park');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('43-1237946', 'Denis Milson', 'Electrician', 'M', 'Male', 'B+', '9783904360', '79 Leroy Lane');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('95-5297699', 'Jesse Garey', 'Tile Setter', 'F', 'Female', 'O+', '1587373587', '54249 New Castle Place');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('45-0743893', 'Daphne Rickword', 'Pipefitter', 'M', 'Female', 'AB+', '2319723173', '85 Buena Vista Alley');
insert into staff (staff_id, staff_name, staff_role, staff_gender, staff_dob, staff_bg, staff_phone, staff_address) values ('90-0175079', 'Bonnie Watford', 'Equipment Operator', 'F', 'Female', 'AB+', '1567985206', '68 Spaight Street');

insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('142020DE', '2019/12/18', 'Reforma', 'McCullough Inc');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('222022DE', '2019/02/10', 'Issoire', 'Koch-O''Kon');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('752021NO', '2021/10/10', 'Sandaogou', 'Friesen Group');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('492021DE', '2019/05/12', 'Qiakeri', 'Armstrong, Friesen and Lynch');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('542021OC', '2021/11/03', 'Kujang-ŭp', 'Schuppe LLC');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('842022NO', '2020/02/09', 'Vyatskiye Polyany', 'Wehner-Ebert');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('092021DE', '2022/09/12', 'Macha', 'Olson-Nader');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('172022SE', '2021/09/26', 'Shaydon', 'White, West and Lind');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('512020DE', '2019/02/14', 'Padang', 'Upton Inc');
insert into donationcamp (camp_id, camp_date, camp_location, camp_organizers) values ('902021NO', '2019/05/17', 'Uinskoye', 'Deckow Inc');


insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (1, 'Radcliffe', 'M', '2022-04-15', 'B-', '2483747490', '667 Kim Court');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (2, 'Moishe', 'M', '2022-02-01', 'A-', '5389084849', '3 Stuart Alley');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (3, 'Barn', 'M', '2022-08-31', 'A+', '4178787386', '00622 Goodland Place');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (4, 'Kelila', 'F', '2022-01-19', 'B+', '4566934137', '58494 Buhler Road');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (5, 'Dorie', 'M', '2022-01-21', 'O+', '5256896468', '8205 Bonner Plaza');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (6, 'Amabel', 'F', '2021-12-20', 'O+', '3474656261', '01 Division Way');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (7, 'Gabrielle', 'F', '2022-05-27', 'A+', '7742912547', '563 Ronald Regan Alley');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (8, 'Ulric', 'M', '2022-06-10', 'O-', '6395699476', '2567 Graedel Point');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (9, 'Alistair', 'M', '2022-03-04', 'O+', '7023633366', '052 Eggendart Street');
insert into patient (patient_id, patient_name, patient_gender, patient_dob, patient_bg, patient_phone , patient_address) values (10, 'Eustace', 'M', '2022-01-27', 'O-', '9444984525', '4 Westerfield Alley');


insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H404', 'Lockwood', '4003570438', '426 Kim Street');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H637', 'Karee', '4893513645', '54 Eliot Court');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H537', 'Ricoriki', '3895162115', '9417 Atwood Plaza');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H347', 'Boote', '8127893410', '8003 Drewry Terrace');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H106', 'Marquita', '2307372601', '5102 Butternut Trail');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H082', 'Paquito', '2422684991', '3113 Kingsford Trail');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H117', 'Cirilo', '1564665912', '0 Mosinee Alley');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H744', 'Juli', '1338013695', '012 Melody Place');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H800', 'Myranda', '4343311074', '54506 Rockefeller Park');
insert into hospital (hospital_id, hospital_name, hospital_phone, hospital_address) values ('H610', 'Merle', '1548501867', '0283 Summit Terrace');

insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON72AP05', 'Jewelle Hulke', 'Female', '08/02/1978', 'A+', '4119871314', '275 Bobwhite Center');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON02BN55', 'Nara Verny', 'Female', '08/04/1973', 'B-', '6705351040', '8110 Carey Junction');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON82OP95', 'Brendis McSpirron', 'Male', '30/11/1998', 'O+', '2849729072', '2291 Shopko Junction');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON32AP15', 'Barrett Saddleton', 'Genderfluid', '23/05/1992', 'A+', '8763319806', '95674 Marquette Trail');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON12OP75', 'Lilyan Walburn', 'Female', '20/06/1977', 'O+', '7939465117', '9773 Shopko Court');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON72BN85', 'Hubey Kynforth', 'Male', '05/05/2000', 'B-', '6181843861', '99349 Starling Point');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON52BN75', 'Merrill Mayo', 'Male', '23/08/1991', 'B-', '5121508691', '0319 Bonner Place');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON82OP05', 'Adele Dykes', 'Genderqueer', '18/08/1985', 'O+', '4206623540', '54300 School Terrace');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON12OP55', 'Elane Cicchelli', 'Female', '14/06/1999', 'O+', '3264352455', '72 Sage Crossing');
insert into patient (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON02BP55', 'Zackariah Diwell', 'Male', '28/03/1996', 'B+', '6703017498', '04187 Corscot Trail');

insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H864', 'P042', 'roga', '7/5/2022');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H493', 'P471', 'roga', '1/2/2021');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H962', 'P576', 'roga', '5/19/2021');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H967', 'P547', 'roga', '6/18/2022');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H205', 'P884', 'roga', '10/25/2019');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H214', 'P885', 'roga', '10/28/2022');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H303', 'P880', 'surgery', '8/4/2019');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H695', 'P369', 'roga', '8/12/2019');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H234', 'P330', 'roga', '10/18/2022');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H860', 'P408', 'roga', '7/21/2022');
