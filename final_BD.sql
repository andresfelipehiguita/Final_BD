CREATE OR REPLACE FUNCTION Calculo_del_ISBN13(ISBN10 IN VARCHAR2) RETURN VARCHAR2 IS

  isbn13 VARCHAR2(13) := '';
  calculo_isbn13 VARCHAR2(26) := '';
  suma NUMBER := 0;
  numero NUMBER := 0; 
  pos NUMBER := 1;  

  BEGIN
    isbn13 := '978' || substr(ISBN10,0,9);
    
    WHILE (pos <= 12) LOOP
      numero := substr(isbn13,(pos),1);
      IF (MOD(pos,2) = 0) 
        THEN suma := suma + (numero * 3);
        ELSE suma := suma + (numero * 1);
      END IF;
      pos := pos + 1;
    END LOOP;
    
    suma := 10 - MOD(suma,10);
    IF (suma = 10) 
      THEN suma := 0;
    END IF;
    
    calculo_isbn13 := isbn13 || suma;
    
  RETURN calculo_isbn13;
END Calculo_del_ISBN13;


BEGIN
  DBMS_OUTPUT.PUT_LINE('El código ISBN13 es: ' || Calculo_del_ISBN13('0306406152'));
END ;
