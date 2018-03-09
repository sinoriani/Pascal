program number;
uses wincrt;
var num:string;

function verif(num:string):boolean;
var i:integer;
begin
     i := 0;
     repeat
       i := i + 1;
     until( not(num[i] in ['0'..'9']) or (i = length(num)));
     verif := (num[i] in ['0'..'9']) and (length(num) = 8); 
end;


procedure saisie(var num:string);
begin
  repeat
    writeln('donner le numero : ');
    readln(num);
  until(verif(num) = true);
  clrscr;
end;

procedure deviner(num:string);
var proposition:string;
    essais,i,posProposition:integer;
begin
    essais := 0;
    repeat
       writeln('proposer un numero : ');
       readln(proposition);
       
       for i := 1 to 8 do
         begin
           posProposition := pos(proposition[i],num);
           if(posProposition <> 0) then
            begin
             if(proposition[i] <> num[i] ) then
               begin
               writeln(proposition[i],' qui est a la pos ',i,' est mal place');
               proposition[i] := '-';
               end;           
               
            end
            else proposition[i] := '-';
         end;
         essais := essais + 1;
         writeln('Vous avez encore ',8-essais,' essais');

    writeln(proposition);
     
    until((proposition = num) or (essais = 8) );

    if(proposition = num) then
      writeln('Bravo vous avez gangne!')
    else writeln('Desole , vous avez perdu');
end;



begin
     saisie(num);
     deviner(num);
     readln();
end.
