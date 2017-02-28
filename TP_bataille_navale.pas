{
	ALGORITHME : bataille_navale
	BUT : ce programme créera et gérera la bataille navale, à savoir la création de la grille, des bateaux  ainsi que le système de jeu contre un autre joueur
	ENTREE : le placement des bateaux et les tirs
	SORTIE : des messages avertissant commequoi le tir a réussi ou échoué, ainsi que la fenêtre de victoire
	CONST:
		MAX<-11 : ENTIER

	TYPE cases=ENREGISTREMENT
		abs,ord : ENTIER;
	FIN ENREGISTREMENT

	TYPE bateau=ENREGISTREMENT
		porteAvion:TABLEAU[1..5] de cases;
		croiseur:TABLEAU[1..4] de cases;
		contre_torpilleur:TABLEAU[1..3] de cases;
		sousMarin:TABLEAU[1..3] de cases;
		torpilleur:TABLEAU[1..2] de cases;
	FIN ENREGISTREMENT

	TYPE flotte=ENREGISTREMENT
		tabflotte=TABLEAU[1..MAX] de bateau
	FIN ENREGISTREMENT

	Procedure creaplateau [(VAR abr,ord:ENTIER)]

		VAR : i,j,compteur,direction : ENTIER

		DEBUT
			POUR i ALLANT DE 1 a MAX FAIRE
				POUR j ALLANT DE 1 a MAX FAIRE
					ord<-ord+1
					abs<-abs+1
					SI (j=1) ET (i>1) ALORS
						ECRIRE (chr(63+i))
						SINON SI (i=1) ET (j>1) ALORS
							ECRIRE (-1+j)
							SINON SI (i=1) ET (j=1) ALORS
								ECRIRE " "
					SINON
						ECRIRE " "
					FINSI
				FINPOUR
			FINPOUR
		FIN
	FINDELAPROCEDURE

	fonction comparaison[(abs,ord:CHARACTERE): BOOLEEN]

		DEBUT
			SI (ord<>" ") ET (abs<>" ") ALORS
			DEBUT
				comparaison<-VRAI
			SINON
				comparaison<-FAUX
			FINSI
		FIN
	FINDELAFONCTION


procedure creabateau(abs,ord:CHARACTERE)

	var
		i,j ENTIER

	DEBUT		
 		compteur<-1
 		GotoXY(1,15)
 		repeter
			ECRIRE("Entrer le bateau "& compteur&" entre 1 et 10")
  			SI (compteur=1)  ALORS
  				ECRIRE("Le bateau actuelle est le porte avion (5 cases)")
  				ECRIRE("Entrer la case en X")
  				LIRE(i)
  				ECRIRE("Entrer la case en Y")
  				LIRE(j)
   				SI (i>0) ET (i<10) ET (j>0) ET (j<10) ALORS
    				repeter
    					ECRIRE("placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)")
    						LIRE(direction)
    				JUSQU''a (direction=1) OU(direction=2)
     				SI direction=1 ALORS
      				DEBUT
       					SI i>5 ALORS
       					DEBUT
      						repeter 
      							ECRIRE("La valeur est trop grETe pour les cases en X, entrer une nouvelle valeur")
      							LIRE(i)
      						JUSQU''a (i<6)
     					FINSI
      					i<-i+1
      					j<-j+1
       					POUR k<-i ALLANT de i+4 FAIRE
      					DEBUT
      						GotoXY(i,j)
        					Write("O")
        					i<-i+1
        				FINPOUR
    					GotoXY(1,15)
    				FINSI
     				SI direction=2 ALORS
    				DEBUT
       					SI j>5 ALORS
     						repeter 
    							ECRIRE("La valeur est trop grETe pour les cases en Y, entrer une nouvelle valeur")
    							LIRE(j)
    						JUSQU''a (j<6)
      						i<-i+1
      						j<-j+1
       						POUR l<-j ALLANT de j+4 FAIRE
      						DEBUT
      							GotoXY(i,j)
        						Write("O")
        						j<-j+1
        					FINPOUR
   							compteur<-compteur+1
     					FINSI
   					FINSI
   				FINSI





	VAR
		abs,ord : ENTIER

	DEBUT
		abs<-1
		ord<-1
		creaplateau(abs,ord)
	FIN


}





program bataille_navale;

USES crt,math;

CONST
	MAX=11;

TYPE
	cases = record

		abs,ord : integer;
END;

TYPE
	bateau = record
		porteAvion:array[1..5] of cases;
		croiseur:array[1..4] of cases;
		contre_torpilleur:array[1..3] of cases;
		sousMarin:array[1..3] of cases;
		torpilleur:array[1..2] of cases;
END;

TYPE
	flotte = record
		tabflotte : array[1..MAX] of bateau;
END;


procedure creaplateau(VAR abs,ord:integer);	//crée la grille de jeu


Var
i, j: integer;

Begin
For i:=1 to MAX do
Begin
For j:=1 to MAX do
        Begin
        	IF (j=1) and (i>1) then
        	Begin
        		write(chr(63+i));
        	END
        	else IF (i=1) and (j>1) then
        	Begin
        		write(-1+j);
        	END
        	else IF (i=1) and (j=1) then
        	begin
        		write(' ');
        	end
        	else
        	begin
				Write(' ');
			end;
        End;
        Writeln;
End;
End;

{
function comparaison(abs,ord:CHAR): BOOLEAN;		//teste si la case est occupé ou non

	Begin
		for 
		if (ord<>' ') and (abs<>' ') then
		begin
			comparaison:= true;
		end
		else
		begin
			comparaison:=false;
		end;
	end;
}

procedure creabateau(abs,ord:CHAR);		//place les bateaux

	var
		i,jcompteur,direction : INTEGER;

	Begin		
 		compteur:=1;
 		GotoXY(1,15);
 		Repeat
			Writeln('Entrer le bateau ', compteur,' entre 1 et 10');
  			If (compteur=1)  then
  			Begin
  				Writeln('Le bateau actuelle est le porte avion (5 cases)');
  				Writeln('Entrer la case en X');
  				Readln(i);
  				Writeln('Entrer la case en Y');
  				Readln(j);
   				If (i>0) and (i<10) and (j>0) and (j<10) then
   					Begin
    				Repeat
    					Writeln('placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)');
    						Readln(direction);
    				Until (direction=1) or (direction=2);
     				If direction=1 then
      				Begin
       					If i>5 then
       					Begin
      						Repeat 
      							Writeln('La valeur est trop grande pour les cases en X, entrer une nouvelle valeur');
      							Readln(i);
      						Until (i<6);
     					End;
      					i:=i+1;
      					j:=j+1;
       					for k:=i to i+4 do
      					Begin
      						GotoXY(i,j);
        					Write('O');
        					i:=i+1;
        				End;
    					GotoXY(1,15);
    				End;
     				If direction=2 then
    				Begin
       					If j>5 then
     						Repeat 
    							Writeln('La valeur est trop grande pour les cases en Y, entrer une nouvelle valeur');
    							Readln(j);
    						Until (j<6);
      						i:=i+1;
      						j:=j+1;
       						for l:=j to j+4 do
      						Begin
      							GotoXY(i,j);
        						Write('O');
        						j:=j+1;
        					End;
   							compteur:=compteur+1;
     					End;
   					End;
   				END;



 
Var
		abs,ord:INTEGER;
        abscisse,ordonne:CHAR;

Begin
clrscr;
creaplateau(abs,ord);
creabateau(abscisse,ordonne);
End.
