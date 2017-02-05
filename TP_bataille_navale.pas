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

		VAR : i,j : ENTIER

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
		i,j,i2,j2,i3,j3,i4,j4,i5,j5,k,l,compteur,direction : ENTIER

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



  			SI (compteur=2)  ALORS
  			DEBUT
  				GotoXY(1,16)
  				ECRIRE("Le bateau actuelle est le croiseur (4 cases)")
  				ECRIRE("Entrer la case en X")
  				LIRE(i2)
  				ECRIRE("Entrer la case en Y")
  				LIRE(j2)
   				SI (i2>0) ET (i2<10) ET (j2>0) ET (j2<10) ALORS
   					DEBUT
    				repeter
    					ECRIRE("placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)")
    						LIRE(direction)
    				JUSQU''a (direction=1) OU(direction=2)
     				SI direction=1 ALORS
      				DEBUT
       					SI i2>4 ALORS
       					DEBUT
      						repeter 
      							ECRIRE("La valeur est trop grETe pour les cases en X, entrer une nouvelle valeur")
      							LIRE(i2)
      						JUSQU''a (i2<6)
     					FINSI
      					i2<-i2+1
      					j2<-j2+1
       					POUR k<-i2 ALLANT de i2+3 FAIRE
      					DEBUT
      						GotoXY(i2,j2)
        					Write("O")
        					i2<-i2+1
        				FINPOUR
    					GotoXY(1,15)
    				FINSI
     				SI direction=2 ALORS
    				DEBUT
						SI (j2>6) OU(j2=j) ALORS
     						repeter 
    							ECRIRE("La valeur est trop grETe pour les cases en Y, entrer une nouvelle valeur")
    							LIRE(j2)
    						JUSQU''a (j2<6)
      						i2<-i2+1
      						j2<-j2+1
       						POUR l<-j2 ALLANT de j2+3 FAIRE
      						DEBUT
      							GotoXY(i2,j2)
        						Write("O")
        						j2<-j2+1
        					FINPOUR
                compteur<-compteur+1
     					FINSI
   					FINSI
   				FINSI




  			SI (compteur=3)  ALORS
  			DEBUT
  				GotoXY(1,15)
  				ECRIRE("Le bateau actuelle est le contre_torpilleur (3 cases)")
  				ECRIRE("Entrer la case en X")
  				LIRE(i3)
  				ECRIRE("Entrer la case en Y")
  				LIRE(j3)
   				SI (i3>0) ET (i3<10) ET (j3>0) ET (j3<10) ALORS
   					DEBUT
    				repeter
    					ECRIRE("placer votre sens de placement du bateau (1 pour horizontale, 2 pour vertical)")
    						LIRE(direction)
    				JUSQU''a (direction=1) OU(direction=2)
     				SI direction=1 ALORS
      				DEBUT
						SI (i3>6) OU(i3=i) OU(i3=i2) ALORS
       					DEBUT
      						repeter 
      							ECRIRE("La valeur est trop grETe pour les cases en X, entrer une nouvelle valeur")
      							LIRE(i3)
      						JUSQU''a (i3<6)
     					FINSI
      					i3<-i3+1
      					j3<-j+1
       					POUR k<-i3 ALLANT de i3+3 FAIRE
      					DEBUT
      						GotoXY(i3,j3)
        					Write("O")
        					i3<-i3+1
        				FINPOUR
    					GotoXY(1,15)
    				FINSI
     				SI direction=2 ALORS
    				DEBUT
						SI (j3>6) OU(j3=j) OU(j3=j2) ALORS
     						repeter 
    							ECRIRE("La valeur est trop grETe pour les cases en Y, entrer une nouvelle valeur")
    							LIRE(j3)
    						JUSQU''a (j3<6)
      						i3<-i3+1
      						j3<-j3+1
       						POUR l<-j3 ALLANT de j3+3 FAIRE
      						DEBUT
      							GotoXY(i3,j3)
        						Write("O")
        						j3<-j3+1
        					FINPOUR
   							compteur<-compteur+1
     					FINSI
   					FINSI
   				FINSI


  			SI (compteur=4)  ALORS
  			DEBUT
  				GotoXY(1,15)
  				ECRIRE("Le bateau actuelle est le sousMarin (3 cases)")
  				ECRIRE("Entrer la case en X")
  				LIRE(i4)
  				ECRIRE("Entrer la case en Y")
  				LIRE(j4)
   				SI (i4>0) ET (i4<10) ET (j4>0) ET (j4<10) ALORS
   					DEBUT
    				repeter
    					ECRIRE("placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)")
    						LIRE(direction)
    				JUSQU''a (direction=1) OU(direction=2)
     				SI direction=1 ALORS
      				DEBUT
						SI (i4>6) OU(i4=i) OU(i4=i2) OU(i4=i3) ALORS
       					DEBUT
      						repeter 
      							ECRIRE("La valeur est trop grETe pour les cases en X, entrer une nouvelle valeur")
      							LIRE(i4)
      						JUSQU''a (i4<6)
     					FINSI
      					i4<-i4+1
      					j4<-j4+1
       					POUR k<-i4 ALLANT de i4+3 FAIRE
      					DEBUT
      						GotoXY(i4,j4)
        					Write("O")
        					i4<-i4+1
        				FINPOUR
    					GotoXY(1,15)
    				FINSI
     				SI direction=2 ALORS
    				DEBUT
							SI (j4>6) OU(j4=j) OU(j4=j2) OU(i4=j3) ALORS
     						repeter 
    							ECRIRE("La valeur est trop grETe pour les cases en Y, entrer une nouvelle valeur")
    							LIRE(j4)
    						JUSQU''a (j4<6)
      						i4<-i4+1
      						j4<-j4+1
       						POUR l<-j4 ALLANT de j4+3 FAIRE
      						DEBUT
      							GotoXY(i4,j4)
        						Write("O")
        						j4<-j4+1
        					FINPOUR
   							compteur<-compteur+1
     					FINSI
   					FINSI
   				FINSI



  			SI (compteur=5)  ALORS
  			DEBUT
  				GotoXY(1,15)
  				ECRIRE("Le bateau actuelle est le torpilleur (2 cases)")
  				ECRIRE("Entrer la case en X")
  				LIRE(i5)
  				ECRIRE("Entrer la case en Y")
  				LIRE(j5)
   				SI (i5>0) ET (i5<10) ET (j5>0) ET (j5<10) ALORS
   					DEBUT
    				repeter
    					ECRIRE("placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)")
    						LIRE(direction)
    				JUSQU''a (direction=1) OU(direction=2)
     				SI direction=1 ALORS
      				DEBUT
						SI (i5>7) OU(i5=i) OU(i5=i2) OU(i5=i3) OU(i5=i4) ALORS
       					DEBUT
      						repeter 
      							ECRIRE("La valeur est trop grETe pour les cases en X, entrer une nouvelle valeur")
      							LIRE(i5)
      						JUSQU''a (i5<7)
     					FINSI
      					i5<-i5+1
      					j5<-j5+1
       					POUR k<-i5 ALLANT de i5+2 FAIRE
      					DEBUT
      						GotoXY(i5,j5)
        					Write("O")
        					i5<-i5+1
        				FINPOUR
    					GotoXY(1,15)
    				FINSI
     				SI direction=2 ALORS
    				DEBUT
						SI (j5>7) OU(j5=j) OU(j5=j2) OU(j5=j3) OU(j5=j4) ALORS
     						repeter 
    							ECRIRE("La valeur est trop grETe pour les cases en Y, entrer une nouvelle valeur")
    							LIRE(j5)
    						JUSQU''a (j5<3)
      						i5<-i5+1
      						j5<-j5+1
       						POUR l<-j5 ALLANT de j5+2 FAIRE
      						DEBUT
      							GotoXY(i5,j5)
        						Write("O")
        						j5<-j5+1
        					FINPOUR
  							compteur<-compteur+1
     					FINSI
   					FINSI
   				FINSI
  		JUSQU''a (compteur=5)
  		clrscr
  FIN 
