CREATE TABLE locatii(
id_locatie character varying(50) NOT NULL,
nume_locatie character varying(50) NOT NULL,
descriere_locatie character varying(50) NOT NULL,
nr_angajati_locatie number NOT NULL,
CONSTRAINT pk_locatie PRIMARY KEY (id_locatie)
);

create table angajati(
id_angajat character varying(50) NOT NULL,
nume_angajat character varying(50) NOT NULL,
prenume_angajat character varying(50) NOT NULL,
functie_angajat character varying(50) NOT NULL,
cnp_angajat number NOT NULL,
telefon_angajat number NOT NULL,
salariu_angajat number NOT NULL,
cod_locatie character varying(50),
constraint pk_angajat PRIMARY KEY(id_angajat),
constraint fk_angajat FOREIGN KEY(cod_locatie) references locatii(id_locatie)
);

create table clienti (
id_client character varying(50) NOT NULL,
nume_client character varying(50) NOT NULL,
prenume_client character varying(50) NOT NULL,
telefon_client number NOT NULL,
adresa_client character varying(50) NOT NULL,
constraint pk_client PRIMARY KEY(id_client)
);

create table retete (
id_reteta character varying(50) NOT NULL,
nume_reteta character varying(50) NOT NULL,
descriere_reteta character varying(50) NOT NULL,
constraint pk_reteta primary key(id_reteta)
);
ALTER TABLE retete
ADD cod_ingredient character varying(50);

ALTER TABLE retete
ADD CONSTRAINT fk_retete
FOREIGN KEY (cod_ingredient)
REFERENCES ingrediente(id_ingredient);


create table livrari(
id_livrare character varying(50) NOT NULL,
data_livrare character varying(50) NOT NULL,
status_livrare character varying(50) NOT NULL,
adresa_livrare character varying(50) NOT NULL,
constraint pk_livrare PRIMARY KEY(id_livrare)
);

create table promotii(
id_promotie character varying(50) NOT NULL,
nume_promotie character varying(50) NOT NULL,
reducere_procente_promotie character varying(50) NOT NULL,
data_inceput character varying(50) NOT NULL,
data_sfarsit character varying(50) NOT NULL,
constraint pk_promotie PRIMARY KEY(id_promotie)
);

create table plati(
id_plata character varying(50) NOT NULL,
suma_totala number NOT NULL,
data_plata character varying(50) NOT NULL,
metoda_plata character varying(50) NOT NULL,
status_plata character varying(50) NOT NULL,
constraint pk_plata primary key(id_plata),
cod_client character varying(50),
constraint fk_plata foreign key(cod_client) references clienti(id_client)
);

create table comenzi(
id_comanda character varying(50) not null,
nr_comanda number not null,
data_comanda character varying(50) not null,
constraint pk_comanda primary key(id_comanda),
cod_angajat character varying(50),
constraint fk_comanda foreign key(cod_angajat) references angajati(id_angajat),
cod_client character varying(50),
constraint fk2_comanda foreign key(cod_client) references clienti(id_client),
cod_livrare character varying(50),
constraint fk3_comanda foreign key(cod_livrare) references livrari(id_livrare)
);

create table produse(
id_produs character varying(50),
nume_produs character varying(50),
tip_produs character varying(50),
pret_produs number not null,
constraint pk_produs primary key(id_produs),
cod_comanda character varying(50),
constraint fk_produs foreign key(cod_comanda) references comenzi(id_comanda),
cod_promotie character varying(50),
constraint fk2_produs foreign key(cod_promotie) references promotii(id_promotie)
);


create table ingrediente(
id_ingredient character varying(50) NOT NULL,
nume_ingredient character varying(50) NOT NULL,
cantitate character varying(50) NOT NULL,
constraint pk_ingredient PRIMARY KEY(id_ingredient),
cod_reteta character varying(50),
constraint fk_ingredient FOREIGN KEY(cod_reteta) references retete(id_reteta),
cod_produs character varying(50),
constraint fk2_ingredient foreign key(cod_produs) references produse(id_produs)
);

