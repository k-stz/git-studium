

Program CountingChange (input, output);
{ Für die Münzen 1, 2, 5, 10, 20, 50-Cent, gibt an für einen Betrag der zwischen 1 und 99
Cent liegt in wieviele möglichst wenige der obigen Münzen er dargestellt werden
kann. Rückgabe ist eine Reihe aus Zahlen. Die erste Zahl entspricht der 50-cent Münzen die
Nächste der 20-Cent usw. bis zur Letzten, der 1-Cent Münze. Als Beispiel, der Betrag 83
wird als "1 1 1 0 1 1" ausgedrückt d.h. 1*50ct + 1*20ct + 1*10ct + 0*5ct + 1*2ct + 1*1ct =
83ct }

  const
  { die Münzen 50, 20, 10, 5, 2, 1 entsprechen sechs Stück }
  COINS = 6;

  type
  tCoinsIndex =  0 .. COINS;

  var
  i, { index }
  betrag : integer;
  { arrrays }
  { Dieses Array hält die verschiedenen Münzsorten, sodass wir durch sie
    iterieren können und sehen wie oft sie in <betrag> hineinpassen, }
  coinsType : array[tCoinsIndex] of integer;
  { während CoinsUsed das Endergebnis beinhalten wird, d.h., wie oft eine entsprechende
    Münzsorte im Betrag vorgekommen ist}
  coinsUsed : array[tCoinsIndex] of integer;


begin
   { init coins array }
   coinsType[0] := 50;
   coinsType[1] := 20;
   coinsType[2] := 10;
   coinsType[3] := 5;
   coinsType[4] := 2;
   coinsType[5] := 1;

   readln(betrag);

   { the main change calculation algorithm: }
   for i := 0 to COINS - 1 do
   begin
      coinsUsed[i] := betrag div CoinsType[i];
      betrag := betrag - (coinsType[i] * coinsUsed[i]);
   end;


   { the result: }
   writeln(coinsUsed[0], coinsUsed[1], coinsUsed[2], coinsUsed[3], coinsUsed[4], coinsUsed[5]);

end. { CountingChange }
