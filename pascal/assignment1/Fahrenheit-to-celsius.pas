{ C = [5 * (F - 32)] / 9 }

Program FahrenheitToCelsius (input, output);
{ Übersetzt Fahrenheit in Celsius. }

  var
  Fahrenheit	: integer;
  Celsius	:  real;

begin
   writeln('Bitte geben Sie eine Temperatur in Fahrenheit an. ');
   readln(Fahrenheit);
   writeln('Diese Temperatur enspricht in Celsius: ');
   Celsius := (5 * (Fahrenheit - 32)) / 9;
   writeln(Celsius);

end. { FahrenheitToCelsius }