INSERT INTO locatii VALUES ('LOC001', 'Bucuresti', 'Str. Unirii nr. 15', 50);
INSERT INTO locatii VALUES ('LOC002', 'Cluj', 'Soseaua Magazinului nr.7', 20);
INSERT INTO locatii VALUES ('LOC003','Prahova', 'Mihai Bravu nr.7', 15);
INSERT INTO locatii VALUES ('LOC004', 'Bucuresti', 'Bd. Stefan cel Mare nr. 45', 30);
INSERT INTO locatii VALUES ('LOC005', 'Iasi', 'Str. Take Ionescu nr. 10', 55);
INSERT INTO locatii VALUES ('LOC006', 'Constanta', 'Bd. Mamaia nr. 100', 35);
INSERT INTO locatii VALUES ('LOC007', 'Suceava', 'Str. Lalelelor nr. 12', 20);
INSERT INTO locatii VALUES ('LOC008', 'Calarasi', 'Bd. Mihai Eminescu nr. 84', 21);
INSERT INTO locatii VALUES ('LOC009', 'Ramnicu-Sarat', 'Str. Avram Iancu nr. 5', 30);
INSERT INTO locatii VALUES ('LOC010', 'Bucuresti', 'Str. Crizantemelor nr. 33 ', 40);
INSERT INTO locatii VALUES ('LOC011', 'Bucuresti', 'Aleea Trandafirilor nr. 9', 45);
INSERT INTO locatii VALUES ('LOC012', 'Prahova', 'Str. Independentei nr. 104', 20);
INSERT INTO locatii VALUES ('LOC013', 'Prahova', 'Bd. Republicii nr. 21', 25);
INSERT INTO locatii VALUES ('LOC014', 'Sibiu', 'Str. Garii nr. 7', 30);
INSERT INTO locatii VALUES ('LOC015', 'Sighisoara', 'Str. Carpatilor nr. 18', 15);
INSERT INTO locatii VALUES ('LOC016', 'Constanta', 'Bd. Victoriei nr. 56', 15);
INSERT INTO locatii VALUES ('LOC017', 'Constanta', 'Str. Florilor nr. 2A', 10);
INSERT INTO locatii VALUES ('LOC018', 'Cluj', 'Str. Prim?verii nr. 41', 21);
INSERT INTO locatii VALUES ('LOC019', 'Alba Iulia', 'Str. Morii nr. 88', 22);
INSERT INTO locatii VALUES ('LOC020', 'Constanta', 'Str. Tudor Vladimirescu nr. 29', 19);


INSERT INTO angajati VALUES ('ANG001', 'Popescu', 'Andrei', 'Manager', 1980512345678, 0722000001, 8000, 'LOC001');
INSERT INTO angajati VALUES ('ANG002', 'Ionescu', 'Maria', 'Vanzator', 2990101123456, 0722000002, 4000, 'LOC008');
INSERT INTO angajati VALUES ('ANG003', 'Dobra', 'Andrei', 'Bucatar', 6010101123456, 0724652791, 4000, 'LOC008');
INSERT INTO angajati VALUES ('ANG004', 'Lungu', 'George', 'Bucatar',5020519223344 , 0722786425, 4200, 'LOC002');
INSERT INTO angajati VALUES ('ANG005', 'Alexandrescu', 'Mihai', 'Manager',1980723124578, 0745890001, 5000, 'LOC007');
INSERT INTO angajati VALUES ('ANG006', 'Ana', 'Mimi', 'Ajutor de bucatar',2991215228899, 0722286409, 4800, 'LOC007');
INSERT INTO angajati VALUES ('ANG007', 'Mihalcea', 'Andreea', 'Manager',5010307123451 , 0722000001, 5300, 'LOC007');
INSERT INTO angajati VALUES ('ANG008', 'Cretu', 'Alina', 'Vanzator',6020409227784, 0723695847, 5500, 'LOC005');
INSERT INTO angajati VALUES ('ANG009', 'Dragus', 'Gabriel', 'Manager',1981101123497, 0730111222, 7860, 'LOC003');
INSERT INTO angajati VALUES ('ANG010', 'Oancea', 'Mircea', 'Vanzator',2990825123352, 0745987634, 7000, 'LOC002');
INSERT INTO angajati VALUES ('ANG011', 'Samsonovici', 'Alexandra', 'Manager',5030220129983, 0768899001, 8000, 'LOC014');
INSERT INTO angajati VALUES ('ANG012', 'Pandea', 'Oana', 'Director',6000917123458, 0752345678, 9000, 'LOC017');
INSERT INTO angajati VALUES ('ANG013', 'Popica', 'Ana', 'Manager',5020601127781, 0722000045, 8500, 'LOC015');
INSERT INTO angajati VALUES ('ANG014', 'Iohani', 'Bogdan', 'Vanzator',5030718129986, 0722000090, 4780, 'LOC020');
INSERT INTO angajati VALUES ('ANG015', 'Pop', 'Andrei', 'Asistent Director',2990419225578, 0723456789, 8000, 'LOC001');
INSERT INTO angajati VALUES ('ANG016', 'Ioan', 'Antonia', 'Vanzator',6010224123459, 0722007832, 4000, 'LOC002');
INSERT INTO angajati VALUES ('ANG017', 'Iliescu', 'Alexandru', 'Personal curatenie',1980923123349, 0722000079, 3600, 'LOC011');
INSERT INTO angajati VALUES ('ANG018', 'Dragomir', 'Maria', 'Personal curatenie',6040727297277, 0729867893, 2400, 'LOC010');
INSERT INTO angajati VALUES ('ANG019', 'Badea', 'Mario', 'Director sef',5020601127782, 0734728910, 16000, 'LOC004');
INSERT INTO angajati VALUES ('ANG020', 'Chirita', 'Sorana', 'Vanzator',1981101123489, 0768670430, 4330, 'LOC008');


