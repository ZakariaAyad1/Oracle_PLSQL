
CREATE TABLE E_AUGMENTATION (
    NO_AUGMENTATION NUMBER(7),
    AUGMENTATION NUMBER(7),
    DATE_AUGMENTATION DATE,
    EMP_NO NUMBER(7)
);

/* my first work bur did n t work */

declare
    v_emp_name     E_EMP.NOM%TYPE;      
    v_year_joined  NUMBER(4);            
    v_salary       E_EMP.SALAIRE%TYPE;  
    v_emp_no       E_EMP.EMP_NO%TYPE;
    
    v_new_salary   NUMBER(10, 2);   

begin
  v_emp_name := '&v_emp_name';
  
  FOR emp_rec IN(

  SELECT EMP_NO, EXTRACT(YEAR FROM DT_ENTREE) AS year_joined , SALAIRE as slr
    FROM E_EMP
    WHERE NOM = v_emp_name)
    
 loop
  
  update e_emp
  set salaire = 
    case
      when v_year_joined = 2020 then  emp_rec.slr * 1.5
      when v_year_joined = 2021 then emp_rec.slr * 1.25
      when v_year_joined = 2022 then emp_rec.slr * 1.10
      else emp_rec.slr
    end
   where  UPPER(TRIM(NOM)) = UPPER(TRIM(v_emp_name));
   
   end loop;
DBMS_OUTPUT.PUT_LINE('Le salaire a été mis à jour' );

end;
/




/*the other */



DECLARE
    v_emp_name     E_EMP.NOM%TYPE;      
    v_year_joined  NUMBER(4);            
    v_salary       E_EMP.SALAIRE%TYPE;  
    v_new_salary   NUMBER(10, 2);      
    v_emp_no       E_EMP.EMP_NO%TYPE;  
BEGIN
    v_emp_name := '&v_emp_name';

    FOR emp_rec IN (
        SELECT EMP_NO, EXTRACT(YEAR FROM DT_ENTREE) AS year_joined, SALAIRE
        FROM E_EMP
        WHERE NOM = v_emp_name
    ) LOOP
        IF emp_rec.year_joined = 2020 THEN
            v_new_salary := emp_rec.salaire * 1.5;
        ELSIF emp_rec.year_joined = 2021 THEN
            v_new_salary := emp_rec.salaire * 1.25;
        ELSIF emp_rec.year_joined = 2022 THEN
            v_new_salary := emp_rec.salaire * 1.1; 
        ELSE
            v_new_salary := emp_rec.salaire;
        END IF;
        
        UPDATE E_EMP
        SET SALAIRE = v_new_salary
        WHERE EMP_NO = emp_rec.EMP_NO;

        DBMS_OUTPUT.PUT_LINE('The salary for ' || v_emp_name || ' (EMP_NO: ' || emp_rec.EMP_NO || ') has been updated to ' || v_new_salary);
    END LOOP;

    COMMIT;
END;
/


--q2 b

CREATE SEQUENCE E_AUGMENTATION_SEQ
    START WITH 1          
    INCREMENT BY 1        
    NOCACHE               
    NOCYCLE; 


SELECT nom, COUNT(*)
FROM e_emp
GROUP BY nom
HAVING COUNT(*) > 1;

BEGIN
    DELETE FROM e_emp e1
    WHERE ROWID > (
        SELECT MIN(ROWID)
        FROM e_emp e2
        WHERE e1.nom = e2.nom
    );
    COMMIT;
END;


DECLARE
    v_emp_name     E_EMP.NOM%TYPE;      
    v_year_joined  NUMBER(4);            
    v_salary       E_EMP.SALAIRE%TYPE;  
    v_new_salary   NUMBER(10, 2);      
    
    v_increase E_AUGMENTATION.AUGMENTATION%type;
    v_DATE_AUGMENTATION E_AUGMENTATION.DATE_AUGMENTATION%type;
    v_emp_no E_EMP.EMP_NO%TYPE;  
    v_no_augmentation E_AUGMENTATION.NO_AUGMENTATION%type;

BEGIN
    v_emp_name := '&v_emp_name';
    

    FOR emp_rec IN (
        SELECT EMP_NO, EXTRACT(YEAR FROM DT_ENTREE) AS year_joined, SALAIRE
        FROM E_EMP
        WHERE NOM = v_emp_name
    ) LOOP
  
        IF emp_rec.year_joined = 2020 THEN
            v_new_salary := emp_rec.salaire * 1.5;
        ELSIF emp_rec.year_joined = 2021 THEN
            v_new_salary := emp_rec.salaire * 1.25;
        ELSIF emp_rec.year_joined = 2022 THEN
            v_new_salary := emp_rec.salaire * 1.1; 
        ELSE
            v_new_salary := emp_rec.salaire;
        END IF;
        
        v_emp_no := emp_rec.EMP_NO;
        v_salary := emp_rec.SALAIRE;
        v_increase := v_new_salary - v_salary;
        
        UPDATE E_EMP
        SET SALAIRE = v_new_salary
        WHERE EMP_NO = emp_rec.EMP_NO;
        
    END LOOP;
    

    SELECT E_AUGMENTATION_SEQ.NEXTVAL INTO v_no_augmentation FROM DUAL;
    INSERT INTO E_AUGMENTATION (NO_AUGMENTATION, AUGMENTATION, DATE_AUGMENTATION, EMP_NO)
        VALUES (v_no_augmentation, v_increase, SYSDATE, v_emp_no);        
        

    COMMIT;
END;
/


--Q3 a


