program bac2017s5;
uses wincrt;
type tab= array[1..250] of string[7];
     tabint = array[1..250] of longint;
const p1 = 80;
      p2 = 160;
var n:integer;
    TE,TB:tab;
    TBU:tabint;

function valideCode(ch:string):boolean;
var a,e:integer;
begin
     val(ch,a,e);
     valideCode := (e = 0) and (length(ch) = 6);
end;

function valideNombre(ch:string):boolean;
var i,p,a,b,e:integer;
    
begin
     i := 0;
     repeat
        i:= i+1;
     until( not(ch[i] in ['0'..'9','#']) or (i = length(ch)) ) ;

    p := pos('#',ch);
    val(copy(ch,1,p-1 ) , a, e ) ;
    val(copy(ch,p+1,length(ch)) , b , e);

     valideNombre := (ch[i] in ['0'..'9','#'] )  and (a <=999) and (b<= 999) and (p <> 0);
end;


procedure remplir( var TE,TB:tab;var n:integer);
var i:integer;
begin
   repeat
      write('donner le nombre d''ecoles : ');
      readln(n);
   until( (n >= 2) and (n <= 250) );

   for i :=1 to n do
   begin
    repeat
       write('donner le code de l''ecole ',i,' : ');
       readln(TE[i]);
    until(valideCode(TE[i]) = true);

    repeat
       write('donner le nbr de tableaux et de tables : ');
       readln(TB[i]);
    until( valideNombre(TB[i]) = true);
   end;
    
end;

procedure generer(TB:tab;var TBU:tabint;n:integer);
var i,e,p,tableaux,tables:integer;
begin
    for i:= 1 to n do
    begin
         p := pos('#',TB[i]);
         val(copy(TB[i],1,p-1 ) , tableaux, e ) ;
         val(copy(TB[i],p+1,length(TB[i])-  length(copy(TB[i],1,p)) ) , tables , e);
        
        TBU[i] := (p1 * tableaux) + (p2 * tables);
    end;
end;

procedure afficher(TE:tab;TBU:tabint;n:integer);
var i:integer;
    max:longint;
begin
     writeln('les ecoles sont :');

     max := TBU[1];
     for i:= 2 to n do
        if( TBU[i] > max ) then
           max := TBU[i];

     for i:=1 to n do
        if( TBU[i] = max) then
           writeln('l''ecole ',TE[i],' : ',max,' D');
end;


begin
      remplir(TE,TB,n);
      generer(TB,TBU,n);
      afficher(TE,TBU,n);
end.
