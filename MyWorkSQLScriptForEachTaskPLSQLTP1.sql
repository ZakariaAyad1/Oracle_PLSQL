/*
QST2-a:
*/

DECLARE
    -- Déclaration d'un type d'enregistrement pour un produit
    TYPE produit_rec IS RECORD (
        produit_no NUMBER(7),
        nom VARCHAR2(50),
        description VARCHAR2(50),
        texte_no NUMBER(7),
        image_no NUMBER(7),
        prix_conseille NUMBER(11, 2)
    );

    -- Déclaration d'un type de tableau associatif de produits
    TYPE produit_table IS TABLE OF produit_rec INDEX BY PLS_INTEGER;

    -- Déclaration d'une variable de type tableau associatif
    v_produits produit_table;

BEGIN
    -- Exemple d'insertion de données dans le tableau associatif
    v_produits(1).produit_no := 1;
    v_produits(1).nom := 'Produit X';
    v_produits(1).description := 'Description Produit X';
    v_produits(1).texte_no := 1;
    v_produits(1).image_no := 1;
    v_produits(1).prix_conseille := 100.00;

    v_produits(2).produit_no := 2;
    v_produits(2).nom := 'Produit Y';
    v_produits(2).description := 'Description Produit Y';
    v_produits(2).texte_no := 2;
    v_produits(2).image_no := 2;
    v_produits(2).prix_conseille := 150.00;

    v_produits(3).produit_no := 3;
    v_produits(3).nom := 'Produit Z';
    v_produits(3).description := 'Description Produit Z';
    v_produits(3).texte_no := 3;
    v_produits(3).image_no := 3;
    v_produits(3).prix_conseille := 200.00;

    FOR i IN 1 .. v_produits.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(i).produit_no || 
                             ', Nom: ' || v_produits(i).nom || 
                             ', Prix conseillé: ' || v_produits(i).prix_conseille);
    END LOOP;
END;
/




/*
QST 2-c
*/

DECLARE
    TYPE produit_rec IS RECORD (
        produit_no NUMBER(7),
        nom VARCHAR2(50),
        description VARCHAR2(50),
        texte_no NUMBER(7),
        image_no NUMBER(7),
        prix_conseille NUMBER(11, 2)
    );

    -- Déclaration d'un type de tableau associatif de produits
    TYPE produit_table IS TABLE OF produit_rec INDEX BY PLS_INTEGER;

    -- Déclaration d'une variable de type tableau associatif
    v_produits produit_table;

BEGIN
    v_produits(1).produit_no := 1;
    v_produits(1).nom := 'Produit A';
    v_produits(1).description := 'Description Produit A';
    v_produits(1).texte_no := 1;
    v_produits(1).image_no := 1;
    v_produits(1).prix_conseille := 100.00;

    v_produits(2).produit_no := 2;
    v_produits(2).nom := 'Produit B';
    v_produits(2).description := 'Description Produit B';
    v_produits(2).texte_no := 2;
    v_produits(2).image_no := 2;
    v_produits(2).prix_conseille := 150.00;

    v_produits(3).produit_no := 3;
    v_produits(3).nom := 'Produit C';
    v_produits(3).description := 'Description Produit C';
    v_produits(3).texte_no := 3;
    v_produits(3).image_no := 3;
    v_produits(3).prix_conseille := 200.00;

    v_produits(4).produit_no := 4;
    v_produits(4).nom := 'Produit D';
    v_produits(4).description := 'Description Produit D';
    v_produits(4).texte_no := 4;
    v_produits(4).image_no := 4;
    v_produits(4).prix_conseille := 250.00;

    v_produits(5).produit_no := 5;
    v_produits(5).nom := 'Produit E';
    v_produits(5).description := 'Description Produit E';
    v_produits(5).texte_no := 5;
    v_produits(5).image_no := 5;
    v_produits(5).prix_conseille := 300.00;

    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(1).produit_no || 
                         ', Nom: ' || v_produits(1).nom || 
                         ', Prix conseillé: ' || v_produits(1).prix_conseille);

    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(2).produit_no || 
                         ', Nom: ' || v_produits(2).nom || 
                         ', Prix conseillé: ' || v_produits(2).prix_conseille);

    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(3).produit_no || 
                         ', Nom: ' || v_produits(3).nom || 
                         ', Prix conseillé: ' || v_produits(3).prix_conseille);

    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(4).produit_no || 
                         ', Nom: ' || v_produits(4).nom || 
                         ', Prix conseillé: ' || v_produits(4).prix_conseille);

    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(5).produit_no || 
                         ', Nom: ' || v_produits(5).nom || 
                         ', Prix conseillé: ' || v_produits(5).prix_conseille);
