--[CREATE]

CREATE TABLE informacje (
    id_informacje         INTEGER NOT NULL,
    czyopady              INTEGER,
    liczba_kartek         INTEGER,
    liczba_rzutow_roznych INTEGER,
    liczba_rzutow_wolnych INTEGER,
    liczba_spalonych      INTEGER
);

ALTER TABLE informacje ADD CONSTRAINT informacje_pk PRIMARY KEY ( id_informacje );

CREATE TABLE klub (
    id_klubu       INTEGER NOT NULL,
    nazwa          CLOB,
    rok_zalozenia  CLOB,
    przydomek      CLOB,
    kraj           CLOB,
    fk_id_stroju   INTEGER NOT NULL,
    fk_id_stadionu INTEGER NOT NULL
);

ALTER TABLE klub ADD CONSTRAINT klub_pk PRIMARY KEY ( id_klubu );

CREATE TABLE liga (
    id_ligi           INTEGER NOT NULL,
    nazwa             CLOB,
    region            CLOB,
    ranga             CLOB,
    nagroda           INTEGER,
    fk_id_organizacji INTEGER NOT NULL
);

ALTER TABLE liga ADD CONSTRAINT liga_pk PRIMARY KEY ( id_ligi );

CREATE TABLE mecz (
    id_meczu         INTEGER NOT NULL,
    data_rozegrania  DATE,
    fk_id_gosp       INTEGER NOT NULL,
    fk_id_gosci      INTEGER NOT NULL,
    fk_id_wynik      INTEGER NOT NULL,
    fk_id_informacje INTEGER NOT NULL
);

ALTER TABLE mecz ADD CONSTRAINT mecz_pk PRIMARY KEY ( id_meczu );

CREATE TABLE organizacja (
    id_organizacji INTEGER NOT NULL,
    nazwa          CLOB,
    region         CLOB,
    rok_zalozenia  CLOB
);

ALTER TABLE organizacja ADD CONSTRAINT organizacja_pk PRIMARY KEY ( id_organizacji );

CREATE TABLE pilkarz (
    id_pilkarz    INTEGER NOT NULL,
    imie          CLOB,
    nazwisko      CLOB,
    narodowosc    CLOB,
    data_ur       DATE,
    lepsza_noga   VARCHAR2(1),
    pozycja       CLOB,
    fk_id_sponsor INTEGER NOT NULL
);

ALTER TABLE pilkarz ADD CONSTRAINT pilkarz_pk PRIMARY KEY ( id_pilkarz );

CREATE TABLE rozgrywki (
    id_rozgrywek    INTEGER NOT NULL,
    data_rozegrania DATE,
    fk_id_ligi      INTEGER NOT NULL,
    fk_id_meczu     INTEGER NOT NULL
);

ALTER TABLE rozgrywki ADD CONSTRAINT relation_3_pk PRIMARY KEY ( id_rozgrywek );

CREATE TABLE sponsor (
    id_sponsor INTEGER NOT NULL,
    nazwa      CLOB,
    kraj       CLOB
);

ALTER TABLE sponsor ADD CONSTRAINT sponsor_pk PRIMARY KEY ( id_sponsor );

CREATE TABLE stadion (
    id_stadionu INTEGER NOT NULL,
    nazwa       CLOB,
    rok_budowy  CLOB,
    czy_dach    INTEGER,
    pojemnosc   INTEGER
);

ALTER TABLE stadion ADD CONSTRAINT stadion_pk PRIMARY KEY ( id_stadionu );

CREATE TABLE stroj (
    id_stroju     INTEGER NOT NULL,
    kolor1        CLOB,
    kolor2        CLOB,
    czydlugirekaw INTEGER,
    wzor          CLOB,
    marka         CLOB
);

ALTER TABLE stroj ADD CONSTRAINT stroj_pk PRIMARY KEY ( id_stroju );

CREATE TABLE wynik (
    id_wyniku  INTEGER NOT NULL,
    gole_gosp  INTEGER,
    gole_gosci INTEGER
);

ALTER TABLE wynik ADD CONSTRAINT wynik_pk PRIMARY KEY ( id_wyniku );

CREATE TABLE zawodnik (
    id_zawodnika  INTEGER NOT NULL,
    numer         CLOB,
    fk_id_pilkarz INTEGER NOT NULL,
    fk_id_klubu   INTEGER NOT NULL
);

ALTER TABLE zawodnik ADD CONSTRAINT relation_4_pk PRIMARY KEY ( id_zawodnika );

ALTER TABLE klub
    ADD CONSTRAINT klub_stadion_fk FOREIGN KEY ( fk_id_stadionu )
        REFERENCES stadion ( id_stadionu );

