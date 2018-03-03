program cryptage;
uses wincrt;

var p:integer;
    m:string;


function valide(m:string):boolean;
var i:integer;
begin
     i := 0;
     repeat
           i := i + 1;
     until( not(m[i] in ['a'..'z','A'..'Z',' ']) or (i = length(m)) );
     valide := m[i] in ['a'..'z','A'..'Z',' '] ;

end;

procedure saisie(var m:string);
begin
    repeat
          write('donner le message : ');
          readln(m);
    until ( valide(m) = true);
end;

function nbMot(m:string):integer;
var nb,i:integer;
begin
     nb := 0;
     for i := 1 to length(m) do
         if(m[i] = ' ') then
           nb := nb + 1;

     if(m[length(m)] <> ' ') then
         nb := nb + 1;

         nbMot := nb;
end;

function crypter(m:string;p:integer):string;
var i:integer;
begin
     for i:=1 to length(m) do
         begin
           if(m[i] <> ' ') then
           begin
             m[i] := chr( ord(m[i]) + p);
             if(ord(upcase( m[i] )) > ord('Z') ) then
               m[i] := chr(ord(m[i]) - 26);
           end;
         end;  
     crypter := m;
end;

begin
    saisie(m);
    p := nbMot(m);
    writeln(crypter(m,p));
end.
