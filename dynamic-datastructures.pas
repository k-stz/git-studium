{ dynamic data structure are those who can grow and shrink and run-time
  such as lists. The opposite are static data structures, like arrays in most
  languages.
  The dynamic property can be realised with points, by having them point to objects
  which in turn also contain pointers that could point to others (think closure
  property like with CONS cells. }

{ pointers, you know who you are.
  dereferencing a pointer, means accessing the object it points to, otherwise
  a pointer just returns the address of said object. _We dereference pointer 
  variables!_ }


program DynamicDatastructures (input, output);

{ defining a pointer type: }
  type
     tHuman   = record
		   age	: integer;
		   name	: string;
		end;	
     tRefHuman =  ^tHuman;
     { for implementation of linear lists }
     tRefList = ^tList; {<- compiler without error if tListe = ... is added below}
     tList = record
		car : integer;
		cdr : tRefList
	     end;

  var
     bob,
     mary : ^tHuman;
     x,
     y : ^integer;
     list,
     emptyList :^tList;
     refList : tRefList;

function IntCons (inCar : integer; inCdr : tList) : tList;
{ Can be used to build a linear list inside out with nested IntCons(<int>, IntCons(..., <tList>))   }
  var
     newCons : ^tList;
begin
   writeln('IntCons called with car: ', inCar);
 
   { first we create a fresh 'cons cell' }
   new(newCons);
   { immediately we create a fresh pointer in its nested cdr }
   new(newCons^.cdr);
   { store in its car the formal inCar }
   newCons^.car := inCar;
   { and now that we have initialized it, this will work: }
   newCons^.cdr^ := inCdr;
  
   IntCons := newCons^;
end; { IntCons }

{ The main difference between ^tList and tRefList seems to be that that only the
  latter can be used as a type in for formal parameters, while the former is just
  syntax to take get at the reference of an object }
procedure BuildList (var outAnchor : tRefList); 
{ procedure defined by the script, using a more efficient and elegant way
  of creating a linked list }

  var
     cons : ^tList;
     number : integer;

begin
   outAnchor := nil;
   { important usecase of readln(), not introcduced yet, passing it a variable will
   assign the input to it: }
   readln(number);
   while number <> 0 do
   begin
      new(cons); {allocate fresh memory for a tList, 'cons', datastructure}
      cons^.car := number; { fill the CAR with data}
      {this is the crucial part, on the first run through the loop this will let
       the freshly allocated pointer, 'cons', point to the nullpointer outAnchor,
       on every subsequent call it will point to the previously allocated 'cons'.
       again: The previously allocated cons will point to the init nullpointer or 
       to another previously allocated cons}
      cons^.cdr := outAnchor; 
      outAnchor := cons; { now this may seem confusing at first, aren't we creating
			 circular list here? cons.cdr->outAnchor->cons ?}
      readln(number);
   end; {while-loop}
end; { BuildList }

begin
   { first you always need to initialize the pointers with new() }
   new(x);
   new(y);
   writeln('init x^ value: ', x^);
   writeln('y^ := 2; and ', 'x := y'); 
   y^ := 2; { only after }
   x := y;  { both point to the same value}
   writeln('x^: ',x^, ' y^: ',y^);
   y^ := 33; { now that both point to the same object, changing it 
               will change it for both of them, since it is the same}
   writeln('y^ := 33 ', 'x^: ', x^);
   writeln('finally we can delete the objects pointed to with dispose(x);');
   writeln('dispose(y); writeln(x^);');
   dispose(y);
   writeln(x^);	{ again we see how pointers behave, the value after in
		note how it isn't the same value now as with 'init x^ value: ' }
   
   writeln('y := nil; x = y');
   y := nil;	{ note that after dispose(ptr) they don't become nil pointers..}
   writeln(x = y); { hence this is false! }

   { Linear list test: } 
   writeln('Linear list test:');
   new(list);
   list^.car := 11;
   writeln(list^.car);
   list^.cdr := list; { circular list }
   writeln(list^.cdr^.cdr^.car); { <- here we can indefinitely add .cdr^, walking through the
                                      same object every time}
   { But how do we actually extend the list at runtime?
   Lets use a procedure that does that for us }
   { we need the concept of nil, the empty list, the terminating element. For lack of a better
   way for now we will use the proxy variable emptyList: }
   new(emptyList);
   { the point of using emptyList is, that calling IntCons(33, nil) doesn't work!  nil
   is not accepted by the function definition because nil is not of type tList}
   { Update: the script itself also uses an init pointer, calling it the "anchor" of the
   list and being of type tList and assigning it the value nil, that's what I was supposed to
   do: emptyList := nil; }
   list^ := IntCons(555, IntCons(33, emptyList^));
   writeln('We construct a linear list:');
   writeln('list^ := IntCons(555, IntCons(33, emptyList^)');
   writeln('contents of our newly build list:');
   writeln('(car list): ', list^.car);
   writeln('(cdr (car list)): ', list^.cdr^.car);

   writeln('building a list from input, type in at least two numbers, ',
	   'terminate with 0 :');

   BuildList(refList);
   writeln(refList^.car);
   writeln(refList^.cdr^.car);
end. { DynamicDatastructures }