ALTER TABLE klub
    ADD CONSTRAINT klub_stroj_fk FOREIGN KEY ( fk_id_stroju )
        REFERENCES stroj ( id_stroju );

ALTER TABLE liga
    ADD CONSTRAINT liga_organizacja_fk FOREIGN KEY ( fk_id_organizacji )
        REFERENCES organizacja ( id_organizacji );

ALTER TABLE mecz
    ADD CONSTRAINT mecz_informacje_fk FOREIGN KEY ( fk_id_informacje )
        REFERENCES informacje ( id_informacje );

ALTER TABLE mecz
    ADD CONSTRAINT mecz_klub_fk FOREIGN KEY ( fk_id_gosp )
        REFERENCES klub ( id_klubu );

ALTER TABLE mecz
    ADD CONSTRAINT mecz_klub_fkv2 FOREIGN KEY ( fk_id_gosci )
        REFERENCES klub ( id_klubu );

ALTER TABLE mecz
    ADD CONSTRAINT mecz_wynik_fk FOREIGN KEY ( fk_id_wynik )
        REFERENCES wynik ( id_wyniku );

ALTER TABLE pilkarz
    ADD CONSTRAINT pilkarz_sponsor_fk FOREIGN KEY ( fk_id_sponsor )
        REFERENCES sponsor ( id_sponsor );

ALTER TABLE rozgrywki
    ADD CONSTRAINT relation_3_liga_fk FOREIGN KEY ( fk_id_ligi )
        REFERENCES liga ( id_ligi );

ALTER TABLE rozgrywki
    ADD CONSTRAINT relation_3_mecz_fk FOREIGN KEY ( fk_id_meczu )
        REFERENCES mecz ( id_meczu );

ALTER TABLE zawodnik
    ADD CONSTRAINT relation_4_klub_fk FOREIGN KEY ( fk_id_pilkarz )
        REFERENCES klub ( id_klubu );

ALTER TABLE zawodnik
    ADD CONSTRAINT relation_4_pilkarz_fk FOREIGN KEY ( fk_id_klubu )
        REFERENCES pilkarz ( id_pilkarz );

--[INSERT]

CREATE SEQUENCE counting
 	START WITH     1
 	INCREMENT BY   1;
 
insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'FIFA','WRLD','1915');
 
insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'UEFA','EUR','1922');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'CONCACAF','N-AMER','1934');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'CONMEBOL','S-AMER','1960');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'CAF','AFR','1961');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'AFC','AFC','1961');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'OFC','OCEAN','1961');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'PZPN','PL','1914');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'ISF','WRLD','1986');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'WMF','WRLD','1984');

insert into organizacja(id_organizacji,nazwa,region,rok_zalozenia)
values (counting.nextval,'BBVA','EUR','1890');

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Liga Mistrzów','EUR','5',50000000,2);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Liga Europy','EUR','3',15000000,2);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Premier League','ENG','4',40000000,2);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'La Liga','ESP','3',30000000,11);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Ligue 1','FRA','3',12000000,9);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Puchar CAF','AFR','2',5000000,5);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Puchar AFC','AFC','1',1000000,6);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Puchar OFC','OCEAN','2',22000000,7);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Puchar CONMEBOL','N-AMER','2',1000000,3);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Puchar CONCACAF','S-AMER','2',1000000,4);

insert into liga(id_ligi,nazwa,region,ranga,nagroda,FK_ID_Organizacji)
values (counting.nextval,'Ekstraklasa','PL','1',1000000,8);

CREATE SEQUENCE counting2
 	START WITH     1
 	INCREMENT BY   1;

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,1,5,6,7,2);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,0,3,12,0,0);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,1,32,1,2,2);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,1,0,2,1,2);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,0,15,16,17,12);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,0,1,6,4,23);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,0,5,20,5,1);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,0,15,20,0,0);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,1,10,3,1,9);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,0,5,6,13,22);

insert into informacje(id_informacje,czyopady,liczba_kartek,liczba_rzutow_roznych,liczba_rzutow_wolnych,liczba_spalonych)
values (counting2.nextval,0,3,13,13,13);

CREATE SEQUENCE counting3
 	START WITH     1
 	INCREMENT BY   1;

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,3,1);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,1,1);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,4,2);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,0,0);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,3,0);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,7,1);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,0,10);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,12,1);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,4,2);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,2,0);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,2,2);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,3,5);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,7,2);

insert into wynik(id_wyniku,gole_gosp,gole_gosci)
Values (counting3.nextval,4,0);

