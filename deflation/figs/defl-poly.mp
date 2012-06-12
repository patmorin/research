numeric u;
u := 2cm;

def nx(expr a, b, s, alpha) =
  (b + s*((b-a) rotated alpha))
enddef;

pair t[];
numeric n;

t0 := (0, 0);
t6 := (-1, 1/8)*u;
t4 := (-1/2, 1/2)*u;
t5 := nx(t0, t6, 3/5, 20);
t7 := nx(t4, t0, 4/5, 15);
t2 := nx(t6, t4, 2/3, 20);
t1 := nx(t4, t2, 3/2, 20);
t3 := nx(t0, t2, 1/3, -20);
n := 8;

outputtemplate := "%j-ind-path.mps";
beginfig(1)
  draw t0--t1--t2--t3--t4--t5--t6--t7--cycle;
  draw t0--t2;
  draw t0--t4;
  draw t0--t6;
  draw t2--t4;
  draw t4--t6;
  
  draw t5--(2/5[t0,t1]) dashed evenly;
  dotlabel("",2/5[t0,t1]);
  
  label.bot(btex $v$ etex, t6);
  
  k := labeloffset;
  labeloffset := 1/2mm;
  label.lft(btex $u$ etex, t5);
  label.llft(btex $f$ etex, 3/5[t0, t4]);

  % label.lrt(btex $e$ etex, 1/2[t4, t6]);
  % label.lft(btex $g$ etex, 1/2[t0, t2]);
  % label.rt(btex $h$ etex, 1/2[t0, t1]);
  label.lrt(btex $e$ etex, 3/5[t4, t6]);
  label.lft(btex $g$ etex, 2/5[t0, t2]);
  label.rt(btex $h$ etex, 1/4[t0, t1]);
  labeloffset := k;
endfig;

def draw_arc(expr a, b, r) =
  pair v, w;
  path p, c[];
  ahlength := 2mm;
  alpha := 60;
  v := (b rotated (90-alpha)) - (a rotated (90-alpha));
  w := (b rotated (90+alpha)) - (a rotated (90+alpha));
  p := a{v}..{-w}b;
  c1 := fullcircle scaled r shifted a;
  c2 := fullcircle scaled r shifted b;
  drawarrow p cutbefore c1 cutafter c2;
enddef;

def draw_term(expr a, b, r) =
  draw a--b;
  draw b--(b+unitvector(a-b)*0.5*r rotated 90);
  draw b--(b+unitvector(a-b)*0.5*r rotated -90);
enddef;

numeric d;
pair s[], f[];

d := 4pt;
sr := 1;

s0 := 1/3(t0 + t4 + t6) scaled sr;
s1 := 1/3(t4 + t5 + t6) scaled sr;
s2 := 1/3(t0 + t6 + t7) scaled sr;
s3 := 1/3(t0 + t2 + t4) scaled sr;
s4 := 1/3(t0 + t1 + t2) scaled sr;
s5 := 1/3(t2 + t3 + t4) scaled sr;

for i=0 upto n-1:
  f[i] := 1/2[t[i],t[(i+1) mod n]] scaled sr;
endfor;


f0 := f0 + (1,0)*0.1*u;
f3 := f3 + (-1,0)*0.05*u;
f4 := f4 + (0,1)*0.1*u;
f6 := f6 + (-1,-1)*0.05*u;
  
outputtemplate := "%j-ddual-vp.mps";
beginfig(1)
  pickup pencircle scaled d;
  for i=0 upto n-3:
    drawdot s[i];
  endfor;
  
  pickup defaultpen;
  draw_arc(s1, s0, d);
  draw_arc(s2, s0, d);
  draw_arc(s3, s0, d);
  draw_arc(s4, s3, d);
  draw_arc(s3, s5, d);

  draw_term(s4, f0, d);
  draw_term(s4, f1, d);
  draw_term(s5, f2, d);
  draw_term(s5, f3, d);
  draw_term(s1, f4, d);
  draw_term(s1, f5, d);
  draw_term(s2, f6, d);
  draw_term(s2, f7, d);

  label.lrt(btex $a$ etex, s1);
  label.llft(btex $b$ etex, s0);
  label.lrt(btex $c$ etex, s3);
  label.urt(btex $d$ etex, s4);
  label.rt(btex $h^T$ etex, f0);
  
endfig;

bye;