END;
/


/*

 QST2-c

*/

DECLARE
    TYPE produit_rec IS RECORD (
        produit_no NUMBER(7),
        nom VARCHAR2(50),
        description VARCHAR2(50),
        texte_no NUMBER(7),
        image_no NUMBER(7),
        prix_conseille NUMBER(11, 2)
    );

    TYPE produit_table IS TABLE OF produit_rec INDEX BY PLS_INTEGER;

    v_produits produit_table;
    v_total_produits PLS_INTEGER;

BEGIN
    v_produits(1).produit_no := 1;
    v_produits(1).nom := 'Produit A';
    v_produits(1).description := 'Description Produit A';
    v_produits(1).texte_no := 1;
    v_produits(1).image_no := 1;
    v_produits(1).prix_conseille := 100.00;

    v_produits(2).produit_no := 2;
    v_produits(2).nom := 'Produit B';
    v_produits(2).description := 'Description Produit B';
    v_produits(2).texte_no := 2;
    v_produits(2).image_no := 2;
    v_produits(2).prix_conseille := 150.00;

    v_produits(3).produit_no := 3;
    v_produits(3).nom := 'Produit C';
    v_produits(3).description := 'Description Produit C';
    v_produits(3).texte_no := 3;
    v_produits(3).image_no := 3;
    v_produits(3).prix_conseille := 200.00;

    v_produits(4).produit_no := 4;
    v_produits(4).nom := 'Produit D';
    v_produits(4).description := 'Description Produit D';
    v_produits(4).texte_no := 4;
    v_produits(4).image_no := 4;
    v_produits(4).prix_conseille := 250.00;

    v_produits(5).produit_no := 5;
    v_produits(5).nom := 'Produit E';
    v_produits(5).description := 'Description Produit E';
    v_produits(5).texte_no := 5;
    v_produits(5).image_no := 5;
    v_produits(5).prix_conseille := 300.00;

    v_total_produits := v_produits.COUNT;

    DBMS_OUTPUT.PUT_LINE('Nombre total de produits dans le tableau : ' || v_total_produits);
END;
/


/*
QST3
*/

DECLARE
    TYPE produit_rec IS RECORD (
        produit_no e_produit.produit_no%TYPE,
        nom e_produit.nom%TYPE,
        description e_produit.description%TYPE,
        texte_no e_produit.texte_no%TYPE,
        image_no e_produit.image_no%TYPE,
        prix_conseille e_produit.prix_conseille%TYPE
    );

    TYPE produit_table IS TABLE OF produit_rec INDEX BY PLS_INTEGER;

    v_produits produit_table;
    v_total_produits PLS_INTEGER;