CREATE SEQUENCE counting4
 	START WITH     1
 	INCREMENT BY   1;

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'NIKE','USA');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'ADIDAS','GER');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'PUMA','GER');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'REEBOK','USA');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'SIEMENS','SWE');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'4F','PL');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'SHARP','USA');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'McDONALDs','USA');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'UMBRO','ENG');

insert into sponsor(id_sponsor,nazwa,kraj)
Values (counting4.nextval,'HUMMEL','NOR');

CREATE SEQUENCE counting5
 	START WITH     1
 	INCREMENT BY   1;

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Cristiano','Ronaldo','Portugalia','1985/02/20','P','Napastnik',1);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Lionel','Messi','Argentyna','1987/03/22','L','Napastnik',2);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Mbappe','Killian','Francja','1997/10/04','P','Napastnik',5);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Shurle','Andre','Niemcy','1989/01/20','L','Pomocnik',6);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Alcaron','Isco','Hiszpania','1991/03/25','P','Pomocnik',8);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Torres','Fernando','Hiszpania','1981/03/29','P','Napastnik',5);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Silva','David','Hiszpania','1985/03/29','L','Pomocnik',6);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Alaba','David','Austria','1994/12/04','L','Obrońca',3);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Sebastian','Haller','Francja','1993/06/22','P','Napastnik',5);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Kylian','Mbappe','Francja','1998/12/20','P','Napastnik',3);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Raheem','Sterling','Anglia','1994/12/08','P','Skrzydlowy',1);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Eden','Hazard','Belgia','1991/01/07','L','Skrzydlowy',9);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Kevin','De Bruyne','Belgia','1991/06/28','L','Pomocnik',4);

insert into Pilkarz(id_pilkarz,imie,nazwisko,narodowosc,data_ur,lepsza_noga,pozycja,fk_id_sponsor)
values(counting5.nextval,'Robert','Lewandowski','Polska','1988/08/21','L','Napastnik',7);

CREATE SEQUENCE counting6
 	START WITH     1
 	INCREMENT BY   1;

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Biały','Czerwony',1,'Paski','NIKE');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Zielony','Czarny',0,'Krata','ADIDAS');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Żółty','Pomarańczowy',1,'Czysty','PUMA');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Czerwony','Biały',0,'Paski','NIKE');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Niebieski','Biały',1,'Krata','ADIDAS');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Biały','Zielony',0,'Czysty','PUMA');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Czarny','Biały',1,'Paski','NIKE');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Żółty','Czarny',0,'Krata','ADIDAS');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Fioletowy','Biały',1,'Czysty','PUMA');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Zielony','Żółty',0,'Paski','NIKE');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Czarny','Fioletowy',1,'Krata','ADIDAS');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Biały','Czerwony',0,'Czysty','PUMA');

insert into Stroj(id_stroju,kolor1,kolor2,czydlugirekaw,wzor,marka)
values (counting6.nextval,'Niebieski','Zielony',1,'Paski','NIKE');

CREATE SEQUENCE counting7
 	START WITH     1
 	INCREMENT BY   1;

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Santiago Bernabeu','1962',1,87000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Camp Nou','1953',0,93000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Old Trafford','1931',0,68000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Estadio Benito Villamarin','1951',0,70000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Hampden Park','1978',1,50000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Stamford Bridge','1912',0,36000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Villa Park','1913',1,43000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Pepsi Arena','2013',0,30000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Borussia Park','2010',1,54000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Upton Park','1890',0,13000);

insert into Stadion(id_stadionu,nazwa,rok_budowy,czy_dach,pojemnosc)
values (counting7.nextval,'Vicage Road','1978',1,24000);

CREATE SEQUENCE counting9
 	START WITH     1
 	INCREMENT BY   1;

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Real Madryt','1902','Los Blancos','Hiszpania',1,19);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'FC Barcelona','1899','-','Hiszpania',2,20);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Man UTD','1880','-','Anglia',3,41);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Man City','1881','-','Anglia',4,42);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Juventus','1890','Stara Dama','Włochy',5,43);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'PSG','1932','-','Francja',6,44);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Legia Warszawa','1916','Wojskowi','Polska',7,45);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Palermo','1921','-','Włochy',3,44);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Liverpool','1883','-','Anglia',10,46);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'Chelsea','1891','-','Anglia',8,47);

insert into klub(id_klubu,nazwa,rok_zalozenia,przydomek,kraj,fk_id_stroju,fk_id_stadionu)
values (counting9.nextval,'PSV','1930','-','Holandia',9,48);

