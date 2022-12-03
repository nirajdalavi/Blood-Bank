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

insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON22ABN75', 'Brigida Dwane', 'F', '30/08/1986', 'AB-', '6902132339', '31634 Melody Way');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON72BP95', 'Brittney Dmitrichenko', 'M', '18/03/1975', 'B+', '2341093583', '5 1st Alley');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON52ABP55', 'Dallas Bennetts', 'F', '12/11/1994', 'AB+', '3555216529', '2549 Sauthoff Terrace');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON12ON55', 'Reuven De''Vere - Hunt', 'F', '09/09/1977', 'O-', '1041830264', '00 Carberry Parkway');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON42BP75', 'Jacky Suttie', 'F', '12/03/1998', 'B+', '2548560680', '69151 Twin Pines Way');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON72OP75', 'Yorke Thurner', 'F', '07/10/1984', 'O+', '5746638110', '491 Bobwhite Crossing');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON12ABP75', 'Perceval Waterhowse', 'F', '14/07/1999', 'B+', '6822777389', '7 Hoepker Parkway');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON32ABP45', 'Filmer Christene', 'M', '14/10/1975', 'B+', '5206790107', '336 Elmside Park');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON82ABP35', 'Cherin Millwall', 'M', '05/02/1977', 'AB+', '5115548614', '1 Lakeland Alley');
insert into donor (donor_id, donor_name, gender, donor_dob, blood group, phone, donor_address) values ('DON12BP55', 'Jaye Whittington', 'M', '21/02/1992', 'B+', '5169777885', '4 Merchant Alley');

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

insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'ON0001', 'P5PL334', '8/8/2022', '12/21/2021');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'ON0001', 'P5PL090', '9/8/2022', '3/21/2022');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'BN0005', 'P6PL705', '3/30/2022', '5/22/2022');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'AP0004', 'P6RB299', '12/17/2021', '10/28/2022');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'ABN006', 'P5PT485', '9/16/2022', '1/19/2022');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'OP0003', 'P5PL599', '1/7/2022', '4/19/2022');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('RBC', 'ABP002', 'P4PL029', '12/30/2021', '12/20/2021');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Platelets', 'BP0007', 'P6RB637', '8/20/2022', '6/25/2022');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Plasma', 'AN0008', 'P6PL037', '11/7/2022', '3/17/2022');
insert into Blood_Components (component_type, blood_id, packet_id, ext_date, exp_date) values ('Platelets', 'ON0001', 'P4PL788', '2/18/2022', '1/22/2022');

insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON72BP9', '07-1388053', 'Platelets', 'Emergency', '2022-07-09', '2021-08-09');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON22ABN75', '89-8871035', 'Plasma', 'Normal', '2022-07-16', '2020-04-11');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON52ABP55', '07-1388053', 'Platelets', 'Emergency', '2022-11-09', '2021-09-22');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON42BP75', '95-5297699', 'Plasma', 'Emergency', '2022-11-17', '2021-03-21');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON12ON55', '95-5297699', 'Plasma', 'Normal', '2022-04-28', '2022-06-16');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON12BP55', '25-8346204', 'Plasma', 'Normal', '2022-04-09', '2021-04-06');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON82ABP35', '25-8346204', 'Whole_blood', 'Normal', '2022-09-03', '2020-08-25');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON32ABP45', '57-6117875', 'Platelets', 'Emergency', '2022-05-24', '2021-06-11');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON12ABP75', '57-6117875', 'Whole_blood', 'Normal', '2022-01-08', '2020-05-18');
insert into donates (donor_id, staff_id, don_type, don_occasion, don_date, next_date) values ('DON72OP75', '89-8871035', 'Power_red', 'Emergency', '2022-08-03', '2021-12-08');

insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H179', '6966', 'Anaemia', '2018/06/27');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H775', '9088', 'Malaria', '2020/03/30');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H077', '9354', 'Malaria', '2022/07/23');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H104', '4989', 'Anaemia', '2021/06/05');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H531', '6600', 'Anaemia', '2018/12/01');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H509', '4420', 'Malaria', '2018/08/02');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H361', '6085', 'Malaria', '2019/01/28');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H420', '5658', 'Anaemia', '2019/05/21');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H560', '8003', 'Surgery', '2022/07/12');
insert into admits (hospital_id, patient_id, patient_case, admission_date) values ('H209', '9229', 'Malaria', '2020/09/06');

insert into blood (donor_id, sample_id) values ('DON92BN85', 'SPL5760');
insert into blood (donor_id, sample_id) values ('DON22BN45', 'SPL2141');
insert into blood (donor_id, sample_id) values ('DON42AN85', 'SPL7553');
insert into blood (donor_id, sample_id) values ('DON82AN05', 'SPL7380');
insert into blood (donor_id, sample_id) values ('DON02AP45', 'SPL0835');
insert into blood (donor_id, sample_id) values ('DON22OP15', 'SPL8239');
insert into blood (donor_id, sample_id) values ('DON52ON05', 'SPL8009');
insert into blood (donor_id, sample_id) values ('DON42BP45', 'SPL3175');
insert into blood (donor_id, sample_id) values ('DON62OP65', 'SPL3029');
insert into blood (donor_id, sample_id) values ('DON62BN95', 'SPL3795');


insert into tested_by (sample_id, staff_id, result) values ('S782', 'STA633', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('S491', 'STA415', 'POSITIVE');
insert into tested_by (sample_id, staff_id, result) values ('S811', 'STA884', 'POSITIVE');
insert into tested_by (sample_id, staff_id, result) values ('S799', 'STA304', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('S169', 'STA800', 'POSITIVE');
insert into tested_by (sample_id, staff_id, result) values ('S509', 'STA061', 'POSITIVE');
insert into tested_by (sample_id, staff_id, result) values ('S846', 'STA336', 'POSITIVE');
insert into tested_by (sample_id, staff_id, result) values ('S099', 'STA625', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('S117', 'STA710', 'NEGATIVE');
insert into tested_by (sample_id, staff_id, result) values ('S900', 'STA762', 'POSITIVE');

insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H458', 'P633', 'roga', 'O+', 'RBC', '328ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H772', 'P310', 'surgery', 'O-', 'Plasma', '514ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H306', 'P070', 'roga', 'AB+', 'Plasma', '658ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H256', 'P451', 'accident', 'O-', 'Platelets', '614ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H533', 'P691', 'roga', 'AB-', 'RBC', '995ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H236', 'P901', 'accident', 'AB+', 'WholeBlood', '954ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H985', 'P963', 'accident', 'AB-', 'Platelets', '766ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H965', 'P632', 'roga', 'AB-', 'Plasma', '715ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H046', 'P826', 'accident', 'AB-', 'WholeBlood', '419ml');
insert into req_rec (hospital_id, patient_id, patient_case, req_bg, req_type, qty) values ('H968', 'P466', 'roga', 'AB+', 'RBC', '356ml');









