
/*
************TP4************
Ayad Zakariya
Étudiant GI2 - ENSA Tétouan
CNE : P10005444
2024-25
***************************
*/


--Qst1 a:
DECLARE
v_nom e_emp.nom%type;
v_prenom e_emp.prenom%type;
v_dt_entree e_emp.dt_entree%type;
v_salaire e_emp.salaire%TYPE;
v_service_no e_emp.service_no%type;

v_titre VARCHAR2(50);

BEGIN

v_titre := '&titre';

for rec in (
select e_emp.nom, e_emp.prenom, e_emp.dt_entree, e_emp.salaire, e_emp.service_no-- into v_nom, v_prenom, v_dt_entree, v_salaire, v_service_no
FROM e_emp where service_no in (select service_no from e_emp where titre = v_titre) 
)loop
DBMS_OUTPUT.PUT_LINE('nom : ' || rec.nom || ' ; prenom : ' || rec.prenom || ' ; salaire :  ' || rec.salaire || ' ; service_no : ' || rec.service_no);  
end loop;

END;
/

--Quest1 b :

DECLARE
v_nom e_emp.nom%type;
v_prenom e_emp.prenom%type;
v_dt_entree e_emp.dt_entree%type;
v_salaire e_emp.salaire%TYPE;
v_service_no e_emp.service_no%type;

v_titre VARCHAR2(50);
v_count NUMBER;

BEGIN

v_titre := '&titre';

SELECT COUNT(*)
    INTO v_count
    FROM e_emp
    WHERE titre = v_titre;
    
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid title: ' || v_titre || ' does not exist.');
    END IF;

for rec in (
select e_emp.nom, e_emp.prenom, e_emp.dt_entree, e_emp.salaire, e_emp.service_no-- into v_nom, v_prenom, v_dt_entree, v_salaire, v_service_no
FROM e_emp where service_no in (select service_no from e_emp where titre = v_titre) 
)loop
DBMS_OUTPUT.PUT_LINE('nom : ' || rec.nom || ' ; prenom : ' || rec.prenom || ' ; salaire :  ' || rec.salaire || ' ; service_no : ' || rec.service_no);  
end loop;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found for the given title: ' || v_titre);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);

END;
/


--Qst2 :

create or replace procedure prime(p_emp_no IN number , taux IN number) is
v_salaire e_emp.salaire%type;
v_new_salaire  e_emp.salaire%type;

BEGIN
SELECT SALAIRE INTO v_salaire
    FROM E_EMP
    WHERE EMP_NO = p_emp_no;
    
v_new_salaire := v_salaire + v_salaire*taux*0.01;
if taux > 40 then 
RAISE_APPLICATION_ERROR(-20001, 'Error: The increase rate cannot exceed 40%');
ELSE
  UPDATE e_emp set salaire =  v_new_salaire where e_Emp.emp_no = p_emp_no ;
END IF;  

EXCEPTION
WHEN NO_DATA_FOUND then 
        DBMS_OUTPUT.PUT_LINE('NO_DATA_FOUND for p_emp_no  : ' || p_emp_no);
WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;

--Qst2 a :
DECLARE
    v_emp_no e_emp.emp_no%TYPE := 1; 
    v_taux NUMBER := 30;   
BEGIN
    prime(v_emp_no, v_taux);
END;
/

--after
select * from e_Emp where emp_no = 1;

 
 --Qst 3 :     
 
 create or replace function qt_produit(nmr_cmd in number) return number is
v_total_quantity NUMBER :=0;

BEGIN

SELECT SUM(quantite) 
    INTO v_total_quantity
    FROM e_ligne
    WHERE commande_no = nmr_cmd;
    
IF v_total_quantity IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Order not found for nmr_cmd : ' || nmr_cmd);
END IF;

RETURN v_total_quantity;

EXCEPTION
    when no_data_found then 
    DBMS_OUTPUT.PUT_LINE('NO_DATA_FOUND for nmr_cmd  : ' || nmr_cmd);
    RETURN 0;
    when others then
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
    RETURN null;
END;
/

DECLARE
    v_order_number NUMBER := 1;  
    v_total_quantity NUMBER;
BEGIN
    v_total_quantity := qt_produit(v_order_number);
    DBMS_OUTPUT.PUT_LINE('Total quantity for order ' || v_order_number || ' is: ' || v_total_quantity);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/

-- Qst4 

ALTER TABLE e_emp
ADD (dt_prime DATE);

-- Qst 4 a :

CREATE OR REPLACE TRIGGER trg_update_dt_prime
BEFORE UPDATE ON e_emp
FOR EACH ROW
BEGIN
    :NEW.dt_prime := SYSDATE;
END;
/

-- Qst 4 b :

CREATE OR REPLACE TRIGGER trg_update_dt_prime
BEFORE UPDATE ON e_emp
FOR EACH ROW
BEGIN
    :NEW.dt_prime := SYSDATE;
END;
/

ALTER TABLE e_emp
ADD (dt_prime DATE);

BEGIN
    prime(1, 20); 
END;
/

select dt_prime from e_emp where emp_no=1



