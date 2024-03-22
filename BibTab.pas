Unit BibTab;

Interface

// environnement

Const max = 100;
			maxL = 100;
			maxC = 100;
Type Tind = 1..max;
		 TindL = 1..maxL;
		 TindC = 1..maxC;
		 Tab1D = Array[Tind] of Longint;
		 Tab2D = Array[Tind,Tind] of Longint;
		 
(* ============= Fonctions ============ *)

{01} Function RechV (T:Tab1D; Tai:Tind; V:Integer) : Boolean;
// PSearch the value V in an array of 1D //
{02} Function NbeV (T:Tab1D; Tai:Tind; V:integer) : Integer;
// Gives the numbers of elements that are equals to V in an array of 1D //
{03} Function minTab1D (T:Tab1D; Tai:Tind) : Integer;
// Gives the smallest element in an array of 1D //
{04} Function maxTab1D (T:Tab1D; Tai:Tind) : Integer;
// Gives the biggest element in an array of 1D //
{05} Function  indDuMin (T:Tab1D; B1,B2:Tind) : Tind;
// Give the index of the smallest element in a part of an array //
{06} Function RechDichv (T:Tab1D; Tai:Tind; V:Integer) : Boolean;
// Dichotomic search //

(* ============= Procedures ============ *)

(* 1D *)
{01} Procedure Lect1D (Var T:Tab1D; Var Tai:Tind);
// Read an array of one dimension //
{02} Procedure Ecrire1D (T:Tab1D; Tai:Tind);
// Write an array of one dimension //
{03} Procedure Alea1Dm (Var T:Tab1D; Var Tai:Tind);
// Fills an array of one dimension randomly with numbers between min amd max //
{04} Procedure Alea1D (Var T:Tab1D; Var Tai:Tind);
// Fills an array of one dimension randomly with numbers between 1 amd 99 //
{05} Procedure Merge2T(T1,T2 : Tab1D ; tai1,tai2: Tind ; Var T12 : Tab1D ; Var tai : Tind);
// Merge two sorted arrays //
{06} Procedure MergeNT(N : Integer ; Var T : Tab1D ; Var tai : Tind);
// Merge N sorted arrays //

(* 2D *)
{01} Procedure Lect2D (Var T:Tab2D ; Var Nbl:Tind ; Var Nbc:Tind);
// Read an array of two dimensions //
{02} Procedure Ecrire2D (T:Tab2d; Nbl:TindL; Nbc:TindC);
// Writes an array of two dimensions //
{03} Procedure Alea2D (Var T:Tab2D; Var Nbl:TindL; Var Nbc:TindC);
// Fills an array of two dimensions randomly with numbers between 1 amd 99 //
{04} Procedure permut_LC (T:Tab2D; Var Nbl:TindL; Var Nbc:TindC; Var T2:Tab2D);
// Swapps the line and the columns of a matrix //
{05} Procedure SomCol (T:Tab2D; Nbl:TindL; Nbc:TindC; var scol:Tab1d);
// Gives an array of 1D that contains the sum of the column of the matrix //
{06} Procedure convert2Dto1D (T2:Tab2D; Nbl:TindL; Nbc:TindC; Var T1:Tab1D; Var Tai:Tind);
// Transforms a matrix to an array of 1D //

(* Tris *)
{01} Procedure Tri_bulles (Var T:Tab1D; Tai:Tind);
// Sorts the elements of T in an ascending order //
{02} Procedure Trisel (var T:Tab1D; Tai:Tind);
// Sorts the elements of T in an ascending order //

Implementation

(* ==================== Fonctions  =================== *)

{01}
Function RechV (T:Tab1D; Tai:Tind; V:Integer) : Boolean;
	Var i : Integer;
			Trouve : Boolean;
	Begin
		Trouve := False;
		i := 1;
		While (i<=Tai) and (Trouve=False) Do
			Begin
				if T[i]=V Then Trouve:=True;
				i := i+1;
			End;
		RechV := Trouve;
	End;

