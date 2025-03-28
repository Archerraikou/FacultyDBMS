CREATE SEQUENCE activitate_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE persoana_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE bursa_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE club_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE grupa_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE examen_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE materie_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE proiect_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE departament_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE persoane (
    id_persoana INT DEFAULT persoana_seq.NEXTVAL PRIMARY KEY,
    nume VARCHAR(100),
    varsta INT,
    email VARCHAR(100),
    telefon VARCHAR(10)
);
INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Nedelcu Daniel', 49, 'nedelcu.daniel@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Stanga Alexandru', 60, 'stanga.alexandru@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Boureanu Tudor', 19, 'boureanu.tudor@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Stan David', 20, 'stan.david@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Veisa Radu', 21, 'veisa.radu@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Dinca Mario', 20, 'dinca.mario@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Zaharia Lorin', 21, 'zaharia.lorin@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Nedelcu Vlad', 33, 'vlad.nedelcu@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Ion Popescu', 47, 'popescu.ion@gmail.com', '0712345678');

INSERT INTO persoane (nume, varsta, email, telefon) 
VALUES ('Mihail Eminescu', 55, 'eminescu.mihail@gmail.com', '0712345678');

CREATE TABLE departamente (
    id_departament INT DEFAULT departament_seq.NEXTVAL PRIMARY KEY,
    nume_departament VARCHAR(100)
);
INSERT INTO departamente (nume_departament) VALUES ('Web development');
INSERT INTO departamente (nume_departament) VALUES ('AI');
INSERT INTO departamente (nume_departament) VALUES ('Baze de date');
INSERT INTO departamente (nume_departament) VALUES ('OOP');
INSERT INTO departamente (nume_departament) VALUES ('Matematica');


CREATE TABLE grupe (
    id_grupa INT DEFAULT grupa_seq.NEXTVAL PRIMARY KEY,
    nume_grupa VARCHAR(100)
);

INSERT INTO grupe (nume_grupa) VALUES ('143');
INSERT INTO grupe (nume_grupa) VALUES ('243');
INSERT INTO grupe (nume_grupa) VALUES ('343');
INSERT INTO grupe (nume_grupa) VALUES ('142');
INSERT INTO grupe (nume_grupa) VALUES ('242');


CREATE TABLE studenti (
    id_persoana INT PRIMARY KEY,
    id_grupa INT,
    an INT CHECK (an in (1,2,3)),
    FOREIGN KEY (id_persoana) REFERENCES persoane(id_persoana),
    FOREIGN KEY (id_grupa) REFERENCES grupe(id_grupa)
);
INSERT INTO studenti (id_persoana, id_grupa, an) VALUES (3, 1, 1);
INSERT INTO studenti (id_persoana, id_grupa, an) VALUES (4, 2, 2);
INSERT INTO studenti (id_persoana, id_grupa, an) VALUES (5, 3, 3);
INSERT INTO studenti (id_persoana, id_grupa, an) VALUES (6, 5, 2);
INSERT INTO studenti (id_persoana, id_grupa, an) VALUES (7, 3, 3);


CREATE TABLE profesori (
    id_persoana INT PRIMARY KEY,
    id_departament INT,
    FOREIGN KEY (id_persoana) REFERENCES persoane(id_persoana),
    FOREIGN KEY (id_departament) REFERENCES departamente(id_departament)
);

INSERT INTO profesori (id_persoana, id_departament) VALUES (1, 1);
INSERT INTO profesori (id_persoana, id_departament) VALUES (2, 4);
INSERT INTO profesori (id_persoana, id_departament) VALUES (8, 3);
INSERT INTO profesori (id_persoana, id_departament) VALUES (9, 5);
INSERT INTO profesori (id_persoana, id_departament) VALUES (10, 2);


CREATE TABLE cluburi (
    id_club INT DEFAULT club_seq.NEXTVAL PRIMARY KEY,
    nume_club VARCHAR(100)
);

INSERT INTO cluburi (nume_club) VALUES ('Clubul de sah');
INSERT INTO cluburi (nume_club) VALUES ('Clubul de cibernetica');
INSERT INTO cluburi (nume_club) VALUES ('Clubul de arte');
INSERT INTO cluburi (nume_club) VALUES ('Clubul de jocuri video');
INSERT INTO cluburi (nume_club) VALUES ('Clubul de lectura');


CREATE TABLE membri (
    id_student INT,
    id_club INT,
    PRIMARY KEY (id_student, id_club),
    FOREIGN KEY (id_club) REFERENCES cluburi(id_club),
    FOREIGN KEY (id_student) REFERENCES studenti(id_persoana)
);

INSERT INTO membri (id_student, id_club) VALUES (3, 1);
INSERT INTO membri (id_student, id_club) VALUES (4, 2);
INSERT INTO membri (id_student, id_club) VALUES (5, 3);
INSERT INTO membri (id_student, id_club) VALUES (6, 4);
INSERT INTO membri (id_student, id_club) VALUES (7, 5);
INSERT INTO membri (id_student, id_club) VALUES (3, 2);
INSERT INTO membri (id_student, id_club) VALUES (4, 3);
INSERT INTO membri (id_student, id_club) VALUES (5, 4);
INSERT INTO membri (id_student, id_club) VALUES (6, 5);
INSERT INTO membri (id_student, id_club) VALUES (7, 1);


