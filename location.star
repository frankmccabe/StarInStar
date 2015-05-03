location is package{
  type srcLoc is someWhere{
    lineCount has type integer;
    lineOffset has type integer;
    charCount has type integer;
    length has type integer;
  } or missing;

  implementation pPrint over srcLoc is {
    ppDisp=showLoc;
  } using {
    showLoc(someWhere{
      lineCount=Line;
      lineOffset=Off;
      length=Ln}) is 
    ppSequence(0,cons of [
	   ppStr(Line as string), ppStr("["), ppStr(Off as string), ppStr(":"), ppStr(Ln as string), ppStr("]")]);
    showLoc(missing) is ppStr("no where");
  };

  mergeLocation(someWhere{lineCount=Lc1;lineOffset=LO1;charCount=CC1;length=LN1},
	someWhere{charCount=CC2;length=LN2}) is
      someWhere{lineCount=Lc1;lineOffset=LO1;charCount=CC1;length=CC2+LN2-CC1};
}