{02}
Function Nbev (T:Tab1D; Tai:Tind; V:integer) : Integer;
	Var i, cpt : Integer;
	Begin
		cpt := 0;
		For i:=1 to Tai Do
			Begin
				If T[i]=V Then cpt := cpt+1;
			End;
		NbeV := cpt;
	End;

{03}
Function minTab1D (T:Tab1D; Tai:Tind) : Integer;
	Var i : Integer;
			min : Integer;
	Begin
		min := T[1];
		For i:=1 To Tai Do
			Begin
				IF min>T[i] Then min := T[i];
			End;
		minTab1D := min;
	End;

{04}
Function maxTab1D (T:Tab1D; Tai:Tind) : Integer;
	Var i : Integer;
			max : Integer;
	Begin
		max := T[i];
		For i:=1 to Tai Do
			Begin
				If max<T[i] Then max := T[i];
			End;
		maxTab1D := max;
	End;

{05}
Function  indDuMin (T:Tab1D; B1,B2:Tind) : Tind;
	Var Ind, i : Integer;
	Begin
		Ind := B1;
		For i:=(B1+1) to B2 Do
			Begin
				If T[i]<T[Ind] Then Ind := i;
			End;
		indDuMin := Ind;
	End;

{06}
Function RechDichv (T:Tab1D; Tai:Tind; V:Integer) : Boolean;
	Var min, max, mil : Integer;
			Trouv : Boolean;
	Begin
		Trouv := False;
		min := 1;
		max := Tai;
		While min<max Do
			Begin
				mil := (min+max) div 2;
				if T[mil]<V Then min := mil+1
				else max := mil;
				if T[mil]=V Then Trouv := True;
			End;
		RechDichV := Trouv;
	End;

(* ==================== Procedures  =================== *)

(* 1D *)
{01}
Procedure Lect1D (Var T:Tab1D; Var Tai:Tind);
	Var i : Integer;
	Begin
		Write ('Entrez la taille du vecteur : ');
		Readln (Tai);
		Writeln ('Donnez les valeurs du tableau : ');
		For i:=1 to Tai Do
			Begin
				Write ('T[', i, ']=');
				Readln (T[i]);
			End;
	End;

{02}
Procedure Ecrire1D (T:Tab1D; Tai:Tind);
	Var i : Integer;
	Begin
		For i:=1 To Tai Do
			Write (T[i]:4,'|');
		Writeln;
	End;

{03}
Procedure Alea1Dm (Var T:Tab1D; Var Tai:Tind);
	Var i,min,max : Integer;
	Begin
		Randomize;
		Write ('Entrez la taille du tableau : ');
		readln (Tai);
		Write ('[min,max] des valeurs aleatoires');
		Readln (min,max);
		For i:=1 to Tai Do
			Begin
				T[i] := min + Random ((max-min)+1);
			End;
	End;

{04} Procedure Alea1D (Var T:Tab1D; Var Tai:Tind);
	Var i : Integer;
	Begin
		Randomize;
		For i:=1 to Tai Do
			Begin
				T[i] := Random (99)+1;
			End;
	End;

{05}
Procedure Merge2T(T1,T2 : Tab1D ; tai1,tai2: Tind ; Var T12 : Tab1D ; Var tai : Tind);
	Var
 	 i,j,k : Integer;
	Begin
 	 tai := tai1 + tai2;
 	 i := 1;
 	 j := 1;
 	 k := 1;
 	 While (i <= tai1 ) And (j <= tai2) Do
 	   Begin
 	     If T1[i] <= T2[j] Then
 	       Begin
 	         T12[k] := T1[i];
 	         i := i + 1;
 	       End
 	     Else
 	       Begin
 	         T12[k] := T2[j];
 	         j := j + 1;
 	       End;
 	     k := k + 1;
 	   End;
 	 While i <= tai1 Do
 	   Begin
 	     T12[k] := T1[i];
 	     i := i + 1;
 	     k := k + 1;
 	   End;
 	 While j <= tai2 Do
 	   Begin
 	     T12[k] := T2[j];
 	     j := j + 1;
 	     k := k + 1;
 	   End;
	End;

