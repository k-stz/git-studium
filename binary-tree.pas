
{ Shows an implementation and operations on the binary tree dynamic
  data structure. }
program BinaryTree (input, output);

  type
     tRefTree = ^tTree;
     tTree =  record
		 data  : integer;
		 left  : tRefTree;
		 right : tRefTree
	      end;

  var
     tree :  tRefTree;

function MakeNode (data	: integer; left : tRefTree; right : tRefTree) : tRefTree;
{ Make a tTree node containing <data> and return the pointer to it }
   var
      node : tRefTree;
begin
   { init }
   new(node);
   { fill with data }
   node^.data := data;
   node^.left := left;
   node^.right := right;
   MakeNode := node;
end; { Make Node }

function TestTree () : tRefTree;
{ build and returns a fixed tTree for testing, of the form:
        3
      /  \
     0    44
         /  \
        10   99 }
begin
   TestTree := MakeNode(3, 
			MakeNode(0, nil, nil),
			MakeNode(44, 
			         MakeNode(10, nil, nil),
                                 MakeNode(99, nil, nil)));
end; { TestTree }


{ NEXT-TODO: implement this }
function FindNode (tree	: tRefTree; element : integer) : tRefTree;

begin
   if (tree <> nil) then
   begin
      { match? }
      if (tree^.data = element) then
      begin
	 writeln('Element ', element, ' found');
	 FindNode := tree;
      end
      else 
      { recursing down the tree }
      begin
	 { move down the tree based on the current node element being
	  bigger or smaller than the one we're looking for }
	 if (tree^.data >= element) then
	    FindNode(tree^.left, element)
         else
	    FindNode(tree^.right, element);
      end;
   end
   else	{ null pointer}
   begin
      writeln('Element ', element, ' NOT found');
      FindNode := nil;
   end;

end;

begin
   tree := TestTree();
   writeln(tree^.right^.data);
   FindNode(tree, 3);
   FindNode(tree, 45);
end. { BinaryTree }