BEGIN
    v_produits(1).produit_no := seq_produit.nextval;
    v_produits(1).nom := 'Produit A';
    v_produits(1).description := 'Description Produit A';
    v_produits(1).texte_no := 1;
    v_produits(1).image_no := 1;
    v_produits(1).prix_conseille := 100.00;

    v_produits(2).produit_no := seq_produit.nextval;
    v_produits(2).nom := 'Produit B';
    v_produits(2).description := 'Description Produit B';
    v_produits(2).texte_no := 2;
    v_produits(2).image_no := 2;
    v_produits(2).prix_conseille := 150.00;

    v_produits(3).produit_no := seq_produit.nextval;
    v_produits(3).nom := 'Produit C';
    v_produits(3).description := 'Description Produit C';
    v_produits(3).texte_no := 3;
    v_produits(3).image_no := 3;
    v_produits(3).prix_conseille := 200.00;

    v_produits(4).produit_no := seq_produit.nextval;
    v_produits(4).nom := 'Produit D';
    v_produits(4).description := 'Description Produit D';
    v_produits(4).texte_no := 4;
    v_produits(4).image_no := 4;
    v_produits(4).prix_conseille := 250.00;

    v_produits(5).produit_no := seq_produit.nextval;
    v_produits(5).nom := 'Produit E';
    v_produits(5).description := 'Description Produit E';
    v_produits(5).texte_no := 5;
    v_produits(5).image_no := 5;
    v_produits(5).prix_conseille := 300.00;

    v_total_produits := v_produits.COUNT;

    DBMS_OUTPUT.PUT_LINE('Nombre total de produits dans le tableau : ' || v_total_produits);

    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(1).produit_no || 
                         ', Nom: ' || v_produits(1).nom || 
                         ', Prix conseillé: ' || v_produits(1).prix_conseille);
    
    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(2).produit_no || 
                         ', Nom: ' || v_produits(2).nom || 
                         ', Prix conseillé: ' || v_produits(2).prix_conseille);
    
    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(3).produit_no || 
                         ', Nom: ' || v_produits(3).nom || 
                         ', Prix conseillé: ' || v_produits(3).prix_conseille);
    
    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(4).produit_no || 
                         ', Nom: ' || v_produits(4).nom || 
                         ', Prix conseillé: ' || v_produits(4).prix_conseille);
    
    DBMS_OUTPUT.PUT_LINE('Produit No: ' || v_produits(5).produit_no || 
                         ', Nom: ' || v_produits(5).nom || 
                         ', Prix conseillé: ' || v_produits(5).prix_conseille);
END;
/


/*
QST4-a
*/

DECLARE
    v_produit_no e_produit.produit_no%TYPE;
    v_nom e_produit.nom%TYPE;
    v_desc_d e_produit.description%TYPE;
    v_prix e_produit.prix_conseille%TYPE;

