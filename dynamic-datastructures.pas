{ dynamic datastructres are those who can grow and shrink and run-time
  such as lists. The opposite are static datastructures, like arrays in most
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
  var
     bob,
     mary     : ^tHuman;
     x, 
     y     : ^integer;
begin
   { first you always need to initilize the pointers with new() }
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


end. { DynamicDatastructures }
