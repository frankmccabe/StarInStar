fsa is package{
  private import multiTree

  /*
   * Finite state automaton. Closely allied to regular expressions of course.
   * Combinator style
   */
  
  type fsa of (alpha,final) is 
      emptyFSA
      or oneChar(alpha)
      or orS(fsa of (alpha,final),fsa of (alpha,final))
      or catS(fsa of (alpha,final),fsa of (alpha,final))
      or starFSA(fsa of (alpha,final))
      or plusFSA(fsa of (alpha,final))
      or optFSA(fsa of (alpha,final))
      or charSet(list of alpha)
      or nonCharSet(list of alpha)
      or anyChar
      or bindVar(fsa of (alpha,final),(list of alpha,final)=>final)
      or endFSA(fsa of (alpha,final), state of final)
  
  type state of alpha is
      state(string)
      or final(alpha)
      or switch(string,integer)
  
  -- Some standard combinators
  
  fun oneSym(S) is let{
    fun stateTrans([A,..R],SoFar,St) where S(A) is list of [(list of [SoFar..,A],R),..St]
     |  stateTrans(_,_,St) default is St
  } in stateTrans
  
  fun emptyFSA() is let{
    trans(R,SoFar,St) is list of [(SoFar,R),..St]
  } in trans
  
  fun bind(F) is let{
    trans(S,SoFar,State) is F(S,list of [],list of [])++State
  } in trans
}	
