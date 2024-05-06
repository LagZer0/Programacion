program leerEnteros;

const
  Max_Digito = 10;

type
  vector = array[1..Max_Digito] of integer;

var
  vectorEnteros: vector;
  i, auxiliar, digito, maxOcurrencias, digitoMasRepetido: integer;

procedure CantidadOcurrencias(var vectorEnteros: vector; auxiliar: integer);
begin
  while (auxiliar <> 0) do
  begin
    digito := auxiliar mod 10;
    vectorEnteros[digito] := vectorEnteros[digito] + 1;
    auxiliar := auxiliar div 10;
  end;
end;

procedure MostrarOcurrencias(var vectorEnteros: vector);
var
  i: integer;
begin
  maxOcurrencias := 0;
  digitoMasRepetido := 0;

  for i := 1 to Max_Digito do
  begin
    if (vectorEnteros[i] <> 0) then
      writeln('El digito ', i, ' se repite ', vectorEnteros[i], ' veces');

    if (vectorEnteros[i] > maxOcurrencias) then
    begin
      maxOcurrencias := vectorEnteros[i];
      digitoMasRepetido := i;
    end;
  end;

  writeln('El digito que más se repite es ', digitoMasRepetido, ' con ', maxOcurrencias, ' repeticiones.');

  write('Los digitos que no se repiten son: ');
  for i := 1 to Max_Digito do
    if (vectorEnteros[i] = 0) then
      write(i);
end;

begin
  for i := 1 to Max_Digito do
    vectorEnteros[i] := 0;

  repeat
    write('Introduce un entero (o -1 para terminar): ');
    readln(auxiliar);
    if (auxiliar <> -1) then
      CantidadOcurrencias(vectorEnteros, abs(auxiliar));
  until (auxiliar = -1);

  MostrarOcurrencias(vectorEnteros);
end.
