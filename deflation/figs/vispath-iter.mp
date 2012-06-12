outputtemplate := "%j.mps";

numeric u;

u := 0.75cm;

def circ(expr p, s) =
  fullcircle scaled s shifted p;
enddef;

pair r, l, t[];
numeric d, rad;

rad := 4pt;

d := 1*u;

t1 = (0, 0);
t0 = (0, -d);
r = t0 rotated 120;
l = r rotated 120;

beginfig(1)
  pickup pencircle scaled rad;
  drawdot t0;
  drawdot t1;

  pickup defaultpen;
  draw circ(r, rad);
  draw circ(l, rad);
  draw t0--t1;
  
  draw t1--l cutafter circ(l, rad);
  draw t1--r cutafter circ(r, rad);
  
  label.lrt(btex $x_i$ etex, t1);
  label.bot(btex $x_{i-1}$ etex, t0);
  label.urt(btex $r$ etex, r);
  label.ulft(btex $\ell$ etex, l);
  
endfig;

bye;
