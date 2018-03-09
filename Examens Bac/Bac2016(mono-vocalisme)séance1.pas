program Untitled;
type tab =  array[1..20] of string;
  var t: tab;
      n:integer;
      v:char;
procedure saisie(var t:tab ; var n:integer);
var i,j:integer;
begin
    repeat
      write('donner n :');
      readln(n);
    until(n in[1..20]);

    for i:= 1 to n do
      repeat
        write('donner une chaine : ');
        readln(t[i]);
        j := 0;
        repeat
          j := j+1;
        until( not(upcase(t[i][j]) in ['A'..'Z']) or (j = length(t[i])) );
      until( (upcase(t[i][j]) in ['A'..'Z']) and (length(t[i]) in [3..15]) );

end;

procedure saisir_v(var v:char);
begin
    repeat
      write('donner une voyelle :');
      readln(v);
    until( upcase(v) in['A'..'Z']);
end;

procedure afficher(n:integer;t:tab;v:char);
var i,j,occ:integer;
    test:boolean;
begin
     for i := 1 to n do
     begin
         occ := 0;
         j := 0;
         test := true;
         repeat
            j := j+1;
            if(upcase(t[i][j]) = upcase(v)) then
              occ := occ +1;
            if ( (upcase(t[i][j]) in ['A','E','U','I','O','Y'])and (upcase(t[i][j]) <> upcase(v))) then
               test := false;
         until( (test = false) or (j = length(t[i])) );
         if( (occ > 0) and (test = true )) then
            writeln(t[i]);
     end;
end;


begin
     saisie(t,n);
     saisir_v(v);
     afficher(n,t,v);
     readln();
end.