CREATE SEQUENCE counting10
 	START WITH     1
 	INCREMENT BY   1;

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/10/10',70,3,1,3);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/11/11',4,6,3,4);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/12/12',4,3,4,5);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/11/05',3,7,5,7);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/11/06',5,8,6,8);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/08/07',6,9,7,9);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2021/12/12',4,5,8,10);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/11/20',3,11,9,11);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/01/01',6,8,10,12);

insert into mecz(id_meczu,data_rozegrania,fk_id_gosp,fk_id_gosci,fk_id_wynik,fk_id_informacje)
values (counting10.nextval,'2022/12/11',3,8,11,6);

CREATE SEQUENCE counting11
 	START WITH     1
 	INCREMENT BY   1;

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/08/15',12,3);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/07/15',13,4);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/08/21',14,5);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2021/09/23',15,13);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/08/15',16,14);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/08/15',17,8);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/02/24',18,9);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/06/16',19,10);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2020/11/29',20,11);

insert into rozgrywki(id_rozgrywek,data_rozegrania,fk_id_ligi,fk_id_meczu)
values (counting11.nextval,'2022/10/05',21,12);

CREATE SEQUENCE counting12
 	START WITH     1
 	INCREMENT BY   1;

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'7',3,5);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'10',2,3);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'11',3,4);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'17',4,5);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'2',5,6);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'66',6,7);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'6',7,8);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'4',8,9);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'23',9,10);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'22',10,10);

insert into zawodnik(id_zawodnika,numer,fk_id_pilkarz,fk_id_klubu)
values (counting12.nextval,'3',1,7);

--[SELECT]

--3.1

select klub.Nazwa || ' ' || klub.rok_zalozenia as "Klub (rok zalozenia)" from Klub
join zawodnik on zawodnik.fk_id_klubu = klub.id_klubu
join pilkarz on zawodnik.fk_id_pilkarz = pilkarz.id_pilkarz
join sponsor on sponsor.id_sponsor = pilkarz.fk_id_sponsor
join stadion on stadion.id_stadionu = klub.fk_id_stadionu
where zawodnik.id_zawodnika = 5 
group by klub.Nazwa,klub.rok_zalozenia
having count(zawodnik.numer)>0

--3.2

select ID_meczu as "mecz", fk_id_gosci, fk_id_gosp from mecz
join wynik on wynik.id_wyniku = mecz.fk_id_wynik
where wynik.gole_gosp in (select id_wyniku from wynik)
group by id_meczu, fk_id_gosci, fk_id_gosp

select ID_meczu as "mecz", fk_id_gosci, fk_id_gosp from mecz
join wynik on wynik.id_wyniku = mecz.fk_id_wynik
where wynik.gole_gosp <all (select extract(year from data_rozegrania) as data from mecz where fk_id_wynik > 3)
group by id_meczu, fk_id_gosci, fk_id_gosp

--3.3

select distinct klub.Nazwa as "Klub", sum(wynik.gole_gosp) as "Gole u siebie" from Klub
join mecz on mecz.fk_id_gosci = klub.id_klubu
join wynik on wynik.id_wyniku = mecz.fk_id_wynik
where klub.nazwa like 'P%'
group by klub.Nazwa
order by klub.Nazwa

--3.4

create or replace view Widok as
select klub.Nazwa from Klub
join zawodnik on zawodnik.fk_id_klubu = klub.id_klubu
join pilkarz on zawodnik.fk_id_pilkarz = pilkarz.id_pilkarz
join sponsor on sponsor.id_sponsor = pilkarz.fk_id_sponsor
join stadion on stadion.id_stadionu = klub.fk_id_stadionu
where zawodnik.id_zawodnika = 5 
group by klub.Nazwa,klub.rok_zalozenia
having count(zawodnik.numer)>0;

--3.6

select liga.nazwa || ' ' || liga.region from liga 
join organizacja o on o.id_organizacji = liga.fk_id_organizacji
where o.nazwa = :nazwa and liga.ranga = :ranga

--[UPDATE]

update liga
set Region = 'dreamland' 
where nazwa like 'L%'

update stadion
set Czy_Dach = 1 
where Czy_Dach = 0
u
pdate stadion
set Czy_Dach = 1 
where nazwa not like 'Camp Nou'

update stroj
set wzor = 'Paski'
where marka = :marka

update informacje
set czyopady = 1
where liczba spalonych between 1 and :liczba

--[DELETE]

delete mecz 
where fk_id_gosp = 1

delete mecz 
where data_rozegrania like '2020%'

delete pilkarz
where extract(year from data_ur) > 2000

delete zawodnik
where numer = '7'

delete zawodnik
where fk_id_klubu between 1 and :liczba