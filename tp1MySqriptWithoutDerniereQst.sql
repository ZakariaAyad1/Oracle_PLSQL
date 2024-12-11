--Q1 :


declare

  v_count NUMBER;

  type e_produit_record is record(
    produit_no NUMBER(7),
    nom VARCHAR2(50),
    description VARCHAR2(50),
    texte_no NUMBER(7),
    image_no NUMBER(7),
    prix_conseille NUMBER(11, 2)
  );
  
  TYPE e_produit_type IS TABLE OF e_produit_record INDEX BY PLS_INTEGER;
  e_produit e_produit_type;
  
begin

--  insert into e_produit(produit_no, nom, description, texte_no, image_no, prix_conseille) value()
  e_produit(1).produit_no := 1000;
  e_produit(1).nom := 'zk1';
  e_produit(1).description := 'zkzk1';
  e_produit(1).texte_no := 1000;
  e_produit(1).image_no := 1000;
  e_produit(1).prix_conseille := 10000;
  
  e_produit(2).produit_no := 1001;
  e_produit(2).nom := 'zk2';
  e_produit(2).description := 'zkzk2';
  e_produit(2).texte_no := 1001;
  e_produit(2).image_no := 1001;
  e_produit(2).prix_conseille := 10000;
  
  e_produit(3).produit_no := 1002;
  e_produit(3).nom := 'zk2';
  e_produit(3).description := 'zkzk2';
  e_produit(3).texte_no := 1002;
  e_produit(3).image_no := 1002;
  e_produit(3).prix_conseille := 10000;
  
  DBMS_OUTPUT.PUT_LINE('le produit numero : ' || e_produit(1).produit_no || ', est : ' || e_produit(1).nom || ', le prix conseille est : ' || e_produit(1).prix_conseille || '.'  );
  DBMS_OUTPUT.PUT_LINE('le produit numero : ' || e_produit(2).produit_no || ', est : ' || e_produit(2).nom || ', le prix conseille est : ' || e_produit(2).prix_conseille || '.'  );
  DBMS_OUTPUT.PUT_LINE('le produit numero : ' || e_produit(3).produit_no || ', est : ' || e_produit(3).nom || ', le prix conseille est : ' || e_produit(3).prix_conseille || '.'  );
  
  
  v_count := e_produit.COUNT;
  
  DBMS_OUTPUT.PUT_LINE('le nombre de ligne dans e_produit est : ' || v_count);
  
  

end;
/


--Q2 :



declare

  v_count NUMBER;

  v_produit_no e_produit.produit_no%TYPE;
  v_nom e_produit.nom%type;
  v_description e_produit.description%type;
  v_texte_no e_produit.texte_no%type;
  v_image_no e_produit.image_no%type;
  v_prix_conseille e_produit.prix_conseille%type;

  TYPE e_produit_type IS TABLE OF e_produit%ROWTYPE INDEX BY PLS_INTEGER;
  e_produit e_produit_type;
  
begin

  e_produit(1).produit_no := 1000;
  e_produit(1).nom := 'zk1';
  e_produit(1).description := 'zkzk1';
  e_produit(1).texte_no := 1000;
  e_produit(1).image_no := 1000;
  e_produit(1).prix_conseille := 10000;
  
  e_produit(2).produit_no := 1001;
  e_produit(2).nom := 'zk2';
  e_produit(2).description := 'zkzk2';
  e_produit(2).texte_no := 1001;
  e_produit(2).image_no := 1001;
  e_produit(2).prix_conseille := 10000;
  
  e_produit(3).produit_no := 1002;
  e_produit(3).nom := 'zk2';
  e_produit(3).description := 'zkzk2';
  e_produit(3).texte_no := 1002;
  e_produit(3).image_no := 1002;
  e_produit(3).prix_conseille := 10000;
  
  DBMS_OUTPUT.PUT_LINE('le produit numero : ' || e_produit(1).produit_no || ', est : ' || e_produit(1).nom || ', le prix conseille est : ' || e_produit(1).prix_conseille || '.'  );
  DBMS_OUTPUT.PUT_LINE('le produit numero : ' || e_produit(2).produit_no || ', est : ' || e_produit(2).nom || ', le prix conseille est : ' || e_produit(2).prix_conseille || '.'  );
  DBMS_OUTPUT.PUT_LINE('le produit numero : ' || e_produit(3).produit_no || ', est : ' || e_produit(3).nom || ', le prix conseille est : ' || e_produit(3).prix_conseille || '.'  );
  
  
  v_count := e_produit.COUNT;
  
  DBMS_OUTPUT.PUT_LINE('le nombre de ligne dans e_produit est : ' || v_count);
  
end;
/





--Q4_a :

declare
  v_nom e_produit.nom%type;
  v_desc_d e_produit.description%type;
  v_prix e_produit.prix_conseille%type;
  v_produit_no e_produit.produit_no%type;
  
begin

   DBMS_OUTPUT.PUT_LINE('enter saisir le numéro d’un produit : ');
   v_produit_no := &produit_no;
   
   SELECT nom, description, prix_conseille into v_nom, v_desc_d, v_prix from e_produit where produit_no = v_produit_no;
   
   DBMS_OUTPUT.PUT_LINE('affichage des informations : ');
   
   DBMS_OUTPUT.PUT_LINE('Le Nom : ' || v_nom);
   DBMS_OUTPUT.PUT_LINE('la description : ' || v_desc_d);
   DBMS_OUTPUT.PUT_LINE('le prix conseillé : ' || v_prix);

end;
/


--Q4_b

declare
  type q4rec is RECORD (
    nom e_produit.nom%type,
    description e_produit.description%type,
    prix_conseille e_produit.prix_conseille%type
  );
  
  v_produit q4rec;
  v_produit_no e_produit.produit_no%type;
  