{06}
Procedure MergeNT(N : Integer ; Var T : Tab1D ; Var tai : Tind);
	Var
 	 A1, A2 : Tab1D;
 	 Nt, i : Integer;
	 tai1, tai2 : Tind;
	Begin
		Write ('Donner le nombre de tableaux a combiner : ');
		Readln (N);
	  Lect1D(A1,tai1);
	  tai := tai1;
	  For Nt := 2 To N Do
	    Begin
	      Lect1D(A2,tai2);
	      tai := tai + tai2;
	      Merge2T(A1,A2,tai1,tai2,T,tai);
		    For i:=1 To tai Do
  		    Begin
 	    	     A1[i] := T[i];
 		         tai1 := tai;
       		End;
    	End;
  	//WRITE1D(T,tai);
	End;

(* 2D *)
{01}
Procedure Lect2D (Var T:Tab2D ; Var Nbl:Tind ; Var Nbc:Tind);
	Var i,j : Integer;
	Begin
		Write ('Nombre de lignes : ');
		Readln (Nbl);
		Write ('Nombre de colonnes : ');
		Readln (Nbc);
		For i:=1 to Nbl Do
			Begin
				For j:=1 to Nbc Do
					Begin
						Write ('T[', i, ',', j, ']=');
						Readln (T[i,j]);
					End;
			End;
	End;

{02}
Procedure Ecrire2D (T:Tab2d; Nbl:TindL; Nbc:TindC);
	Var i,j : Integer;
	Begin
		For i:=1 to Nbl Do
			Begin
				For j:=1 to Nbc Do
					Begin
						Write (T[i,j]:5, '|');
					End;
				Writeln;
			End;
	End;

{03}
Procedure Alea2D (Var T:Tab2D; Var Nbl:TindL; Var Nbc:TindC);
	Var i, j : Integer;
	Begin
		Randomize;
		For i:=1 to Nbl Do
			Begin
				For j:=1 to Nbc Do
					Begin
						T[i,j] := Random (99)+1;
					End;
			End;
	End;

{04}
Procedure permut_LC (T:Tab2D; Var Nbl:TindL; Var Nbc:TindC; Var T2:Tab2D);
	Var i,j : Integer;
	Begin
		For i:=1 to Nbc Do
			Begin
				For j:=1 to Nbl Do
					Begin
						T2[i,j] := T[j,i];
					End;
			End;
	End;

{05}
Procedure SomCol (T:Tab2D; Nbl:TindL; Nbc:TindC; var scol:Tab1d);
	Var i, j : Integer;
			SomC : Integer;
	Begin
		For j:=1 to Nbc Do
			Begin
				SomC := 0;
				For i:=1 to Nbl Do
					Begin
						SomC := SomC + T[i,j];
					End;
				scol[j] := SomC;
			End;
	End;

{06}
Procedure convert2Dto1D (T2:Tab2D; Nbl:TindL; Nbc:TindC; Var T1:Tab1D; Var Tai:Tind);
	Var i, j, k : Integer;
	Begin
		Tai := Nbl*Nbc;
		k := 0;
		For i:=1 to Nbl Do
			Begin
				For j:=1 to Nbc Do
					Begin
						k := k+1;
						//k := ((i-1)*Nbc)+j;
						T1[k] := T2[i,j];
					End;
			End;
	End;
	
(* Tris *)
{01}
Procedure Tri_bulles (Var T:Tab1D; Tai:Tind);
	Var permut : Boolean;
			c, i : Integer;
	Begin
		Repeat
			permut := False;
			i := 1;
			Repeat
				if T[i] > T[i+1] Then
					Begin
						c := T[i];
						T[i] := T[i+1];
						T[i+1] := c;
						permut := True;
					End;
				i := i+1;
			Until (i=Tai);
		Until (permut=False);
	End;

{02}
Procedure Trisel (var T:Tab1D; Tai:Tind);
	Var i, indice, c : Integer;
	Begin
		For i:=1 to (Tai-1) Do
			Begin
				indice := indDuMin(T,i,Tai);
				c := T[i];
				T[i] := T[indice];
				T[indice] := T[i];
			End;
	End;

End.
