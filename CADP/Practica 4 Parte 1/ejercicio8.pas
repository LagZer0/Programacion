{
    Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
    Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido,
    nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:

        a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
        b. Apellido y nombre de los dos alumnos de mayor edad.
}
program ejer8;

const
    MaxAlumnos = 3; // Cambiar a 400 para la versión final

type
    alumno = record
        num_inscripcion : integer;
        dni : integer;
        apellido : string;
        nombre : string;
        anio_nacimiento : integer;
    end;

var
    arregloAlumnos : array[1..MaxAlumnos] of alumno;
    i: integer;

procedure dniPares(arregloAlumnos: array of alumno); 
var
    i, contadorPares, totalAlumnos: integer;
    porcentaje: real;
begin
    contadorPares := 0;
    totalAlumnos := Length(arregloAlumnos); 

    for i := 0 to totalAlumnos - 1 do 
    begin
        if (arregloAlumnos[i].dni mod 2 = 0) then 
        begin
            contadorPares := contadorPares + 1;
        end;
    end;

    porcentaje := (contadorPares / totalAlumnos) * 100;
    writeln('El porcentaje de alumnos con DNI compuesto solo por dígitos pares es: ', porcentaje:0:2, '%');
end;

procedure alumnosMayores(arregloAlumnos: array of alumno); 
var
    i, maxEdad, maxEdad2, anioActual: integer;
    alumno1, alumno2: string;
    
begin
    maxEdad := 0;
    maxEdad2 := 0;
    anioActual:= 2024;

    for i := 0 to Length(arregloAlumnos) - 1 do 
    begin
        if (arregloAlumnos[i].anio_nacimiento < anioActual - 18) then 
        begin
            if anioActual- arregloAlumnos[i].anio_nacimiento > maxEdad then 
            begin
                maxEdad2 := maxEdad;
                
                alumno2 := alumno1;
                
                maxEdad := arregloAlumnos[i].anio_nacimiento;
                alumno1:= arregloAlumnos[i].apellido + ' ' + arregloAlumnos[i].nombre;
            end 
            else if anioActual - arregloAlumnos[i].anio_nacimiento > maxEdad2 then 
            begin
                maxEdad2 := arregloAlumnos[i].anio_nacimiento;
                alumno2 := arregloAlumnos[i].apellido + ' ' + arregloAlumnos[i].nombre;
            end;
        end;
    end;

    writeln('Los dos alumnos de mayor edad son: ', alumno2,', edad: ', maxEdad2, ' y ', alumno1, ', edad: ', maxEdad);
end;

begin
    for i := 1 to MaxAlumnos do 
    begin
        writeln('Ingrese el nro de inscripción del alumno ', i, ': ');
        readln(arregloAlumnos[i].num_inscripcion);
        writeln('Ingrese el DNI del alumno ', i, ': ');
        readln(arregloAlumnos[i].dni);
        writeln('Ingrese el apellido del alumno ', i, ': ');
        readln(arregloAlumnos[i].apellido);
        writeln('Ingrese el nombre del alumno ', i, ': ');
        readln(arregloAlumnos[i].nombre);
        writeln('Ingrese el anio de nacimiento del alumno ', i, ': ');
        readln(arregloAlumnos[i].anio_nacimiento); 
        
    end;

    dniPares(arregloAlumnos);
    alumnosMayores(arregloAlumnos);
end.