BEGIN
    -- Demande à l'utilisateur de saisir le numéro du produit
    v_produit_no := &produit_no;  -- Utilisation d'une substitution pour demander l'entrée

    -- Récupération des informations du produit
    SELECT nom, description, prix_conseille
    INTO v_nom, v_desc_d, v_prix
    FROM e_produit
    WHERE produit_no = v_produit_no;

    -- Affichage des informations du produit
    DBMS_OUTPUT.PUT_LINE('Nom du produit: ' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Description du produit: ' || v_desc_d);
    DBMS_OUTPUT.PUT_LINE('Prix conseillé: ' || v_prix);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Aucun produit trouvé avec le numéro: ' || v_produit_no);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/

/*
    QST4-b
*/

DECLARE
    TYPE produit_rec IS RECORD (
        nom e_produit.nom%TYPE,
        description e_produit.description%TYPE,
        prix_conseille e_produit.prix_conseille%TYPE
    );

    v_produit_no e_produit.produit_no%TYPE;
    v_produit_info produit_rec;  -- Déclaration d'une variable d'enregistrement

BEGIN
    -- Demande à l'utilisateur de saisir le numéro du produit
    v_produit_no := &produit_no;  -- Utilisation d'une substitution pour demander l'entrée

    -- Récupération des informations du produit dans l'enregistrement
    SELECT nom, description, prix_conseille
    INTO v_produit_info.nom, v_produit_info.description, v_produit_info.prix_conseille
    FROM e_produit
    WHERE produit_no = v_produit_no;

    -- Affichage des informations du produit
    DBMS_OUTPUT.PUT_LINE('Nom du produit: ' || v_produit_info.nom);
    DBMS_OUTPUT.PUT_LINE('Description du produit: ' || v_produit_info.description);
    DBMS_OUTPUT.PUT_LINE('Prix conseillé: ' || v_produit_info.prix_conseille);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Aucun produit trouvé avec le numéro: ' || v_produit_no);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/



/*
QST 5-a
*/

DECLARE
    v_nom e_produit.nom%TYPE := 'Produit X';  -- Nom du produit à mettre à jour
    v_nouveau_prix e_produit.prix_conseille%TYPE := 1500.00;  -- Nouveau prix
    v_nb_lignes_modifiees INTEGER;  -- Variable pour stocker le nombre de lignes modifiées
    v_prix_actuel e_produit.prix_conseille%TYPE;  -- Variable pour stocker le prix actuel

BEGIN
    -- Mise à jour du prix du produit
    UPDATE e_produit
    SET prix_conseille = v_nouveau_prix
    WHERE nom = v_nom;

    -- Récupération du nombre de lignes modifiées
    v_nb_lignes_modifiees := SQL%ROWCOUNT;

    -- Vérification si la mise à jour a été effectuée
    IF v_nb_lignes_modifiees > 0 THEN
        -- Récupération du nouveau prix pour affichage
        SELECT prix_conseille
        INTO v_prix_actuel
        FROM e_produit
        WHERE nom = v_nom
        AND ROWNUM = 1; -- Assurez-vous qu'il y a une seule ligne correspondant au produit

        -- Affichage de la nouvelle valeur modifiée
        DBMS_OUTPUT.PUT_LINE('Le prix du "' || v_nom || '" a été mis à jour à : ' || v_prix_actuel);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Aucune mise à jour effectuée. Le produit "' || v_nom || '" n''existe pas.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/



/*
QST 5-a
*/

DECLARE
    v_nom e_produit.nom%TYPE := 'Produit X';
    v_nouveau_prix e_produit.prix_conseille%TYPE := 1500.00;
    v_nb_lignes_modifiees INTEGER;
    v_prix_actuel e_produit.prix_conseille%TYPE;

    v_nouveau_produit_no e_produit.produit_no%TYPE;
    v_nouveau_nom e_produit.nom%TYPE := 'Produit A';
    v_nouvelle_description e_produit.description%TYPE := 'Description Produit A';
    v_nouveau_prix_produit e_produit.prix_conseille%TYPE := 200.00;

BEGIN
    UPDATE e_produit
    SET prix_conseille = v_nouveau_prix
    WHERE nom = v_nom;

    v_nb_lignes_modifiees := SQL%ROWCOUNT;

    IF v_nb_lignes_modifiees > 0 THEN
        SELECT prix_conseille
        INTO v_prix_actuel
        FROM e_produit
        WHERE nom = v_nom;

        DBMS_OUTPUT.PUT_LINE('Le prix du "' || v_nom || '" a été mis à jour à : ' || v_prix_actuel);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Aucune mise à jour effectuée. Le produit "' || v_nom || '" n\'existe pas.');
    END IF;

    INSERT INTO e_produit (produit_no, nom, description, texte_no, image_no, prix_conseille)
    VALUES (seq_produit.nextval, v_nouveau_nom, v_nouvelle_description, NULL, NULL, v_nouveau_prix_produit);

    IF SQL%ROWCOUNT > 0 THEN
        SELECT produit_no
        INTO v_nouveau_produit_no
        FROM e_produit
        WHERE nom = v_nouveau_nom AND prix_conseille = v_nouveau_prix_produit;

        DBMS_OUTPUT.PUT_LINE('Le nouveau produit a été inséré avec succès.');
        DBMS_OUTPUT.PUT_LINE('Détails du produit :');
        DBMS_OUTPUT.PUT_LINE('Numéro du produit : ' || v_nouveau_produit_no);
        DBMS_OUTPUT.PUT_LINE('Nom : ' || v_nouveau_nom);
        DBMS_OUTPUT.PUT_LINE('Description : ' || v_nouvelle_description);
        DBMS_OUTPUT.PUT_LINE('Prix conseillé : ' || v_nouveau_prix_produit);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l\'insertion du produit "' || v_nouveau_nom || '".');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: Aucun produit trouvé.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/



/*
QST 5-b
*/

DECLARE
    v_nom e_produit.nom%TYPE := 'Produit X';
    v_nouveau_prix e_produit.prix_conseille%TYPE := 1500.00;
    v_nb_lignes_modifiees INTEGER;
    v_prix_actuel e_produit.prix_conseille%TYPE;

    v_nouveau_produit_no e_produit.produit_no%TYPE;
    v_nouveau_nom e_produit.nom%TYPE := 'Produit A';
    v_nouvelle_description e_produit.description%TYPE := 'Description Produit A';
    v_nouveau_prix_produit e_produit.prix_conseille%TYPE := 200.00;

