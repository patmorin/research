outputtemplate := "%j.mps";

numeric u;

u := 0.7cm;

pair v, uu, p[];

v := (0,0)*u;
p0 := v - (2,0)*u;
uu := v + (0.3,2.5)*u;
p1 := v + (0.3,-2.5)*u;

p2 := 3/5[v,p0] + (0,0.5)*u;
p3 := 3/5[v,p0] - (0,0.5)*u;

outputtemplate := "%j.mps";
beginfig(1)
  draw v--p0--p1--cycle;
  draw p0--uu--v;

  label(btex $a$ etex, 1/3(0.85v + 0.85p0 + 1.3p1));
  label(btex $b$ etex, 1/3(0.85v + 1.3uu + 0.85p0));
  label.ulft(btex $f$ etex, 1/2[p0, uu]);
  label.rt(btex $v$ etex, v);
  label.bot(btex $u$ etex, p1);
  label.bot(btex $e$ etex, 1/3[v,p0]);
  
  drawarrow p3--p2;
  pickup pencircle scaled 3pt;

  drawdot p3;
  
endfig;

bye;
