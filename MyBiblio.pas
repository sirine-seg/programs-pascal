Unit MyBiblio;
// Contains important modules //

Interface

(* ==================== Functions  =================== *)

{01} Function Nb_Pos (N:Integer) : Integer;
// Gives the number of positions (digits) of N //
{02} Function Power_Pos (N:Integer) : Integer;
// Gives the power of greatest digit of N. Ex 2345 -> 1000 //
{03} Function Freq_ch (N,ch:Integer) : Integer;
// Gives the frequence (number) of appearance of N //
{04} Function N_Prime (N:Integer) : Boolean;
// Returns true if N is a prime number //
{05} Function Power (N,p:Integer) : Integer;
// Returns N power p //
{06} Function Concat (N1,N2:Integer) : Integer;
// Concatinates N1 and N2. Ex: 123 et 4567 --> 1234567 //
{07} Function Mirror (N:Integer) : Integer;
// Mirroir effect, reverse the Number //
{08} Function Swapp (N:Integer) : Integer;
// Swapps the higher and lower digits of N //
{09} Function max (N1,N2:Integer) : Integer;
// Returns the biggest number between N1 and N2 //
{10} Function min (N1,N2:Integer) : Integer;
// Reutrns the smallest number between N1 and N2 //
{11} Function max_ch (N:Integer) : Integer;
// Returns the biggest digit of N //
{12} Function min_ch (N:Integer) : Integer;
// Returns the smallest digit of N //
{13} Function Check_Nb (N,ch:Integer) : Boolean;
// Returns true if the digit ch is one of the digits of N //
{14} Function Remp_ch (N,p,c:Integer) : Integer;
// Remplace all the digits p in N, by c //
{15} Function Croissant (N:Integer) : Integer;
// Sort in ascending order the digits of N //

(* ================== Procedures ================= *)

{01} Procedure Permut (Var A,B:Integer);
// Permuts the content of A and B  //

Implementation

(* ==================== Functions  =================== *)

{01}
Function Nb_Pos (N:Integer) : Integer;
	Var Position : Integer;
	Begin
		Position := 0;
		Repeat
			N := N div 10;
			Position := Position + 1;
		Until N=0;
		Nb_Pos := Position;
	End;

{02}
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

{03}
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

{04}
Function N_Prime (N:Integer) : Boolean;
	Var i : Integer;
			Prime : Boolean;
	Begin
		If N<=1 Then Prime := False Else Prime := True;
		For i:=2 to (N div 2) Do
			Begin
				If (N mod i = 0) Then
					Prime := False
			End;
		N_Prime := Prime;
	End;

{05}
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

{06}
Function Concat (N1,N2:Integer) : Integer;
	Begin
		Concat := (N1 * Power_Pos(N2) * 10) + N2;
	End;

{07}
Function Mirror (N:Integer) : Integer;
	Var x, d, NI: Integer;
	Begin
		NI := 0;
		x := N;
		While x<>0 Do
			Begin
				d := x mod 10;
				x := x div 10;
				NI := NI*10+d;
			End;
		Mirror := NI;
	End;

{08}
Function Swapp (N:Integer) : Integer;
	Var x, puiss, unite, mid : Integer;
	Begin
		x := N;
  	puiss := 1;
		Repeat
    	x := x Div 10;
			puiss := puiss*10;
		Until x<9;
    unite := N Mod 10;
    mid := N-unite-x*puiss;
		Swapp := (mid+(unite*puiss)+x);
	End;

{09}
Function max (N1,N2:Integer) : Integer;
	Var Bigger : Integer;
	Begin
		If N1>N2 Then Bigger := N1
		Else Bigger := N2;
		max := Bigger;
	End;

{10}
Function min (N1,N2:Integer) : Integer;
	Var Smaller : Integer;
	Begin
		If N1>N2 Then Smaller := N2
		Else Smaller := N1;
		min := Smaller;
	End;

{11}
Function max_ch (N:Integer) : Integer;
	Var x, ch : Integer;
	Begin
		x := N;
		ch := x mod 10;
		Repeat
			x := x div 10;
			If (x mod 10)>ch then ch := x mod 10;
		Until x=0;
		max_ch := ch;
	End;

{12}
Function min_ch (N:Integer) : Integer;
	Var x, ch : Integer;
	Begin
		x := N;
		ch := x mod 10;
		Repeat
			If (x mod 10)<ch then ch := x mod 10;
			x := x div 10;
		Until x=0;
		min_ch := ch;
	End;

{13}
Function Check_Nb (N,ch:Integer) : Boolean;
	Var Sch, x : Integer;
	Begin
		Sch := 0;
		x := N;
		Repeat
			x := x div 10;
			Sch := Sch+1;
		Until x=0;
		Check_Nb := (Sch=ch);
	End;

{14}
Function Remp_ch (N,p,c:Integer) : Integer;
	Var x, position : Integer;
	Begin
		x := N;
		position := 1;
		Repeat
			position := position*10;
			if ((x	div position) mod 10)=p Then
				Begin
					x := x - (p*position) + (c*position);
				End;
		Until (position=Power_Pos(N));
		Remp_ch := x;
	End;

{15}
Function Croissant (N:Integer) : Integer;
	Var x, ch, crois : Integer;
	Begin
		crois := 0;
		For ch:=1 to 9 Do
			Begin
				x := N;
				Repeat
					if (x mod 10)=ch then crois := crois*10+ch;
					x := x div 10;
				Until x=0;
			End;
		Croissant := crois;
	End;

(* ==================== Procedures  =================== *)

{01}
Procedure Permut (Var A,B:Integer);
	Var Tmp : Integer;
	Begin
		Tmp := A;
		A := B;
		B := Tmp;
	End;

End.
