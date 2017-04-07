Program Bataille_Navale;

USES crt,sysutils;

CONST
	NBBATEAU = 2;
	MAXCASE = 2;	//taille max des bateaux
	MINL = 1;
	MAXL = 50;
	MINC = 1;
	MAXC = 50;

TYPE cases=record
		ligne : integer;
		col : integer;
END;

TYPE bateau = record
	mcase : Array[1..MAXCASE] of cases;
END;

TYPE flotte = record
	mbateau : Array[1..NBBATEAU] of bateau;
END;

TYPE
	positionbateau = (enligne,encolonne,endiagonnal);
	etatbateau = (toucher, couler);
	etatflotte = (aflot,asombrer);
	etatjoueur = (gagne,perd);


procedure creatcase(l,c:integer; VAR mcase:cases);	//crée la zone de jeu
	begin
		mcase.ligne:=l;
		mcase.col:=c;
	end;

function cmpcase(mcase,tcase:cases):boolean;	//verifie que la case selectionnée est compris dans la "zone de jeu"
	begin
		IF((mcase.col=tcase.col) AND (mcase.ligne=tcase.ligne)) THEN
		BEGIN
			cmpcase := TRUE;
		END
		ELSE
		BEGIN
			cmpcase := FALSE;
		END;
	END;

function Creatbateau(mcase:cases;taille: integer):bateau;	//permet de créer le(s) bateaux sur la zone de jeu
	VAR
		res: bateau;
		posbateau: positionbateau;
		pos,i : integer;
	begin
		pos:=random[1..3];
		posbateau:=positionbateau(pos);
		for i:=1 to MAXCASE do
		BEGIN
			if (i<taille) then
				BEGIN
					res.mcase[i].ligne:=mcase.ligne;
					res.mcase[i].col:=mcase.col;
				END
				ELSE
				BEGIN
					res.mcase[i].ligne:=0;
					res.mcase[i].col:=0;
				END;
			IF (positionbateau=enligne) THEN
			BEGIN
				mcase.col:=mcase.col+1;
			END
			ELSE IF (positionbateau=encolonne) THEN
			BEGIN
				mcase.ligne:=mcase.ligne+1;
			END
			ELSE IF (positionbateau=endiagonnal) THEN
			begin
					mcase.ligne:=mcase.ligne+1;
					mcase.col:=mcase.col+1;
			END;
		END;
	END;

FUNCTION ctrlcase(mBat:bateau;mcase:cases):boolean;	//Vérifie si la case appartient à  un bateau
	VAR
		i: integer;
		valtest:boolean;
	BEGIN
		valtest:=FALSE;
		FOR i:=1 to MAXCASE  do
			Begin
				IF(compcase(mBat.mcase[i],mcase)) then
				begin
					valtest:=TRUE;
				END;
			END;
			ctrlcase:=valtest;
	END;

Function ctrlflotte(mflotte:flotte;mcase:cases):boolean;	//verifie si la case appartient à une flotte bateau(ensemble de bateaux)
	VAR
		i:integer
		valtest:boolean;
	begin
		valtest:=FALSE;
		FOR i:=1 to NBBATEAU  do
		BEGIN
			IF (ctrlcase(mflotte.mbateau[i],mcase)) then
			begin
				valtest:=TRUE;
			END;
		END;
		ctrlflotte:=valtest;
	END;


VAR
	etatbatJ1,etatbatJ2 : etatbateau;
	etatflotteJ1,etatflotteJ2 : etatflotte;
	J1,J2 : etatjoueur;
	posbat,posbat2: bateau;
	x,y,x2,y2,tir1,tir2,tirL,tirC,tirR: integer;

BEGIN
	clrscr;
	randomize;
	writeln('Bienvenue sur le jeu Bataille Navale(2 joueurs)');
	writeln('Joueur 1, veuillez saisir les coordonnees de x en abscisse et y en ordonnee, compris entre ',MINL,'et ',MAXL,' afin de placer votre bateaux');
	repeat
		writeln('x?');
		readln(x);
		writeln('y?');
		readln(y);
	Until ((x>=MINL) AND (x<=MAXL) AND (y>=MINC) AND (y<=MAXC));
	creatcase(x,y);
	posbat:=Creatbateau(x,y);



	clrscr;
	writeln('Joueur 2, veuillez saisir les coordonnees de x en abscisse et y en ordonnee, compris entre ',MINL,'et ',MAXL,' afin de placer votre bateaux');
	repeat
		writeln('x?');
		readln(x2);
		writeln('y?');
		readln(y2);
	Until ((x2>=MINL) AND (x2<=MAXL) AND (y2>=MINC) AND (y2<=MAXC));
	creatcase(x2,y2);
	posbat2:=Creatbateau(x2,y2);

	repeat
		clrscr;
		writeln('joueur 1');
		writeln('tirs effectué : ',tir1);
		writeln('tirs réussi : ', tirR)
		repeat
			writeln(' veuillez effectuer votre tir');
			writeln('x?');
			readln(tirL);
			writeln('y?');
			readln(tirC);
		Until (cmpcase(tirL,tirC)=TRUE);
		tir1:=tir1+1;
		if ctrlcase(tirL,tirC,posbat2)=TRUE then
		begin
			etatbatJ2:=toucher;
			


END.