begin

   DBMS_OUTPUT.PUT_LINE('enter saisir le numéro d’un produit : ');
   v_produit_no := &produit_no;
   
   SELECT nom, description, prix_conseille into v_produit.nom, v_produit.description, v_produit.prix_conseille from e_produit where produit_no = v_produit_no;
   
   DBMS_OUTPUT.PUT_LINE('affichage des informations : ');
   
   DBMS_OUTPUT.PUT_LINE('Le Nom : ' || v_produit.nom);
   DBMS_OUTPUT.PUT_LINE('la description : ' || v_produit.description);
   DBMS_OUTPUT.PUT_LINE('le prix conseillé : ' || v_produit.prix_conseille);
   
end;
/


--Q5_a :

declare
  v_count NUMBER;
  
  v_nom e_produit.nom%TYPE;
  v_description e_produit.description%TYPE;
  v_prix_conseille e_produit.prix_conseille%TYPE;
  
begin

  update e_produit set PRIX_CONSEILLE =1500 where nom ='Produit X' ;
  v_count := SQL%ROWCOUNT;
  
  IF v_count > 0 THEN
    SELECT nom, description, prix_conseille
    INTO v_nom, v_description, v_prix_conseille
    FROM e_produit
    WHERE PRIX_CONSEILLE = 1500 AND nom = 'Produit X'
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE('Le produit modifié a le nom : ' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Description : ' || v_description);
    DBMS_OUTPUT.PUT_LINE('Prix conseillé modifié : ' || v_prix_conseille);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Aucun produit mis à jour.');
  END IF;
    

   
end;
/


--Q5_b :

CREATE SEQUENCE e_produit_seq
START WITH 1
INCREMENT BY 1;



declare
  v_count NUMBER;
  
  v_nom e_produit.nom%TYPE;
  v_description e_produit.description%TYPE;
  v_prix_conseille e_produit.prix_conseille%TYPE;
  
begin

  update e_produit set PRIX_CONSEILLE =1500 where nom ='Produit X' ;
  v_count := SQL%ROWCOUNT;
  
  IF v_count > 0 THEN
    SELECT nom, description, prix_conseille
    INTO v_nom, v_description, v_prix_conseille
    FROM e_produit
    WHERE PRIX_CONSEILLE = 1500 AND nom = 'Produit X'
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE('Le produit modifié a le nom : ' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Description : ' || v_description);
    DBMS_OUTPUT.PUT_LINE('Prix conseillé modifié : ' || v_prix_conseille);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Aucun produit mis à jour. Aucun produit avec le nom "Produit X" trouvé.');
  END IF;
  
  
  INSERT INTO e_produit (produit_no, nom, description, prix_conseille)
  VALUES(e_produit_seq.NEXTVAL, 'Produit Y', 'Description du produit Y', 2000);

  v_count := SQL%ROWCOUNT;

  IF v_count > 0 THEN
    SELECT nom, description, prix_conseille
    INTO v_nom, v_description, v_prix_conseille
    FROM e_produit
    WHERE nom = 'Produit Y' AND ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('Le nouveau produit inséré a le nom : ' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Description : ' || v_description);
    DBMS_OUTPUT.PUT_LINE('Prix conseillé : ' || v_prix_conseille);
  ELSE
    DBMS_OUTPUT.PUT_LINE('L insertion du nouveau produit a échoué.');
  END IF;
    

   
end;
/


--Q5_c :

declare
  v_count NUMBER;
  
  v_nom e_produit.nom%TYPE;
  v_description e_produit.description%TYPE;
  v_prix_conseille e_produit.prix_conseille%TYPE;
  
begin

  update e_produit set PRIX_CONSEILLE =1500 where nom ='Produit X' ;
  v_count := SQL%ROWCOUNT;
  
  IF v_count > 0 THEN
    SELECT nom, description, prix_conseille
    INTO v_nom, v_description, v_prix_conseille
    FROM e_produit
    WHERE PRIX_CONSEILLE = 1500 AND nom = 'Produit X'
    AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE('Le produit modifié a le nom : ' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Description : ' || v_description);
    DBMS_OUTPUT.PUT_LINE('Prix conseillé modifié : ' || v_prix_conseille);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Aucun produit mis à jour. Aucun produit avec le nom "Produit X" trouvé.');
  END IF;
  
  
  INSERT INTO e_produit (produit_no, nom, description, prix_conseille)
  VALUES(e_produit_seq.NEXTVAL, 'Produit Y', 'Description du produit Y', 2000);

  v_count := SQL%ROWCOUNT;

  IF v_count > 0 THEN
    SELECT nom, description, prix_conseille
    INTO v_nom, v_description, v_prix_conseille
    FROM e_produit
    WHERE nom = 'Produit Y' AND ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('Le nouveau produit inséré a le nom : ' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Description : ' || v_description);
    DBMS_OUTPUT.PUT_LINE('Prix conseillé : ' || v_prix_conseille);
  ELSE
    DBMS_OUTPUT.PUT_LINE('L insertion du nouveau produit a échoué.');
  END IF;
  
    
  
  DBMS_OUTPUT.PUT_LINE('la liste des numéros de produits qui n’ont jamais été commandés sont : '  );
  FOR rec IN (
    SELECT p.produit_no, p.nom, p.description
    FROM e_produit p
    WHERE NOT EXISTS (
      SELECT 1 
      FROM e_ligne l 
      WHERE l.produit_no = p.produit_no
    )
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Numéro du produit : ' || rec.produit_no);
     DBMS_OUTPUT.PUT_LINE('nom du produit : ' || rec.nom);
      DBMS_OUTPUT.PUT_LINE('description du produit : ' || rec.description);
  END LOOP;
end;
/
