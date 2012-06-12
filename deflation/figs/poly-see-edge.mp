numeric u, d;

u := 1.3cm;
d := 2pt;

numeric el, ed;
pair uu, w, v, r[];

el := 0.75*u;
ed := 3*u;

uu := (0,0);
w := (ed, -1/2*el);
v := (ed, 1/2*el);

for i=1 upto 3:
  r[i] := (i/4)[uu,1/2[v,w]];
endfor;

outputtemplate := "%j.mps";
beginfig(1)
  draw uu{dir 90}..{dir -90}r1{dir 90}..{dir -90}r3{dir 90}..{dir -90}v--
    w{dir -90}..{dir 90}r2{dir -90}..cycle;

  draw uu--(1/2[v,w]) dashed evenly;

  dotlabel.lft(btex $u$ etex, uu);
  dotlabel.rt(btex $v$ etex, v);
  dotlabel.rt(btex $w$ etex, w);
  dotlabel.bot(btex $x$ etex, r3);
  label.top(btex $\ell$ etex, 5/12[uu, 1/2[v,w]]);
  label.rt(btex $e$ etex, 1/2[v,w]);
  
  % pickup pencircle scaled d;
  % drawdot uu;
  % drawdot w;
  % drawdot v;
  % for i=1 upto 3:
  %   drawdot r[i];
  % endfor
  % pickup defaultpen;
endfig;

bye;