INSERT INTO clienti VALUES ('CLI001','Marin','Elena',0723456781,'Str. Lalelelor nr. 12');
INSERT INTO clienti VALUES ('CLI002','Dinu','Paul',0730111223,'Bd. Mihai Eminescu nr. 84');
INSERT INTO clienti VALUES ('CLI003','Tudor','Iulia',0745987601,'Str. Avram Iancu nr. 5');
INSERT INTO clienti VALUES ('CLI004','Barbu','Cristian',0752345611,'Str. Crizantemelor nr. 33');
INSERT INTO clienti VALUES ('CLI005','Rusu','Maria',0768899002,'Aleea Trandafirilor nr. 9');
INSERT INTO clienti VALUES ('CLI006','Teodorescu','Alex',0734556677,'Str. Independentei nr. 104');
INSERT INTO clienti VALUES ('CLI007','Dobre','Mara',0723555588,'Bd. Republicii nr. 21');
INSERT INTO clienti VALUES ('CLI008','Pop','Daniel',0748554433,'Str. Garii nr. 7');
INSERT INTO clienti VALUES ('CLI009','Stan','Eliza',0739002211,'Str. Carpatilor nr. 18');
INSERT INTO clienti VALUES ('CLI010','Radu','Sorin',0761003344,'Bd. Victoriei nr. 56');
INSERT INTO clienti VALUES ('CLI011','Luca','Bianca',0722345675,'Str. Florilor nr. 2A');
INSERT INTO clienti VALUES ('CLI012','Ivan','Claudiu',0743221100,'Str. Primaverii nr. 41');
INSERT INTO clienti VALUES ('CLI013','Stoica','Mihai',0754332288,'Str. Morii nr. 88');
INSERT INTO clienti VALUES ('CLI014','Lazar','Ana',0737332200,'Aleea Castanilor nr. 3');
INSERT INTO clienti VALUES ('CLI015','Costache','Robert',0722331099,'Str. Tudor Vladimirescu nr. 29');
INSERT INTO clienti VALUES ('CLI016','Balan','Cristina',0764556678,'Str. Libertatii nr. 40');
INSERT INTO clienti VALUES ('CLI017','Enache','Diana',0752003456,'Str. Stadionului nr. 1');
INSERT INTO clienti VALUES ('CLI018','Dinu','Marius',0728991122,'Str. Mihai Viteazu nr. 3');
INSERT INTO clienti VALUES ('CLI019','Mois','Carla',0734110099,'Bd. Decebal nr. 17');
INSERT INTO clienti VALUES ('CLI020','Cojocaru','Rares',0742117788,'Str. Vrancei nr. 22');

