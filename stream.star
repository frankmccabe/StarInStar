stream is package{
  private import operators

  type streem of t is alias of ((operators)=>t);

  type streemList of t is endStreem or streem(streem of ((t,streemList of t)));

  force(endStreem,_) do nothing
  force(streem(M),Ops) do{
    var (_,S) is M(Ops);
    force(S,Ops);
  }
}