DECLARE
    v_count       NUMBER; 
    v_total_rows  NUMBER; 
    v_emp_no      E_EMP.EMP_NO%TYPE; 
    v_salary      E_EMP.SALAIRE%TYPE; 
    v_new_salary  NUMBER(10, 2); 
    v_year_joined NUMBER; 

BEGIN
   
    SELECT COUNT(*) INTO v_total_rows FROM E_EMP;
    v_count := 1; 

    WHILE v_count <= v_total_rows LOOP
       
        SELECT EMP_NO, SALAIRE, EXTRACT(YEAR FROM DT_ENTREE)
        INTO v_emp_no, v_salary, v_year_joined
        FROM (
            SELECT EMP_NO, SALAIRE, DT_ENTREE,
                   ROW_NUMBER() OVER (ORDER BY EMP_NO) AS row_num
            FROM E_EMP
        )
        WHERE row_num = v_count;

       
        IF v_year_joined = 2020 THEN
            v_new_salary := v_salary * 1.5; 
        ELSIF v_year_joined = 2021 THEN
            v_new_salary := v_salary * 1.25; 
        ELSIF v_year_joined = 2022 THEN
            v_new_salary := v_salary * 1.1; 
        ELSE
            v_new_salary := v_salary;
        END IF;

        
        UPDATE E_EMP
        SET SALAIRE = v_new_salary
        WHERE EMP_NO = v_emp_no;

       
        DBMS_OUTPUT.PUT_LINE('Employé numéro ' || v_emp_no || 
                             ' : salaire mis à jour à ' || v_new_salary);

       
        v_count := v_count + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Mise à jour des salaires terminée pour tous les employés.');


END;
/


--Q3 b:

DECLARE
    v_count       NUMBER; 
    v_total_rows  NUMBER; 
    v_emp_no      E_EMP.EMP_NO%TYPE; 
    v_salary      E_EMP.SALAIRE%TYPE; 
    v_new_salary  NUMBER(10, 2); 
    v_year_joined NUMBER; 
    
    v_increase E_AUGMENTATION.AUGMENTATION%type;
    v_DATE_AUGMENTATION E_AUGMENTATION.DATE_AUGMENTATION%type;
    v_no_augmentation E_AUGMENTATION.NO_AUGMENTATION%type;
    
    v_row_modifiable NUMBER;

BEGIN
   
    SELECT COUNT(*) INTO v_total_rows FROM E_EMP;
    v_count := 1; 

    WHILE v_count <= v_total_rows LOOP
       
        SELECT EMP_NO, SALAIRE, EXTRACT(YEAR FROM DT_ENTREE)
        INTO v_emp_no, v_salary, v_year_joined
        FROM (
            SELECT EMP_NO, SALAIRE, DT_ENTREE,
                   ROW_NUMBER() OVER (ORDER BY EMP_NO) AS row_num
            FROM E_EMP
        )
        WHERE row_num = v_count;

       
        IF v_year_joined = 2020 THEN
            v_new_salary := v_salary * 1.5; 
        ELSIF v_year_joined = 2021 THEN
            v_new_salary := v_salary * 1.25; 
        ELSIF v_year_joined = 2022 THEN
            v_new_salary := v_salary * 1.1; 
        ELSE
            v_new_salary := v_salary;
        END IF;
        
        v_increase := v_new_salary - v_salary;
        v_row_modifiable := sql%rowcount;
        
        if(v_row_modifiable > 0) then
        SELECT E_AUGMENTATION_SEQ.NEXTVAL INTO v_no_augmentation FROM DUAL;
        INSERT INTO E_AUGMENTATION (NO_AUGMENTATION, AUGMENTATION, DATE_AUGMENTATION, EMP_NO)
            VALUES (v_no_augmentation, v_increase, SYSDATE, v_emp_no);   
            end if ;

        
        UPDATE E_EMP
        SET SALAIRE = v_new_salary
        WHERE EMP_NO = v_emp_no;

       
        DBMS_OUTPUT.PUT_LINE('Employé numéro ' || v_emp_no || 
                             ' : salaire mis à jour à ' || v_new_salary);

       
        v_count := v_count + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Mise à jour des salaires terminée pour tous les employés.');
    
    


END;
/



--Q4 :

DECLARE
    v_emp_no      E_EMP.EMP_NO%TYPE; 
    v_salary      E_EMP.SALAIRE%TYPE; 
    v_new_salary  NUMBER(10, 2);
    v_year_joined NUMBER; 

BEGIN
    
    FOR rec IN (
        SELECT EMP_NO, SALAIRE, EXTRACT(YEAR FROM DT_ENTREE) AS YEAR_JOINED
        FROM E_EMP
    ) LOOP
       
        v_emp_no := rec.EMP_NO;
        v_salary := rec.SALAIRE;
        v_year_joined := rec.YEAR_JOINED;

        
        IF v_year_joined = 2020 THEN
            v_new_salary := v_salary * 1.5; 
        ELSIF v_year_joined = 2021 THEN
            v_new_salary := v_salary * 1.25; 
        ELSIF v_year_joined = 2022 THEN
            v_new_salary := v_salary * 1.1; 
        ELSE
            v_new_salary := v_salary; 
        END IF;

        
        UPDATE E_EMP
        SET SALAIRE = v_new_salary
        WHERE EMP_NO = v_emp_no;

        
        DBMS_OUTPUT.PUT_LINE('Employé numéro ' || v_emp_no || 
                             ' : salaire mis à jour à ' || v_new_salary);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Mise à jour des salaires terminée pour tous les employés.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END;
/