FINDELAPROCEDURE


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
		i,j,i2,j2,i3,j3,i4,j4,i5,j5,k,l,compteur,direction : INTEGER;

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



  			If (compteur=2)  then
  			Begin
  				GotoXY(1,16);
  				Writeln('Le bateau actuelle est le croiseur (4 cases)');
  				Writeln('Entrer la case en X');
  				Readln(i2);
  				Writeln('Entrer la case en Y');
  				Readln(j2);
   				If (i2>0) and (i2<10) and (j2>0) and (j2<10) then
   					Begin
    				Repeat
    					Writeln('placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)');
    						Readln(direction);
    				Until (direction=1) or (direction=2);
     				If direction=1 then
      				Begin
       					If i2>4 then
       					Begin
      						Repeat 
      							Writeln('La valeur est trop grande pour les cases en X, entrer une nouvelle valeur');
      							Readln(i2);
      						Until (i2<6);
     					End;
      					i2:=i2+1;
      					j2:=j2+1;
       					for k:=i2 to i2+3 do
      					Begin
      						GotoXY(i2,j2);
        					Write('O');
        					i2:=i2+1;
        				End;
    					GotoXY(1,15);
    				End;
     				If direction=2 then
    				Begin
						If (j2>6) or (j2=j) then
     						Repeat 
    							Writeln('La valeur est trop grande pour les cases en Y, entrer une nouvelle valeur');
    							Readln(j2);
    						Until (j2<6);
      						i2:=i2+1;
      						j2:=j2+1;
       						for l:=j2 to j2+3 do
      						Begin
      							GotoXY(i2,j2);
        						Write('O');
        						j2:=j2+1;
        					End;
        					compteur:=compteur+1;
     					End;
   					End;
   				END;




  			If (compteur=3)  then
  			Begin
  				GotoXY(1,15);
  				Writeln('Le bateau actuelle est le contre_torpilleur (3 cases)');
  				Writeln('Entrer la case en X');
  				Readln(i3);
  				Writeln('Entrer la case en Y');
  				Readln(j3);
   				If (i3>0) and (i3<10) and (j3>0) and (j3<10) then
   					Begin
    				Repeat
    					Writeln('placer votre sens de placement du bateau (1 pour horizontale, 2 pour vertical)');
    						Readln(direction);
    				Until (direction=1) or (direction=2);
     				If direction=1 then
      				Begin
						If (i3>6) or (i3=i) or (i3=i2) then
       					Begin
      						Repeat 
      							Writeln('La valeur est trop grande pour les cases en X, entrer une nouvelle valeur');
      							Readln(i3);
      						Until (i3<6);
     					End;
      					i3:=i3+1;
      					j3:=j+1;
       					for k:=i3 to i3+3 do
      					Begin
      						GotoXY(i3,j3);
        					Write('O');
        					i3:=i3+1;
        				End;
    					GotoXY(1,15);
    				End;
     				If direction=2 then
    				Begin
						If (j3>6) or (j3=j) or (j3=j2) then
     						Repeat 
    							Writeln('La valeur est trop grande pour les cases en Y, entrer une nouvelle valeur');
    							Readln(j3);
    						Until (j3<6);
      						i3:=i3+1;
      						j3:=j3+1;
       						for l:=j3 to j3+3 do
      						Begin
      							GotoXY(i3,j3);
        						Write('O');
        						j3:=j3+1;
        					End;
   							compteur:=compteur+1;
     					End;
   					End;
   				END;


  			If (compteur=4)  then
  			Begin
  				GotoXY(1,15);
  				Writeln('Le bateau actuelle est le sousMarin (3 cases)');
  				Writeln('Entrer la case en X');
  				Readln(i4);
  				Writeln('Entrer la case en Y');
  				Readln(j4);
   				If (i4>0) and (i4<10) and (j4>0) and (j4<10) then
   					Begin
    				Repeat
    					Writeln('placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)');
    						Readln(direction);
    				Until (direction=1) or (direction=2);
     				If direction=1 then
      				Begin
						If (i4>6) or (i4=i) or (i4=i2) or (i4=i3) then
       					Begin
      						Repeat 
      							Writeln('La valeur est trop grande pour les cases en X, entrer une nouvelle valeur');
      							Readln(i4);
      						Until (i4<6);
     					End;
      					i4:=i4+1;
      					j4:=j4+1;
       					for k:=i4 to i4+3 do
      					Begin
      						GotoXY(i4,j4);
        					Write('O');
        					i4:=i4+1;
        				End;
    					GotoXY(1,15);
    				End;
     				If direction=2 then
    				Begin
							If (j4>6) or (j4=j) or (j4=j2) or (i4=j3) then
     						Repeat 
    							Writeln('La valeur est trop grande pour les cases en Y, entrer une nouvelle valeur');
    							Readln(j4);
    						Until (j4<6);
      						i4:=i4+1;
      						j4:=j4+1;
       						for l:=j4 to j4+3 do
      						Begin
      							GotoXY(i4,j4);
        						Write('O');
        						j4:=j4+1;
        					End;
   							compteur:=compteur+1
     					End;
   					End;
   				END;



  			If (compteur=5)  then
  			Begin
  				GotoXY(1,15);
  				Writeln('Le bateau actuelle est le torpilleur (2 cases)');
  				Writeln('Entrer la case en X');
  				Readln(i5);
  				Writeln('Entrer la case en Y');
  				Readln(j5);
   				If (i5>0) and (i5<10) and (j5>0) and (j5<10) then
   					Begin
    				Repeat
    					Writeln('placer votre direction de placement du bateau (1 pour horizontale, 2 pour vertical)');
    						Readln(direction);
    				Until (direction=1) or (direction=2);
     				If direction=1 then
      				Begin
						If (i5>7) or (i5=i) or (i5=i2) or (i5=i3) or (i5=i4) then
       					Begin
      						Repeat 
      							Writeln('La valeur est trop grande pour les cases en X, entrer une nouvelle valeur');
      							Readln(i5);
      						Until (i5<7);
     					End;
      					i5:=i5+1;
      					j5:=j5+1;
       					for k:=i5 to i5+2 do
      					Begin
      						GotoXY(i5,j5);
        					Write('O');
        					i5:=i5+1;
        				End;
    					GotoXY(1,15);
    				End;
     				If direction=2 then
    				Begin
						If (j5>7) or (j5=j) or (j5=j2) or (j5=j3) or (j5=j4) then
     						Repeat 
    							Writeln('La valeur est trop grande pour les cases en Y, entrer une nouvelle valeur');
    							Readln(j5);
    						Until (j5<3);
      						i5:=i5+1;
      						j5:=j5+1;
       						for l:=j5 to j5+2 do
      						Begin
      							GotoXY(i5,j5);
        						Write('O');
        						j5:=j5+1;
        					End;
  							compteur:=compteur+1;
     					End;
   					End;
   				END;
  		Until (compteur=5);

  	End;


Var
		abs,ord:INTEGER;
        abscisse,ordonne:CHAR;

Begin
clrscr;
creaplateau(abs,ord);
creabateau(abscisse,ordonne);
End.
