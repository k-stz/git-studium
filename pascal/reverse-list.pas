Program ReverseList;

  type
    tRefList =  ^tList;
    tList    = record
		 data : integer;
		 next : tRefList;
	       end; { tList }
    var
      refList : tRefList;
      lst     : tRefList;


procedure printList (var ioRefList : tRefList);
begin
  writeln(ioRefList^.data);
  if (ioRefList^.next <> nil) then
  begin
    PrintList(ioRefList^.next);
  end;
end; {printList}		   

function reverseList(ioPrev : tRefList; var ioCurr : tRefList) : tRefList;

begin
  if (ioCurr^.next = nil) then
  begin
    ioCurr^.next := ioPrev;
    reverseList := ioCurr;
  end
  else 
  begin
    reverseList := reverseList(ioCurr, ioCurr^.next);
    ioCurr^.next := ioPrev;
  end;
end; { reverseList }

procedure reverseML(var ioRefList : tRefList);
var
  Zeiger    : tRefList;
  AltZeiger : tRefList;
begin
  AltZeiger := nil;
  while(ioRefList^.next <> nil) do
    begin
      Zeiger := ioRefList^.next;
      ioRefList^.next := AltZeiger;
      AltZeiger := ioRefList;
      ioRefList := Zeiger;
    end;
  ioRefList^.next := AltZeiger;
end;

procedure remove(var ioRefList : tRefList; element : integer);
  var prevList : tRefList;
    firstList  : tRefList;
begin
  prevList := nil;
  firstList := ioRefList;
  while (ioRefList^.next <> nil) do
  begin
    if (ioRefList^.data = element) then
    begin
      { if first element is to be removed }
      if (prevList = nil) then
      begin
	{ then make the next list element the first }
	ioRefList := ioRefList^.next;
      end
      else
      begin
	prevList^.next := ioRefList^.next;
	ioRefList := ioRefList^.next;
      end;
    end
    else {element not found?}
    begin
      { move to the next, store the previous }
      prevList := ioRefList;
      ioRefList := ioRefList^.next;
    end;
  end;
  ioRefList := firstList;
end;

begin
  { building example list }
  new(refList);
  refList^.data := 1;
  new(refList^.next);
  refList^.next^.data := 2;
  new(refList^.next^.next);
  refList^.next^.next^.data := 3;
  { printing it }
  { o-o-o-i }
  printList(refList);
  { reverse list }
  writeln('reversed:');
  lst := reverseList(nil, refList);
  { print the reveresed list }
  printList(lst);
  { reverse with ML procedure }
  writeln('reversed again:');
  reverseML(lst);
  printList(lst);
  writeln('removing 2 from the list:');
  remove(lst, 2);
  printList(lst);

end.
