
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


procedure PrintNode (inNode : tRefTree);
{ Print the node and its children. }
begin
  if (inNode = nil) then
     writeln('Node is empty')
  else
  begin
     writeln('Node data: ', inNode^.data);
     if (inNode^.left <> nil) then
	writeln('     left: ', inNode^.left^.data)
     else
	writeln('     left: NIL');
     write('    right: ');
     if (inNode^.right <> nil) then
	writeln(inNode^.right^.data)
     else
	writeln('NIL');
  end;
end;  { PrintNode }


function FindNode (inTree : tRefTree; inElement : integer) : tRefTree;
{ Find the Node in the inTree holding the element and return the pointer
to it. }
begin
   if (inTree <> nil) then
   begin
      { match? }
      if (inTree^.data = inElement) then
      begin
	 writeln('Element ', inElement, ' found');
	 FindNode := inTree;
      end
      else 
      { recursing down the inTree }
      begin
	 { move down the inTree based on the current node inElement being
	  bigger or smaller than the one we're looking for }
	 if (inTree^.data >= inElement) then
	    FindNode := FindNode(inTree^.left, inElement)
         else
	    FindNode := FindNode(inTree^.right, inElement);
      end;
   end
   else	{ null pointer}
   begin
      writeln('Element ', inElement, ' NOT found');
      new(FindNode);
      FindNode := nil;
   end;

end; { FindNode }

begin
   tree := TestTree();
   PrintNode(tree);
   writeln(tree^.right^.data, '-----------');
    { TODO if this is missing then}
   {  the PrintNode.. below gets a memory access error.. }
   FindNode(tree, 3);
   PrintNode(FindNode(tree, 44));
end. { BinaryTree }
