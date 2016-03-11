
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
      FindNode := nil;
   end;
end; { FindNode }


procedure InsertNode (var ioTree : tRefTree; inElement : integer);
{ inserts the node, no compound nodes, just the integer element }
  var
     newNode :  tRefTree;
begin
   if (ioTree <> nil) then
   begin
      if (ioTree^.data >= inElement) then
	 InsertNode(ioTree^.left, inElement)
      else
	 InsertNode(ioTree^.right, inElement);
   end
   else
   begin
      new(newNode);
      newNode^.data := inElement;
      newNode^.left := nil;
      newNode^.right := nil;
      ioTree := newNode;
   end;
end; { InsertNode}

function BuildTreeFromInput () : tRefTree;
{ Queries for integer keyboard input and puts them in fresh binary tree.
  This fresh tree now is called in german "natürlicher Suchbaum" for these
  integers. }
  var
     newTree : tRefTree;
     input   :  integer;
begin
   new(newTree);
   newTree := nil; { InsertNode() base-case, the empty binary tree, is a tRefTree pointer,
                     pointing to nil! }
   writeln('Building a tree from input numbers, type 0 to finish.');
   repeat
      write('Next number: ');
      readln(input);
      InsertNode(newTree, input);
   until input = 0;
   
   BuildTreeFromInput := newTree;

end;  { BuildTreeFromInput }

begin
   tree := TestTree();
   PrintNode(tree);
   FindNode(tree, 3);
   PrintNode(FindNode(tree, 44));
   writeln('inserting node 12 test:');
   InsertNode(tree, 12);
   InsertNode(tree, 12);
   PrintNode(tree^.right^.left);
   
   dispose(tree); { free the memory of the object pointed to by the tree pointer}
   tree := BuildTreeFromInput();
   PrintNode(tree);
end. { BinaryTree }