BEGIN
    UPDATE e_produit
    SET prix_conseille = v_nouveau_prix
    WHERE nom = v_nom;

    v_nb_lignes_modifiees := SQL%ROWCOUNT;

    IF v_nb_lignes_modifiees > 0 THEN
        SELECT prix_conseille
        INTO v_prix_actuel
        FROM e_produit
        WHERE nom = v_nom;

        DBMS_OUTPUT.PUT_LINE('Le prix du "' || v_nom || '" a été mis à jour à : ' || v_prix_actuel);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Aucune mise à jour effectuée. Le produit "' || v_nom || '" n\'existe pas.');
    END IF;

    INSERT INTO e_produit (produit_no, nom, description, texte_no, image_no, prix_conseille)
    VALUES (seq_produit.nextval, v_nouveau_nom, v_nouvelle_description, NULL, NULL, v_nouveau_prix_produit);

    IF SQL%ROWCOUNT > 0 THEN
        SELECT produit_no
        INTO v_nouveau_produit_no
        FROM e_produit
        WHERE nom = v_nouveau_nom AND prix_conseille = v_nouveau_prix_produit;

        DBMS_OUTPUT.PUT_LINE('Le nouveau produit a été inséré avec succès.');
        DBMS_OUTPUT.PUT_LINE('Détails du produit :');
        DBMS_OUTPUT.PUT_LINE('Numéro du produit : ' || v_nouveau_produit_no);
        DBMS_OUTPUT.PUT_LINE('Nom : ' || v_nouveau_nom);
        DBMS_OUTPUT.PUT_LINE('Description : ' || v_nouvelle_description);
        DBMS_OUTPUT.PUT_LINE('Prix conseillé : ' || v_nouveau_prix_produit);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l\'insertion du produit "' || v_nouveau_nom || '".');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: Aucun produit trouvé.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/



/*
QST 5-c
*/
DECLARE
    v_nom e_produit.nom%TYPE := 'Produit X';
    v_nouveau_prix e_produit.prix_conseille%TYPE := 1500.00;
    v_nb_lignes_modifiees INTEGER;
    v_prix_actuel e_produit.prix_conseille%TYPE;

    v_nouveau_produit_no e_produit.produit_no%TYPE;
    v_nouveau_nom e_produit.nom%TYPE := 'Produit A';
    v_nouvelle_description e_produit.description%TYPE := 'Description Produit A';
    v_nouveau_prix_produit e_produit.prix_conseille%TYPE := 200.00;

BEGIN
    UPDATE e_produit
    SET prix_conseille = v_nouveau_prix
    WHERE nom = v_nom;

    v_nb_lignes_modifiees := SQL%ROWCOUNT;

    IF v_nb_lignes_modifiees > 0 THEN
        SELECT prix_conseille
        INTO v_prix_actuel
        FROM e_produit
        WHERE nom = v_nom;

        DBMS_OUTPUT.PUT_LINE('Le prix du "' || v_nom || '" a été mis à jour à : ' || v_prix_actuel);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Aucune mise à jour effectuée. Le produit "' || v_nom || '" n\'existe pas.');
    END IF;

    INSERT INTO e_produit (produit_no, nom, description, texte_no, image_no, prix_conseille)
    VALUES (seq_produit.nextval, v_nouveau_nom, v_nouvelle_description, NULL, NULL, v_nouveau_prix_produit);

    IF SQL%ROWCOUNT > 0 THEN
        SELECT produit_no
        INTO v_nouveau_produit_no
        FROM e_produit
        WHERE nom = v_nouveau_nom AND prix_conseille = v_nouveau_prix_produit;

        DBMS_OUTPUT.PUT_LINE('Le nouveau produit a été inséré avec succès.');
        DBMS_OUTPUT.PUT_LINE('Détails du produit :');
        DBMS_OUTPUT.PUT_LINE('Numéro du produit : ' || v_nouveau_produit_no);
        DBMS_OUTPUT.PUT_LINE('Nom : ' || v_nouveau_nom);
        DBMS_OUTPUT.PUT_LINE('Description : ' || v_nouvelle_description);
        DBMS_OUTPUT.PUT_LINE('Prix conseillé : ' || v_nouveau_prix_produit);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l\'insertion du produit "' || v_nouveau_nom || '".');
    END IF;

    -- Affichage des numéros de produits qui n'ont jamais été commandés
    DBMS_OUTPUT.PUT_LINE('Numéros de produits qui n\'ont jamais été commandés :');

    FOR rec IN (
        SELECT p.produit_no
        FROM e_produit p
        LEFT JOIN e_ligne l ON p.produit_no = l.produit_no
        WHERE l.commande_no IS NULL
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.produit_no);
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: Aucun produit trouvé.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur: ' || SQLERRM);
END;
/





