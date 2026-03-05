UPDATE produse
SET cod_promotie = 'PROM001'
WHERE id_produs IN ('PROD001', 'PROD002', 'PROD003');

UPDATE produse
SET cod_promotie = 'PROM009'
WHERE id_produs IN ('PROD004', 'PROD005');

// inceput interogari

update angajati set telefon_angajat='0786548991' where nume_angajat='Popescu';

select nume_angajat, prenume_angajat from angajati order by nume_angajat DESC;

select nume_client, prenume_client from clienti where nume_client like 'C%';

select nume_angajat as nume from angajati where nume_angajat like 'D%' union select nume_client from clienti where nume_client like 'D%';

select sum(nr_angajati_locatie) from locatii;

select count(*) from locatii;

select salariu_angajat, count(*) as nr_angajati from angajati where salariu_angajat>4000 group by salariu_angajat;

select avg(salariu_angajat) as venit_mediu, max(salariu_angajat) as venit_maxim, min(salariu_angajat) as venit_minim from angajati;

select salariu_angajat from angajati where salariu_angajat between 1000 and 5000;

select 'Comanda ' || com.nr_comanda || ' apartine clientului ' || c.nume_client || ' si este livrata la ' || l.adresa_livrare as propozitie from comenzi com
JOIN clienti c on com.cod_client=c.id_client 
JOIN livrari l on com.cod_livrare=l.id_livrare;

select functie_angajat, count(*) as nr_angajati from angajati where salariu_angajat=8000 group by functie_angajat;

select nume_angajat, prenume_angajat, salariu_angajat, salariu_angajat*0.84 as venit_dupa_impozit from angajati;

select * from produse cross join comenzi cross join promotii;

select * from plati natural join clienti;

SELECT p.id_produs, p.nume_produs, p.pret_produs, c.id_comanda, c.data_comanda
FROM produse p
INNER JOIN comenzi c
ON p.cod_comanda = c.id_comanda;        // inner join intre produse si comenzi

SELECT pr.nume_promotie,
       COUNT(p.id_produs) AS nr_produse_vandute,
       SUM(p.pret_produs) AS total_vanzari
FROM produse p
INNER JOIN promotii pr
    ON p.cod_promotie = pr.id_promotie
GROUP BY pr.nume_promotie
ORDER BY total_vanzari DESC; //total vanzari pe promotie

SELECT id_reteta, nume_reteta, descriere_reteta
FROM retete
WHERE descriere_reteta LIKE '%mozzarella%';

select nume_angajat, prenume_angajat as ANGvsCLI from angajati where nume_angajat like 'C%' 
union
select nume_client, prenume_client from clienti where nume_client like 'C%';

create view l_livrari_dupa_2019 as select * from livrari where data_livrare > '2019-06-12';

CREATE OR REPLACE TRIGGER trig_produs_insert
AFTER INSERT ON produse
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Produs adaugat: ' || :NEW.nume_produs);
END;
/

INSERT INTO produse (id_produs, nume_produs, tip_produs, pret_produs)
VALUES ('PROD021', 'Pizza Funghi', 'Pizza', 35);

INSERT INTO produse (id_produs, nume_produs, tip_produs, pret_produs)
VALUES ('PROD024', 'Pizza cu porumb dulce', 'Pizza', 49);