drop table retete CASCADE CONSTRAINTS;
INSERT INTO retete VALUES ('RET001','Pizza Margherita','Blat, sos rosii, mozzarella');
INSERT INTO retete VALUES ('RET002','Pizza Pepperoni','Blat, sos rosii, mozzarella, pepperoni');
INSERT INTO retete VALUES ('RET003','Pizza Quattro Stagioni','Blat, sos rosii, sunca, ciuperci, masline, anghinare');
INSERT INTO retete VALUES ('RET004','Pizza Capricciosa','Blat, sos rosii, sunca, ciuperci, masline');
INSERT INTO retete VALUES ('RET005','Pizza Quattro Formaggi','Blat, mozzarella, gorgonzola, parmezan, pecorino');
INSERT INTO retete VALUES ('RET006','Pizza Tonno','Blat, sos rosii, ton, ceapa');
INSERT INTO retete VALUES ('RET007','Pizza Carbonara','Blat, smântâna, bacon, ou, mozzarella');
INSERT INTO retete VALUES ('RET008','Pizza Prosciutto e Funghi','Blat, sos rosii, sunca, ciuperci');
INSERT INTO retete VALUES ('RET009','Pizza Diavola','Blat, sos rosii, salam picant, mozzarella');
INSERT INTO retete VALUES ('RET010','Pizza Vegetariana','Blat, sos rosii, legume mixte');
INSERT INTO retete VALUES ('RET011','Pizza Hawaii','Blat, sos rosii, sunca, ananas, mozzarella');
INSERT INTO retete VALUES ('RET012','Pizza BBQ Chicken','Blat, sos BBQ, pui, ceapa, mozzarella');
INSERT INTO retete VALUES ('RET013','Pizza Mediterranea','Blat, sos rosii, mozzarella');
INSERT INTO retete VALUES ('RET014','Pizza Funghi','Blat, sos rosii, ciuperci, mozzarella, parmezan');
INSERT INTO retete VALUES ('RET015','Pizza Prosciutto e Rucola','Blat, sos rosii, prosciutto, rucola, mozzarella');
INSERT INTO retete VALUES ('RET016','Pizza Salami Picante','Blat, sos rosii, salam picant, mozzarella, ardei iute');
INSERT INTO retete VALUES ('RET017','Pizza Quattro Carne','Blat, sos rosii, bacon, salam, sunca, pui, mozzarella');
INSERT INTO retete VALUES ('RET018','Pizza Spinaci','Blat, sos rosii, spanac, mozzarella, parmezan');
INSERT INTO retete VALUES ('RET019','Pizza Mare e Monti','Blat, sos rosii, fructe de mare, ciuperci, mozzarella');
INSERT INTO retete VALUES ('RET020','Pizza Calzone','Blat pliat, sunca, ciuperci, mozzarella, sos rosii');



DELETE FROM retete
WHERE id_reteta IN (
  'RET001','RET002','RET004','RET005',
  'RET006','RET007','RET008','RET009','RET010',
  'RET011','RET012','RET013','RET014','RET015',
  'RET018'
);

INSERT INTO livrari VALUES ('LIV001','2025-01-10','In curs','Str. Unirii nr. 15');
INSERT INTO livrari VALUES ('LIV002','2023-01-11','Livrata','Bd. Republicii nr. 10');
INSERT INTO livrari VALUES ('LIV003','2019-06-12','In curs','Str. Garii nr. 9');
INSERT INTO livrari VALUES ('LIV004','2020-02-10','Anulata','Str. Libertatii nr. 44');
INSERT INTO livrari VALUES ('LIV005','2025-10-29','Livrata','Bd. Victoriei nr. 3');
INSERT INTO livrari VALUES ('LIV006','2025-09-25','In curs','Str. Dorobanti nr. 99');
INSERT INTO livrari VALUES ('LIV007','2015-10-16','Livrata','Str. Aviatorilor nr. 22');
INSERT INTO livrari VALUES ('LIV008','2025-01-17','In curs','Str. Cuza Voda nr. 13');
INSERT INTO livrari VALUES ('LIV009','2023-07-07','Livrata','Str. Oituz nr. 8');
INSERT INTO livrari VALUES ('LIV010','2025-11-11','In curs','Bd. Independentei nr. 55');
INSERT INTO livrari VALUES ('LIV011','2025-01-20','Livrata','Str. Florilor nr. 4');
INSERT INTO livrari VALUES ('LIV012','2025-01-21','In curs','Str. Morii nr. 14');
INSERT INTO livrari VALUES ('LIV013','2025-01-22','Livrata','Str. Carpatilor nr. 9');
INSERT INTO livrari VALUES ('LIV014','2025-01-23','Livrata','Bd. Timisoara nr. 3');
INSERT INTO livrari VALUES ('LIV015','2025-05-24','In curs','Str. Ghioceilor nr. 1');
INSERT INTO livrari VALUES ('LIV016','2025-05-29','Anulata','Str. Zambilelor nr. 11');
INSERT INTO livrari VALUES ('LIV017','2025-01-26','Livrata','Str. Mihai Eminescu nr. 50');
INSERT INTO livrari VALUES ('LIV018','2025-01-27','In curs','Str. Horea nr. 2');
INSERT INTO livrari VALUES ('LIV019','2025-01-28','Livrata','Bd. Decebal nr. 70');
INSERT INTO livrari VALUES ('LIV020','2025-08-08','In curs','Str. Avram Iancu nr. 88');

ALTER TABLE produse DISABLE CONSTRAINT FK2_PRODUS;

DELETE FROM promotii
WHERE id_promotie IN (
  'PROM001','PROM002','PROM003','PROM004','PROM005',
  'PROM006','PROM007','PROM008','PROM009','PROM010',
  'PROM011','PROM012','PROM013','PROM014','PROM015',
  'PROM016','PROM017','PROM018','PROM019','PROM020'
);