CREATE TABLE burse (
    id_bursa INT DEFAULT bursa_seq.NEXTVAL PRIMARY KEY,
    id_student INT,
    tip VARCHAR(20) CHECK (tip IN ('sociala', 'de performanta')),
    valoare INT,
    FOREIGN KEY (id_student) REFERENCES studenti(id_persoana)
);

INSERT INTO burse (id_student, tip, valoare) VALUES (3, 'sociala', 500);
INSERT INTO burse (id_student, tip, valoare) VALUES (5, 'de performanta', 1000);
INSERT INTO burse (id_student, tip, valoare) VALUES (4, 'sociala', 600);
INSERT INTO burse (id_student, tip, valoare) VALUES (7, 'de performanta', 1100);
INSERT INTO burse (id_student, tip, valoare) VALUES (5, 'sociala', 700);


CREATE TABLE activitati (
    id_activitate INT DEFAULT activitate_seq.NEXTVAL PRIMARY KEY,
    locatie VARCHAR(100),
    data DATE
);

INSERT INTO activitati (locatie, data) 
VALUES ('Sala Palatului', TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO activitati (locatie, data) 
VALUES ('Gradina Botanica', TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO activitati (locatie, data) 
VALUES ('Gradina Japoneza', TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO activitati (locatie, data) 
VALUES ('Centrul vechi', TO_DATE('2023-08-01', 'YYYY-MM-DD'));
INSERT INTO activitati (locatie, data) 
VALUES ('Parc', TO_DATE('2023-09-01', 'YYYY-MM-DD'));


CREATE TABLE participanti (
    id_persoana INT,
    id_activitate INT,
    PRIMARY KEY (id_persoana, id_activitate),
    FOREIGN KEY (id_persoana) REFERENCES persoane(id_persoana),
    FOREIGN KEY (id_activitate) REFERENCES activitati(id_activitate)
);

INSERT INTO participanti (id_persoana, id_activitate) VALUES (1, 1);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (2, 2);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (7, 3);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (4, 4);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (5, 5);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (6, 2);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (5, 3);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (8, 4);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (1, 5);
INSERT INTO participanti (id_persoana, id_activitate) VALUES (2, 1);


CREATE TABLE proiecte_cercetare (
    id_proiect INT DEFAULT proiect_seq.NEXTVAL PRIMARY KEY,
    premiu VARCHAR(100)
);

INSERT INTO proiecte_cercetare (premiu) VALUES ('Premiul 3');
INSERT INTO proiecte_cercetare (premiu) VALUES ('Premiul 2');
INSERT INTO proiecte_cercetare (premiu) VALUES ('Premiul 1');
INSERT INTO proiecte_cercetare (premiu) VALUES ('Premiul 3');
INSERT INTO proiecte_cercetare (premiu) VALUES ('Premiul 1');


CREATE TABLE cercetari (
    id_proiect INT,
    id_profesor INT,
    PRIMARY KEY (id_proiect, id_profesor),
    FOREIGN KEY (id_proiect) REFERENCES proiecte_cercetare(id_proiect),
    FOREIGN KEY (id_profesor) REFERENCES profesori(id_persoana)
);

INSERT INTO cercetari (id_proiect, id_profesor) VALUES (1, 1);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (2, 2);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (5, 9);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (4, 10);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (5, 2);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (1, 8);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (4, 1);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (3, 9);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (2, 8);
INSERT INTO cercetari (id_proiect, id_profesor) VALUES (5, 1);


CREATE TABLE materii (
    id_materie INT DEFAULT materie_seq.NEXTVAL PRIMARY KEY,
    nume_materie VARCHAR(100),
    an INT CHECK (an IN (1, 2, 3)),
    credite INT
);

INSERT INTO materii (nume_materie, an, credite) VALUES ('Baze de date', 1, 4);
INSERT INTO materii (nume_materie, an, credite) VALUES ('Tehnici web', 2, 4);
INSERT INTO materii (nume_materie, an, credite) VALUES ('Programarea algoritmilor', 3, 6);
INSERT INTO materii (nume_materie, an, credite) VALUES ('Sisteme de operare', 1, 5);
INSERT INTO materii (nume_materie, an, credite) VALUES ('Structuri de date', 2, 5);


CREATE TABLE examene (
    id_examen INT DEFAULT examen_seq.NEXTVAL PRIMARY KEY,
    id_materie INT,
    dificultate VARCHAR(10) CHECK (dificultate IN ('usoara', 'medie', 'grea')),
    data DATE,
    FOREIGN KEY (id_materie) REFERENCES materii(id_materie)
);
INSERT INTO examene (id_materie, dificultate, data) 
VALUES (1, 'usoara', TO_DATE('2023-06-15', 'YYYY-MM-DD'));
INSERT INTO examene (id_materie, dificultate, data) 
VALUES (2, 'medie', TO_DATE('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO examene (id_materie, dificultate, data) 
VALUES (3, 'grea', TO_DATE('2023-06-25', 'YYYY-MM-DD'));
INSERT INTO examene (id_materie, dificultate, data) 
VALUES (2, 'usoara', TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO examene (id_materie, dificultate, data)
 VALUES (5, 'medie', TO_DATE('2023-07-05', 'YYYY-MM-DD'));


CREATE TABLE student_examen (
    id_student INT,
    id_examen INT,
    nota INT,
    PRIMARY KEY (id_student, id_examen),
    FOREIGN KEY (id_student) REFERENCES studenti(id_persoana),
    FOREIGN KEY (id_examen) REFERENCES examene(id_examen)
);

INSERT INTO student_examen (id_student, id_examen, nota) VALUES (3, 1, 8);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (4, 2, 7);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (4, 4, 9);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (7, 5, 4);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (4, 5, 5);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (6, 2, 10);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (6, 4, 8);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (7, 3, 9);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (5, 3, 4);
INSERT INTO student_examen (id_student, id_examen, nota) VALUES (6, 5, 5);


CREATE TABLE cursuri (
    id_grupa INT,
    id_profesor INT,
    id_materie INT,
    PRIMARY KEY (id_grupa, id_profesor, id_materie),
    FOREIGN KEY (id_grupa) REFERENCES grupe(id_grupa),
    FOREIGN KEY (id_profesor) REFERENCES profesori(id_persoana),
    FOREIGN KEY (id_materie) REFERENCES materii(id_materie)
);

INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (1, 1, 1);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (2, 2, 2);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (3, 9, 3);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (4, 10, 4);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (5, 1, 5);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (1, 8, 4);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (2, 9, 5);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (3, 10, 3);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (4, 1, 4);
INSERT INTO cursuri (id_grupa, id_profesor, id_materie) VALUES (5, 2, 2);

--6.
CREATE OR REPLACE PROCEDURE StudentMedieBursa (
    p_club cluburi.nume_club%TYPE,
    p_nota_min NUMBER
)
AS
    club_exception EXCEPTION;
    TYPE info_student IS RECORD (
        id_student studenti.id_persoana%TYPE,
        medie NUMBER);
    TYPE tabel1_studenti IS TABLE OF info_student INDEX BY PLS_INTEGER;
    TYPE tabel2_studenti IS TABLE OF info_student;
    TYPE tabel3_studenti IS VARRAY(100) OF info_student;
    tabel1 tabel1_studenti;
    tabel2 tabel2_studenti := tabel2_studenti();
    tabel3 tabel3_studenti := tabel3_studenti();
    test_nume_club NUMBER;
BEGIN
    SELECT COUNT(nume_club) INTO test_nume_club
    FROM cluburi
    WHERE nume_club=p_club;
    IF test_nume_club=0 THEN
        RAISE club_exception;
    END IF;
    SELECT id_persoana,AVG(nota) BULK COLLECT INTO tabel1
    FROM studenti s JOIN student_examen se ON s.id_persoana=se.id_student
    WHERE id_persoana NOT IN (SELECT id_student FROM membri m JOIN cluburi c ON m.id_club=c.id_club
                              WHERE nume_club=p_club)
    GROUP BY id_persoana;
    SELECT id_persoana,AVG(nota) BULK COLLECT INTO tabel2 
    FROM studenti s JOIN student_examen se ON s.id_persoana=se.id_student
    WHERE id_persoana IN (SELECT id_student FROM membri m JOIN cluburi c ON m.id_club=c.id_club
                              WHERE nume_club=p_club)
    GROUP BY id_persoana;
    FOR i IN tabel1.FIRST..tabel1.LAST LOOP
        IF tabel1(i).medie < p_nota_min THEN
            UPDATE burse
            SET valoare=valoare-100
            WHERE tip='de performanta' AND id_student=tabel1(i).id_student;
        ELSE 
            tabel3.EXTEND();
            tabel3(tabel3.COUNT):=tabel1(i);
        END IF;
    END LOOP;
    FOR i in tabel2.FIRST..tabel2.LAST LOOP
        IF tabel2(i).medie > p_nota_min THEN
            UPDATE burse
            SET valoare=valoare+100
            WHERE tip='de performanta' AND id_student=tabel2(i).id_student;
        ELSE 
            tabel3.EXTEND();
            tabel3(tabel3.COUNT):=tabel1(i);
        END IF;
    END LOOP;
    FOR i IN tabel3.FIRST..tabel3.LAST LOOP
        UPDATE burse
        SET valoare=valoare+50
        WHERE tip='de performanta' AND id_student=tabel3(i).id_student;
    END LOOP;
EXCEPTION
    WHEN club_exception THEN
        RAISE_APPLICATION_ERROR(-20000, 'Clubul introdus nu exista');
END StudentMedieBursa;
/
BEGIN
    StudentMedieBursa('Clubul de sah',7);
END;
/
DECLARE
    club_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(club_exception,-20000);
BEGIN
    StudentMedieBursa('Club care nu exista',7);
EXCEPTION
    WHEN club_exception THEN
       	DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--7.
CREATE OR REPLACE FUNCTION EvalDepartament(
    p_departament departamente.nume_departament%TYPE,
    p_prag_medie NUMBER
)
RETURN BOOLEAN
AS
    CURSOR student_cursor IS
        SELECT s.id_persoana, s.id_grupa
        FROM studenti s JOIN cursuri c ON s.id_grupa = c.id_grupa
        JOIN profesori pr ON c.id_profesor = pr.id_persoana 
        JOIN departamente d ON pr.id_departament = d.id_departament
        JOIN persoane p ON s.id_persoana = p.id_persoana
        WHERE d.nume_departament = p_departament;
    CURSOR examen_cursor(p_id_student NUMBER, p_id_grupa NUMBER) IS
        SELECT id_examen,nota,id_persoana,id_grupa 
        FROM (SELECT e.id_examen,se.nota,s.id_persoana,id_grupa 
              FROM studenti s 
              JOIN student_examen se ON s.id_persoana=se.id_student
              JOIN examene e ON e.id_examen=se.id_examen
              WHERE id_persoana=p_id_student)
        WHERE id_examen IN (SELECT id_examen FROM examene e 
                            JOIN cursuri c ON e.id_materie=c.id_materie
                            JOIN profesori p ON p.id_persoana=c.id_profesor
                            JOIN departamente d ON p.id_departament=d.id_departament
                            WHERE c.id_grupa=p_id_grupa
                            AND nume_departament=p_departament);
    v_student student_cursor%ROWTYPE;
    v_examen examen_cursor%ROWTYPE;
    v_suma_note NUMBER := 0;
    v_nr_examene NUMBER := 0;
    v_media_departament NUMBER;
    department_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(department_exception, -20002);
    zero_exception EXCEPTION;
    test_departament NUMBER;
BEGIN
    SELECT COUNT(*) INTO test_departament
    FROM departamente 
    WHERE nume_departament=p_departament;
    IF test_departament = 0 THEN
        RAISE_APPLICATION_ERROR (-20002, 'Departamentul introdus nu exista');
    END IF;
    OPEN student_cursor;
    LOOP
        FETCH student_cursor INTO v_student;
        EXIT WHEN student_cursor%NOTFOUND;
        OPEN examen_cursor(v_student.id_persoana,v_student.id_grupa);
        LOOP
            FETCH examen_cursor INTO v_examen;
            EXIT WHEN examen_cursor%NOTFOUND;
            v_suma_note := v_suma_note + v_examen.nota;
            DBMS_OUTPUT.PUT_LINE(v_examen.nota);
            v_nr_examene := v_nr_examene + 1;
        END LOOP;
        CLOSE examen_cursor;
    END LOOP;
    CLOSE student_cursor;
    IF v_nr_examene = 0 THEN
        RAISE zero_exception;
    END IF;
    v_media_departament := v_suma_note / v_nr_examene;
    DBMS_OUTPUT.PUT_LINE(v_media_departament);
    IF v_media_departament >= p_prag_medie THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
    WHEN department_exception THEN
        RAISE_APPLICATION_ERROR (-20002, 'Departamentul introdus nu exista');
    WHEN zero_exception THEN
        RAISE_APPLICATION_ERROR (-20001, 'Nu exista studenti care au dat examen la materii cu profesori din departamentul introdus');
END EvalDepartament;
/
DECLARE
    v_rezultat VARCHAR2(100);
BEGIN
    IF EvalDepartament('AI',8) THEN
        v_rezultat := 'True';
    ELSE v_rezultat := 'False';
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_rezultat);
END;
/
DECLARE
    v_rezultat VARCHAR2(100);
    department_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(department_exception,-20002);
BEGIN
    IF EvalDepartament('Departament care nu exista',3) THEN
        v_rezultat := 'True';
    ELSE v_rezultat := 'False';
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_rezultat);
EXCEPTION
    WHEN department_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
DECLARE
    v_rezultat VARCHAR2(100);
    zero_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(zero_exception,-20001);
BEGIN
    IF EvalDepartament('OOP',3) THEN
        v_rezultat := 'True';
    ELSE v_rezultat := 'False';
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_rezultat);
EXCEPTION
    WHEN zero_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--8.
CREATE OR REPLACE FUNCTION BurseDepartament(
    p_departament VARCHAR2
)
RETURN NUMBER
AS
    v_id_student persoane.id_persoana%TYPE;
    v_nume_student persoane.nume%TYPE;
    v_numar_burse NUMBER := 0;
    v_bursa burse.valoare%TYPE := 0;
    bursa_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(bursa_exception,-1422);
    student_exception EXCEPTION;
    CURSOR student_cursor IS
        SELECT s.id_persoana, p.nume
        FROM studenti s
        JOIN persoane p ON s.id_persoana = p.id_persoana
        JOIN grupe g ON s.id_grupa = g.id_grupa
        JOIN cursuri c ON g.id_grupa = c.id_grupa
        JOIN profesori pr ON c.id_profesor = pr.id_persoana
        JOIN departamente d ON pr.id_departament = d.id_departament
        WHERE d.nume_departament = p_departament
        GROUP BY s.id_persoana, p.nume;

BEGIN
    OPEN student_cursor;
    FETCH student_cursor INTO v_id_student, v_nume_student;
    IF student_cursor%NOTFOUND THEN
        RAISE student_exception;
    END IF;
    LOOP
        
        EXIT WHEN student_cursor%NOTFOUND;
        BEGIN
            SELECT valoare
            INTO v_bursa
            FROM burse
            WHERE id_student = v_id_student AND tip='de performanta';
            v_numar_burse := v_numar_burse + 1;
            DBMS_OUTPUT.PUT_LINE(v_id_student || ' ' || v_nume_student || ' ' || v_bursa);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Studentul ' || v_nume_student || ' nu are nicio bursa de performanta');
            WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('Studentul ' || v_nume_student || ' are mai multe burse de performanta');
                RAISE;
        END;
        FETCH student_cursor INTO v_id_student, v_nume_student;
    END LOOP;
    CLOSE student_cursor;
    RETURN v_numar_burse;
EXCEPTION
    WHEN student_exception THEN
        RAISE_APPLICATION_ERROR(-20000, 'Departamentul introdus nu are studenti.');
    WHEN bursa_exception THEN
        RAISE_APPLICATION_ERROR(-20001, 'Un student are mai mult de o bursa de performanta.');
END BurseDepartament;
/
DECLARE
    v_burse NUMBER;
BEGIN
    v_burse := BurseDepartament('AI');
    DBMS_OUTPUT.PUT_LINE(v_burse);
END;
/
DECLARE
    v_burse NUMBER;
    student_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(student_exception,-20000);
BEGIN
    v_burse := BurseDepartament('OOP');
    DBMS_OUTPUT.PUT_LINE(v_burse);
EXCEPTION
    WHEN student_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
DECLARE
    v_burse NUMBER;
    bursa_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(bursa_exception,-20001);
BEGIN
    v_burse := BurseDepartament('Web development');
    DBMS_OUTPUT.PUT_LINE(v_burse);
EXCEPTION
    WHEN bursa_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--9.
CREATE OR REPLACE PROCEDURE CalcMedii(
    p_an NUMBER,
    p_media_generala BOOLEAN,
    p_materie VARCHAR2 DEFAULT NULL
) 
AS
    parametri_exception EXCEPTION;
    materie_exception EXCEPTION;
    v_materie_exista NUMBER;
    v_materie_in_an NUMBER;
    v_nota_finala NUMBER;
    v_media_generala NUMBER;
    v_total_credite NUMBER;
    TYPE info_student IS RECORD (
        id_student studenti.id_persoana%TYPE,
        nume_student persoane.nume%TYPE,
        medie NUMBER
    );
    TYPE tabel_student IS TABLE OF info_student;
    tabel_medii tabel_student := tabel_student();
BEGIN
    IF p_media_generala AND p_materie IS NOT NULL THEN
        RAISE parametri_exception;
    END IF;
    IF NOT p_media_generala AND p_materie IS NULL THEN
        RAISE parametri_exception;
    END IF;
    IF p_materie IS NOT NULL THEN
        SELECT COUNT(*) INTO v_materie_exista
        FROM materii
        WHERE nume_materie = p_materie;
        IF v_materie_exista = 0 THEN
            RAISE materie_exception;
        END IF;
        SELECT COUNT(*) INTO v_materie_in_an
        FROM materii
        WHERE nume_materie = p_materie AND an=p_an;
        IF v_materie_in_an = 0 THEN
            RAISE materie_exception;
        END IF;
    END IF;
    IF NOT p_media_generala THEN
        SELECT id_student,nume,AVG(se.nota)
        BULK COLLECT INTO tabel_medii
        FROM persoane p
        JOIN student_examen se ON p.id_persoana=se.id_student
        JOIN examene e ON se.id_examen = e.id_examen
        JOIN cursuri c ON e.id_materie = c.id_materie
        JOIN materii m on c.id_materie = m.id_materie
        WHERE m.nume_materie = p_materie
        GROUP BY id_student,nume;
        FOR i IN tabel_medii.FIRST..tabel_medii.LAST LOOP
            DBMS_OUTPUT.PUT_LINE('Studentul ' || tabel_medii(i).nume_student || ' are media ' || tabel_medii(i).medie || ' la materia ' || p_materie);
        END LOOP;
    ELSE
        SELECT id_student,nume,SUM(medie*credite)/SUM(credite) medie_finala
        BULK COLLECT INTO tabel_medii
        FROM (SELECT id_student,nume,AVG(nota) medie,e.id_materie,credite 
              FROM persoane p
              JOIN studenti s on s.id_persoana=p.id_persoana
              JOIN student_examen se ON p.id_persoana=se.id_student
              JOIN examene e ON se.id_examen=e.id_examen
              JOIN materii m ON m.id_materie=e.id_materie
              WHERE s.an=p_an
              GROUP BY e.id_materie,id_student,nume,credite)
        GROUP BY id_student,nume;
        FOR i IN tabel_medii.FIRST..tabel_medii.LAST LOOP
            DBMS_OUTPUT.PUT_LINE('Studentul ' || tabel_medii(i).nume_student || ' are media finala ' || tabel_medii(i).medie);
        END LOOP;
    END IF;

EXCEPTION
    WHEN parametri_exception THEN
        RAISE_APPLICATION_ERROR(-20000,'Procedura nu a fost apelata corect');
    WHEN materie_exception THEN
        RAISE_APPLICATION_ERROR(-20001,'Materia introdusa nu exista sau este in alt an');
END CalcMedii;
/
BEGIN
    CalcMedii(2,False,'Tehnici web');
END;
/
DECLARE
    parametrii_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(parametrii_exception,-20000);
BEGIN
    CalcMedii(2,True,'Tehnici web');
EXCEPTION
    WHEN parametrii_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
DECLARE
    materie_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(materie_exception,-20001);
BEGIN
    CalcMedii(1,False,'Tehnici web');
EXCEPTION
    WHEN materie_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--10.
CREATE OR REPLACE TRIGGER CheckMaterii
AFTER INSERT OR UPDATE OF an,credite ON materii
DECLARE
    credite_exception EXCEPTION;
    TYPE info_an IS RECORD(
        an materii.an%TYPE,
        credite materii.credite%TYPE
    );
    TYPE tabel_an is TABLE OF info_an;
    v_ani tabel_an := tabel_an();

BEGIN
    SELECT an,SUM(credite)
    BULK COLLECT INTO v_ani
    FROM materii
    GROUP BY an;
    FOR i IN v_ani.FIRST..v_ani.LAST LOOP
        IF v_ani(i).credite>60 THEN
            RAISE credite_exception;
        END IF;
    END LOOP;
EXCEPTION
    WHEN credite_exception THEN
        RAISE_APPLICATION_ERROR(-20000,'Materiile de pe un an au mai mult de 60 de credite adunate');
END CheckMaterii;
/
DECLARE
    credite_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(credite_exception,-20000);
BEGIN
    INSERT INTO materii (nume_materie,an,credite)
    VALUES ('Programare functionala','1','60');
EXCEPTION
    WHEN credite_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
--11.
CREATE OR REPLACE TRIGGER CheckExamen
    BEFORE INSERT OR UPDATE OR DELETE ON student_examen
    FOR EACH ROW
DECLARE
    test_materie NUMBER;
BEGIN
    IF INSERTING OR UPDATING THEN
        SELECT COUNT(*)
        INTO test_materie
        FROM materii m
        JOIN examene e on m.id_materie=e.id_materie
        WHERE m.id_materie IN (SELECT m.id_materie
                               FROM materii m
                               JOIN cursuri c on m.id_materie=c.id_materie 
                               JOIN grupe g on c.id_grupa=g.id_grupa
                               JOIN studenti s on s.id_grupa=g.id_grupa
                               WHERE s.id_persoana=:NEW.id_student)
        AND e.id_examen=:NEW.id_examen;
        DBMS_OUTPUT.PUT_LINE(test_materie);
        IF test_materie=0 THEN
            RAISE_APPLICATION_ERROR(-20000,'Studentul nu poate da examen la o materie pe care nu o face');
        END IF;
    ELSE
        RAISE_APPLICATION_ERROR(-20001,'Nu aveti voie sa stergeti un examen al unui student');
    END IF;
END CheckExamen;
/
DECLARE
    student_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(student_exception,-20000);
BEGIN
    INSERT INTO student_examen
    VALUES (7,2,10);
EXCEPTION
    WHEN student_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
DECLARE
    examen_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(examen_exception,-20001);
BEGIN
    DELETE FROM student_examen;
EXCEPTION
    WHEN examen_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--12.
CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1;
CREATE TABLE log (
    id_log INT DEFAULT log_seq.NEXTVAL PRIMARY KEY,
    utilizator VARCHAR2(50),
    obiect VARCHAR2(100),
    operatiune VARCHAR2(50)
);
CREATE OR REPLACE TRIGGER CheckSchema
AFTER ALTER OR DROP
ON SCHEMA
DECLARE
    nota_exception EXCEPTION;
    examene_exception EXCEPTION;
    eroare_stergere_student_examen EXCEPTION;
    v_operatiune VARCHAR2(50);
    v_obiect_nume VARCHAR2(100);
    v_obiect_tip VARCHAR2(100);
    v_utilizator VARCHAR2(50);

BEGIN
    v_operatiune := ora_sysevent;
    v_utilizator := SYS_CONTEXT('USERENV', 'SESSION_USER');
    v_obiect_nume := ora_dict_obj_name;
    v_obiect_tip := ora_dict_obj_type;
    IF v_operatiune = 'DROP' AND v_obiect_nume = 'STUDENT_EXAMEN' AND v_obiect_tip = 'TABLE' THEN
        RAISE nota_exception;
    END IF;
    IF v_operatiune = 'ALTER' AND v_obiect_nume = 'STUDENT_EXAMEN' AND v_obiect_tip = 'TABLE' THEN
        RAISE examene_exception;
    END IF;
    IF v_obiect_nume != 'LOG' THEN
        INSERT INTO log (utilizator, obiect, operatiune)
        VALUES (v_utilizator, v_obiect_nume, v_operatiune);
    END IF;
EXCEPTION
    WHEN nota_exception THEN
        RAISE_APPLICATION_ERROR(-20000,'Nu aveti voie sa stergeti notele de la examene');
    WHEN examene_exception THEN
        RAISE_APPLICATION_ERROR(-20001,'Nu aveti voie sa stergeti tabelul student_examen');
END CheckSchema;
/
ALTER TABLE student_examen
DROP COLUMN nota;
ALTER TABLE studenti
ADD Facebook VARCHAR2(100);
ALTER TABLE studenti
DROP COLUMN Facebook;
SELECT * FROM log;

--13.
CREATE OR REPLACE PACKAGE BurseDePerformanta IS
    TYPE t_student IS RECORD (
        id_student      studenti.id_persoana%TYPE,
        nume            persoane.nume%TYPE,
        medie           NUMBER(5,2),
        eligibil_bursa  VARCHAR2(100)
    );
    TYPE t_statistici IS RECORD (
        total_studenti   NUMBER,
        studenti_eligibili NUMBER,
        suma_bursa      NUMBER(10,1)
    );
    CURSOR c_studenti IS
        SELECT s.id_persoana id_student, nume
        FROM studenti s
        JOIN persoane p on s.id_persoana=p.id_persoana;
    TYPE t_lista_studenti IS TABLE OF t_student;
    prag_exception Exception;
    student_exception Exception;
    
    FUNCTION CalcMedie(p_id_student NUMBER) RETURN NUMBER;

    FUNCTION VerifEligibil(p_id_student NUMBER, p_prag NUMBER) RETURN VARCHAR2;

    PROCEDURE AcordaBurse(p_buget NUMBER, p_prag NUMBER);

    FUNCTION SumaTotalaBurse RETURN NUMBER;

    FUNCTION DistribuieFondBurse(p_buget NUMBER, p_prag NUMBER) RETURN NUMBER;
    
    PROCEDURE RaportPachet(p_buget NUMBER, p_prag NUMBER);
    
    FUNCTION StatisticiBurse(p_buget NUMBER, p_prag NUMBER) RETURN t_statistici;

END BurseDePerformanta;
/
CREATE OR REPLACE PACKAGE BODY BurseDePerformanta IS

    FUNCTION CalcMedie(
        p_id_student NUMBER
    ) 
    RETURN NUMBER   
    AS
        v_medie NUMBER(5,2);
    BEGIN
        SELECT SUM(medie*credite)/SUM(credite)
        INTO v_medie
        FROM (SELECT AVG(nota) medie,e.id_materie,credite 
              FROM studenti s
              JOIN student_examen se ON s.id_persoana=se.id_student
              JOIN examene e ON se.id_examen=e.id_examen
              JOIN materii m ON m.id_materie=e.id_materie
              WHERE s.id_persoana=p_id_student
              GROUP BY e.id_materie,id_student,credite);
        RETURN v_medie;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END CalcMedie;

    FUNCTION VerifEligibil(
        p_id_student NUMBER,
        p_prag NUMBER
    )
    RETURN VARCHAR2
    AS
        v_medie NUMBER(5,2);
        v_restante NUMBER;
    BEGIN
        v_medie := CalcMedie(p_id_student);
        SELECT COUNT(*)
        INTO v_restante
        FROM student_examen
        WHERE id_student = p_id_student AND nota < 5;
        IF v_medie >= p_prag AND v_restante = 0 THEN
            RETURN 'eligibil';
        ELSE
            RETURN 'neeligibil';
        END IF;
    END VerifEligibil;

    PROCEDURE AcordaBurse(
        p_buget NUMBER,
        p_prag NUMBER
    ) 
    AS
        v_medie NUMBER(5,2);
        v_eligibilitate VARCHAR2(100);
        v_valoare_bursa NUMBER(5);
    BEGIN
        IF p_prag < 8.5 THEN
            RAISE prag_exception;
        END IF;
        v_valoare_bursa := DistribuieFondBurse(p_buget,p_prag);
        DELETE FROM burse
        WHERE tip='de performanta';
        FOR student IN c_studenti LOOP
            v_medie := CalcMedie(student.id_student);
            v_eligibilitate := VerifEligibil(student.id_student, p_prag);
            IF v_medie >= p_prag AND v_eligibilitate = 'eligibil' THEN
                INSERT INTO burse (id_student, tip, valoare)
                VALUES (student.id_student, 'de performanta', v_valoare_bursa);
            END IF;
        END LOOP;
    EXCEPTION
        WHEN prag_exception THEN
            RAISE_APPLICATION_ERROR(-20000,'Pragul burselor nu poate fi sub 8.5');
    END AcordaBurse;

    FUNCTION SumaTotalaBurse
    RETURN NUMBER 
    IS
        v_suma NUMBER(10,2);
    BEGIN
        SELECT SUM(valoare)
        INTO v_suma
        FROM burse
        WHERE tip='de performanta';
        RETURN v_suma;
    END SumaTotalaBurse;

    FUNCTION DistribuieFondBurse(
        p_buget NUMBER,
        p_prag NUMBER
    )
    RETURN NUMBER
    AS
        v_valoare_bursa NUMBER(10,1);
        v_studenti NUMBER := 0;
    BEGIN
        FOR student IN c_studenti LOOP

            IF VerifEligibil(student.id_student,p_prag) = 'eligibil' THEN
                v_studenti := v_studenti + 1;
            END IF;
        END LOOP;
        IF v_studenti = 0 THEN
            RAISE student_exception;
        END IF;
        v_valoare_bursa := p_buget / v_studenti;
        RETURN v_valoare_bursa;
    EXCEPTION
        WHEN student_exception THEN
            RAISE_APPLICATION_ERROR(-20001,'Nu exista niciun student eligibil pentru bursa');
    END DistribuieFondBurse;

    PROCEDURE RaportPachet(
        p_buget NUMBER,
        p_prag NUMBER
    ) AS
        v_student t_student;
        v_lista t_lista_studenti := t_lista_studenti();
    BEGIN
        IF p_prag < 8.5 THEN
            RAISE prag_exception;
        END IF;
        FOR student IN c_studenti LOOP
            v_student.id_student := student.id_student;
            v_student.nume := student.nume;
            v_student.medie := CalcMedie(student.id_student);
            v_student.eligibil_bursa := VerifEligibil(student.id_student, p_prag);
            v_lista.EXTEND;
            v_lista(v_lista.COUNT) := v_student;
        END LOOP;
        FOR i IN 1 .. v_lista.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Studentul ' || v_lista(i).nume ||' are media ' || v_lista(i).medie ||' si este ' || v_lista(i).eligibil_bursa
            );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE ('Suma totala a burselor de performanta este ' || SumaTotalaBurse() );
    EXCEPTION
    WHEN prag_exception THEN
        RAISE_APPLICATION_ERROR(-20000,'Pragul burselor nu poate fi sub 8.5');
    END RaportPachet;

    FUNCTION StatisticiBurse(
        p_buget NUMBER,
        p_prag NUMBER
    ) 
    RETURN t_statistici
    IS
        v_statistici t_statistici;
        v_total_studenti NUMBER := 0;
        v_studenti_eligibili NUMBER := 0;
        v_valoare NUMBER(10,2) := 0;
    BEGIN
        SELECT COUNT(*)
        INTO v_total_studenti
        FROM studenti;
        FOR student IN c_studenti LOOP
            IF VerifEligibil(student.id_student,p_prag) = 'eligibil' THEN
                v_studenti_eligibili := v_studenti_eligibili + 1;
            END IF;
        END LOOP;
        v_statistici.total_studenti := v_total_studenti;
        v_statistici.studenti_eligibili := v_studenti_eligibili;
        v_statistici.suma_bursa := DistribuieFondBurse(p_buget,p_prag);
        RETURN v_statistici;
    END StatisticiBurse;

END BurseDePerformanta;
/
SELECT * FROM burse;
DECLARE
    v_statistici BurseDePerformanta.t_statistici;
    v_medie_student NUMBER;
    v_eligibilitate_student VARCHAR2(20);
    v_suma_burse_init NUMBER;
    v_suma_burse_final NUMBER;
    v_valoare_bursa NUMBER(10,1);
BEGIN
    v_medie_student := BurseDePerformanta.CalcMedie(4);
    DBMS_OUTPUT.PUT_LINE('Media studentului este ' || v_medie_student);
    v_eligibilitate_student := BurseDePerformanta.VerifEligibil(4,8.5);
    DBMS_OUTPUT.PUT_LINE('Studentul este ' || v_eligibilitate_student);
    v_suma_burse_init := BurseDePerformanta.SumaTotalaBurse;
    DBMS_OUTPUT.PUT_LINE('Suma burselor inainte de actualizare este ' || v_suma_burse_init);
    v_valoare_bursa := BurseDePerformanta.DistribuieFondBurse(10000,8.5);
    DBMS_OUTPUT.PUT_LINE('Valoarea unei burse este de ' || v_valoare_bursa);
    BurseDePerformanta.RaportPachet(10000,8.5);
    v_statistici := BurseDePerformanta.StatisticiBurse(10000,8.5);
    DBMS_OUTPUT.PUT_LINE('Numarul total de studenti este ' || v_statistici.total_studenti 
    ||', numarul de studenti eligibili este ' || v_statistici.studenti_eligibili);
    BurseDePerformanta.AcordaBurse(10000,8.5);
        v_suma_burse_final := BurseDePerformanta.SumaTotalaBurse;
    DBMS_OUTPUT.PUT_LINE('Suma burselor inainte de actualizare este ' || v_suma_burse_final);
END;
/
SELECT * FROM burse;
DECLARE
    v_medie_student NUMBER;
BEGIN
    v_medie_student := BurseDePerformanta.CalcMedie(100);
    DBMS_OUTPUT.PUT_LINE(v_medie_student);
END;
/
DECLARE
    student_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(student_exception,-20001);
    v_valoare_bursa NUMBER(10,1);
BEGIN
    v_valoare_bursa := BurseDePerformanta.DistribuieFondBurse(10000,10);
    DBMS_OUTPUT.PUT_LINE(v_valoare_bursa);
EXCEPTION
    WHEN student_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
DECLARE
    prag_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(prag_exception,-20000);
BEGIN
    BurseDePerformanta.RaportPachet(10000,7);
EXCEPTION
    WHEN prag_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
DECLARE
    prag_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(prag_exception,-20000);
BEGIN
    BurseDePerformanta.AcordaBurse(10000,7);
EXCEPTION
    WHEN prag_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
