Unit BibOther;
// Contains other modules //

Interface

(* ==================== Fonctions  =================== *)

{00} Function Power (N,p:Integer) : Integer;
// N^p //
{00} Function Power_Pos (N:Integer) : Integer;
// Ex: 2345 -> 1000 //
{00} Function Freq_ch (N,ch:Integer) : Integer;
// Ex: (N=1226729 | ch=2) -> 3  //
{00} Function Concat (N1,N2:Integer) : Integer;
// Ex: 123 et 4567 --> 1234567 //
{01} Function Bisextille (year:Integer) : Boolean; 
// Returns true if the year has 366 days //
		{Bisextille = leap year = 366j}
{02} Function Factoriel (N:Integer) : LongInt;
// Calculats the factoriel of N //
{03} Function Check_Base (N,B:Integer) : Boolean;
// Checks wether a number is writen in the base B //
{04} Function CVRT_dec_bin (N:Integer) : Integer;
// Convert N from decilmal to binary //
{05} Function CVRT_dec_B (N,B:Integer) : Integer;
// Convert N from decimal to the base B //
{06} Function CVRT_bin_dec (N:Integer) : Integer;
// Convert N from binary to decimal //
{07} Function CVRT_B_dec (N,B:Integer) : Integer;
// Convert N from the base B to decimal //
{08} Function CVRT_B1_B2 (N,B1,B2:Integer) : Integer;
// Convert N from the base B1 to the base B2 //
{09} Function add_bin (N1,N2:Integer) : Integer;
// Make the addition of N1 and N2 that are written in binary //
{10} Function WhichBase (N1_b, N2_d:Integer) : Integer;
// Finds in which base N1 is written, given that N2 is N1 written in decimal //
{11} Function add_base (N1,N2,B:Integer) : Integer;
// Make the addition of N1 and N2 in the base B //
{12} Function add_bd_dec (N1,B1,N2,B2:Integer) : Integer;
// Make the addition of N1 and N2 that are written in the base B1 and B2 respectively, and return the result in decimal //
{13} Function PGCD (N1,N2:Integer) : Integer;
// Calculats the PGCD (GCD) of N1 and N2 //
{14} Function Nb_div (N:Integer) : Integer;
// Gives the numbers of dividers of N //
{15} Function Sum_dividers_Ni (N:Integer) : Integer;
// Gives the sum of the dividers of N. N included //
{16} Function Sum_dividers_Nh (N:Integer) : Integer;
// Gives the sum of the dividers of N. except N (hormis N) //
{17} Function Sum_ch (N:Integer) : Integer;
// Gives the sum of the digits of N //
{18} Function PerfectNum (N:Integer)  : Boolean;
// Rturns true if N is a perfect Number //
{19} Function circular_left_shift (N,ND:Integer) : Integer;
// Make ND circular left shift  Ex: (N=12345 | ND=2) -> 34512 //
{20} Function Code_Gray (N:Integer) : Integer;
// Gives the Gray Code of N //
	{if the number of the bits that are at 1 is even: we change the last bit/ if it's odd :we change the bit that is at the left of the first 1 from the right}
{21} Function Fibonacci (N:Integer) : Integer;
// Gives the Nth term of Fibonacci //
{22} Function Bande_9 (N1,N2:Integer) : Integer;
{The result of the addition of N1 and N2 (that are on 3 digits) is equals to 18}

(* ==================== Procedures  =================== *)
{01} Procedure uglyNumbers (inf,sup:Integer);
// Gives all ugly numbers between the two borns inf and sup, as well as there number //
		{Ugly numbers are numbers whose only prime factors are 2, 3 or 5}
{02} Procedure SuperHarshad (N:Integer);
{03} Procedure fibonacci_sequence (N:Integer);
// Gives the N first terms of the fibonacci sequence //
{04} Procedure primeNumbers (N:Integer);
// Gives all prime numbers between 1 and N //

Implementation

(* ==================== Fonctions  =================== *)

{00}
Function Power (N,p:Integer) : Integer;
	Var Puiss, i : Integer;
	Begin
		Puiss := 1;
		For i:=1 to p do
			Begin
				Puiss := Puiss*N;
			End;
		Power := Puiss;
	End;

{00}
Function Power_Pos (N:Integer) : Integer;
	Var Puiss : Integer;
	Begin
		Puiss := 1;
		While N>10 Do
			Begin
				N := N div 10;
				Puiss := Puiss*10;
			End;
		Power_pos := Puiss;
	End;

{00}
Function Freq_ch (N,ch:Integer) : Integer;
	Var x, a : Integer;
	Begin
		x := N;
		a:=0;
		Repeat
			If ((x mod 10)=ch) or ((x mod 10)=-ch) Then a:=a+1;
			x := x div 10;
		Until X=0;
		Freq_ch := a;
	End;

{00}
Function Concat (N1,N2:Integer) : Integer;
	Begin
		Concat := (N1 * Power_Pos(N2) * 10) + N2;
	End;


{01}
Function Bisextille (year:Integer) : Boolean;
	Var	Bis : Boolean;
	Begin
		if ((year mod 4 = 0) and (year mod 100 <> 0)) or (year mod 400 = 0) Then Bis := True
		Else Bis := False;
		Bisextille := Bis;
	End;

{02}
Function Factoriel (N:Integer) : LongInt;
	Var Fact, i : Integer;
	Begin
		Fact := 1;
		For i:=1 to N Do
			Begin
				fact := fact*i;
			End;
		Factoriel := Fact;
	End;

{03}
function Check_Base (N,B:Integer) : Boolean;
	Var x : Integer;
			belongs : Boolean;
	Begin
		x := N;
		belongs := True;
		Repeat
			If (x mod 10)>=B Then belongs := False;
			x := x div 10;
		Until x=0;
		Check_Base := belongs;
	End;

{04}
Function CVRT_dec_bin (N:Integer) : Integer;
	Var x, num, p : Integer;
	Begin
		x := N;
		num := 0;
		p := 0;
		Repeat
			num := num + (x mod 2)*Power(10,p);
			x := x div 2;
			p := p+1;
		Until x=0;
		CVRT_dec_bin := num;
	End;

{05}
Function CVRT_dec_B (N,B:Integer) : Integer;
	Var x, p, num: Integer;
	Begin
		x := N;
		num := 0;
		p := 0;
		Repeat
			num := num + (x mod B)*Power(10,p);
			x := x div B;
			p := p+1;
		Until x=0;
		CVRT_dec_B := num;
	End;

{06}
Function CVRT_bin_dec (N:Integer) : Integer;
	Var x, p, num : Integer;
	Begin
		x := N;
		num := 0;
		p := 0;
		Repeat
			num := num + (x mod 10)*Power(2,p);
			x := x div 10;
			p := p+1;
		Until x=0;
		CVRT_bin_dec := num;
	End;

{07}
Function CVRT_B_dec (N,B:Integer) : Integer;
	Var x, p, num : Integer;
	Begin
		x := N;
		num := 0;
		p := 0;
		Repeat
			num := num + (x mod 10)*Power(B,p);
			x := x div 10;
			p := p+1;
		Until x=0;
		CVRT_B_dec := num;
	End;

{08}
Function CVRT_B1_B2 (N,B1,B2:Integer) : Integer;
	Begin (* convertion of B1 to dec then from dec to B2 *)
		CVRT_B1_B2 := CVRT_dec_B((CVRT_B_dec(N,B1)),B2);
	End;

{09}
Function add_bin (N1,N2:Integer) : Integer;
	Var Nb : Integer;
	Begin
		Nb := CVRT_dec_bin(CVRT_bin_dec(N1) + CVRT_bin_dec(N2));
		add_bin := Nb;
	End;

{10}
Function WhichBase (N1_b, N2_d:Integer) : Integer;
	Var A, B: LongInt;
	Begin
  	B := 10;
 		Repeat
    	B := B-1;
    	A := CVRT_dec_B(N2_d,B);
  	Until (A=N1_b);
 		WhichBase := B;
	End;

{11}
Function add_base (N1,N2,B:Integer) : Integer;
	Begin
		 add_base := CVRT_dec_B(((CVRT_B_dec(N1,B))+(CVRT_B_dec(N2,B))),B);
	End;

{12}
Function add_bd_dec (N1,B1,N2,B2:Integer) : Integer;
	Begin
		 add_bd_dec := ((CVRT_B_dec(N1,B1))+(CVRT_B_dec(N2,B2)));
	End;

{13}
Function PGCD (N1,N2:Integer) : Integer;
	Var r, q : Integer;
	Begin
		r := N1 mod N2;
		while r>0 Do
			Begin
				 N1 := N2;
				 N2 := r;
				 r := N1 mod N2;
			End;
		PGCD := N2;
	End;

{14}
Function Nb_div (N:Integer) : Integer;
	Var d, i : Integer;
	Begin
		d := 1;
		For i:=1 to (N div 2) Do
			Begin
				if (N mod i = 0) Then d := d+1;
			End;
		Nb_div := d;
	End;

{15}
Function Sum_dividers_Ni (N:Integer) : Integer;
	Var i, S : Integer;
	Begin
		S := 0;
		for i:= 1 to (N div 2) Do
		Begin
			if (N mod i)=0 Then
				Begin
					S := S+i;
				End;
		End;
		Sum_dividers_Ni := S;
	End;

{16}
Function Sum_dividers_Nh (N:Integer) : Integer;
	Begin
		Sum_dividers_Nh := (Sum_dividers_Ni(N))+N;
	End;

{17}
Function Sum_ch (N:Integer) : Integer;
	Var NS, d, S: Integer;
	Begin
		NS := N;
		S := 0;
		Repeat
			d := NS mod 10;
			NS := NS div 10;
			S := S+d;
		Until NS=0;
		Sum_ch := S;
	End;

{18}
Function PerfectNum (N:Integer) : Boolean;
	Var S, i : Integer;
			P : Boolean;
	Begin
		S := 0;
		for i:=1 to (N div 2) Do
			Begin
				if (N mod i)=0 Then
						S:= S+i;
			End;
		{if S=N Then
			P := True
		Else
			P := False;}
		PerfectNum := (S=N);
	End;

{19}
Function circular_left_shift (N,ND:Integer) : Integer;
	Var p, ch_g, x, Nb : Integer;
	Begin
		x := 0;
		Repeat
			p := Power_Pos(N);
			ch_g := N div p;
		 	Nb := (N mod p)*10+ch_g;
			N := Nb;
			x := x+1;
		Until X=ND;
		circular_left_shift := N;
	End;

{20}
Function Code_Gray (N:Integer) : Integer;
	Var n_1, NG, b_1, p, x : Integer;
	Begin
		n_1 := Freq_ch(N,1);
		x := N;
		p := 1;
		If (n_1 mod 2)=0 Then
			Begin
				If (N mod 10)=1 Then NG := N-1
				Else NG := N+1; // N mod 10 = 0 (Il n'y a que des 0 est des 1. On peut comfirmer d'abord avec 'Chech_Base')
			End
		Else  // n_1 mod 2 = 1
			Begin
				Repeat
					b_1 := x mod 10;
					x := x div 10;
					p := p*10;
				Until b_1=1;
				If ((N div p) mod 10)=1 Then NG := N-p
				Else NG := N+p;
			End;
		Code_Gray := NG;
	End;

{21}
Function Fibonacci (N:Integer) : Integer;
	Var Curr, Prev, PrevPrev, x: Integer;
	Begin
		PrevPrev := 0;
		Prev := 1;
		Curr := 1;
		x := N;
		While (x>=2) do
			Begin
				 Curr := Prev + PrevPrev ;
				 PrevPrev := Prev;
				 Prev := Curr;
				 x := x-1;
			End;
		Fibonacci := Curr;
	End;

{22}
Function Bande_9 (N1,N2:Integer) : Integer;
	Var C, N, d, cpt : Integer;
	Begin
		cpt := 0;
		For N1:=123 to 987 Do
			Begin
				For N2:=123 to 987 Do
					Begin
						C := N1 + N2;
						if ((Sum_ch(C)=18) and (C<999)) Then
							Begin
								N := concat(concat(N1,N2),C);
								Repeat
									N := N div 10;
									d := N mod 10;
								Until (d=0) or (Freq_ch(N,d)>1);
								If N=0 then cpt := cpt+1;
								Bande_9 := Cpt;
							End;
					End;
			End;
	End;

(* ==================== Procedures  =================== *)

{01}
Procedure uglyNumbers (inf,sup:Integer);
	Var cpt, i, d : Integer;
	Begin
		cpt := 0;
		for i:=inf to sup Do
			Begin
				d := i;
				while (d mod 2 = 0) Do
					d := d div 2;
				While (d mod 3 = 0) Do
					d := d div 3;
				While (d mod 5 = 0) Do
					d := d div 5;
				if d=1 then
					Begin
						writeln (i);
						cpt := cpt + 1;
					End;
			End;
		Writeln ('There are ', cpt, ' Ugly Numbers between ', inf, ' and ', sup);
	End;

{02}
Procedure SuperHarshad (N:Integer);
	Var Nk, k, NS, S : Integer;
			Harshad : Boolean;
	Begin
		NK := N;
		Harshad := True;
		k := 1;
		While Harshad Do;
			Begin
				NS := NK;
				S := 0;
				While NK<>0 Do
					Begin
						S := S+(NK mod 10);
						NK := NK div 10;
					End;
				If (NS mod S)<>0 then
					Harshad := False
				Else
					Begin
						NK := NS*N;
						k := k+1;
					End;
			End;
		If k>2 Then
			Writeln (N, ',', k);
	End;

{03}
Procedure fibonacci_sequence (N:Integer);
	Var avder, prec, i, x : Integer;
	Begin
		avder := 0;
		prec := 1;
		writeln ('Les ', N, ' premiers nombres de la suite de Fibonacci sont : ');
		write (avder, '  ');
		for i:=2 to N Do
			Begin
				 x := prec;
				 prec := avder + prec;
				 avder := x;
				 write (avder, '  ');
			End;
	End;

{04}
Procedure primeNumbers (N:Integer);
	Var	i, x, d : Integer;
	Begin
		For i:=1 to N Do
			Begin // for i
				x:=0;
				for d:=1 to (i div 2) Do
					Begin // for d
						if (i mod d)=0 then
							x:=x+1;
					End; // for d
				if x=1 Then
					write (i, '  ');
			End; // for i
	End;

End.
