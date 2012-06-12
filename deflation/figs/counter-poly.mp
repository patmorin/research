numeric u;

u := 1.3cm;

pair a, b, c, d, e, f, g, h, m, aorig, horig;

alpha := 25;
phi := 20;

a := (0,0.75)*u rotated alpha;
c := (0.75,0)*u rotated alpha;
e := (0,-0.75)*u rotated alpha;
g := (-0.75,0)*u rotated alpha;

b := (0,2)*u rotated (phi+alpha);
d := (2,0)*u rotated (phi+alpha);
f := (0,-2)*u rotated (phi+alpha);
h := (-2,0)*u rotated (phi+alpha);

outputtemplate := "%j.mps";
beginfig(1);
  draw a--b--c--d--e--f--g--h--cycle;

  draw a--c dashed evenly;
  draw c--e dashed evenly;
  draw e--g dashed evenly;
  draw g--a dashed evenly;
  draw c--g dashed evenly;

  label.llft(btex $e$ etex, 3/5[f,g]);
  label.ulft(btex $v$ etex, b);
  label.llft(btex $d$ etex, 2/5[a,c]);
endfig;

vardef get_arc(expr a, b) =
  pair v, w;
  path c[];
  ahlength := 2mm;
  alpha := 60;
  v := (b rotated (90-alpha)) - (a rotated (90-alpha));
  w := (b rotated (90+alpha)) - (a rotated (90+alpha));
  a{v}..{-w}b
enddef;

def draw_arc(expr a, b, r) =
  path p, c[];
  p := get_arc(a,b);
  c1 := fullcircle scaled r shifted a;
  c2 := fullcircle scaled r shifted b;
  drawarrow p cutbefore c1 cutafter c2;
enddef;

def draw_term(expr x, y, rad) =
  draw x--y;
  draw y--(y+unitvector(x-y)*0.5*rad rotated 90);
  draw y--(y+unitvector(x-y)*0.5*rad rotated -90);
enddef;

pair t[], f[];

numeric s;

s := 1;
r := 4pt;

t0 := 1/3 * (a + b + c) scaled s;
t1 := 1/3 * (c + d + e) scaled s;
t2 := 1/3 * (e + f + g) scaled s;
t3 := 1/3 * (g + h + a) scaled s;
t4 := 1/3 * (c + e + g) scaled s;
t5 := 1/3 * (g + a + c) scaled s;

f0 := 1/2[a,b] scaled s;
f1 := 1/2[b,c] scaled s;
f2 := 1/2[c,d] scaled s;
f3 := 1/2[d,e] scaled s;
f4 := 1/2[e,f] scaled s;
f5 := 1/2[f,g] scaled s;
f6 := 1/2[g,h] scaled s;
f7 := 1/2[h,a] scaled s;

f1 := f1 + (f1-t0);
f3 := f3 + (f3-t1);
f5 := f5 + (f5-t2);
f7 := f7 + (f7-t3);

path labarc;
pair labloc;
labarc := get_arc(t0, t5);
labloc := directionpoint (t5-t0) of labarc;

outputtemplate := "%j-ddual-cand.mps";
beginfig(2)
  % draw a--b--c--d--e--f--g--h--cycle;
  % draw a--c--e--g--cycle;
  % draw c--g;
  pickup pencircle scaled r;
  drawdot t0;
  drawdot t1;
  drawdot t2;
  drawdot t3;
  drawdot t4;
  drawdot t5;
  pickup defaultpen;
  draw_arc(t4, t5, r);
  draw_arc(t1, t4, r);
  draw_arc(t2, t4, r);
  draw_arc(t0, t5, r);
  draw_arc(t3, t5, r);

  draw_term(t0, f0, r);
  draw_term(t0, f1, r);
  draw_term(t1, f2, r);
  draw_term(t1, f3, r);
  draw_term(t2, f4, r);
  draw_term(t2, f5, r);
  draw_term(t3, f6, r);
  draw_term(t3, f7, r);

  label.bot(btex $e^D$ etex, f5);
  label.urt(btex $d^D$ etex, labloc);
endfig;

bye;
