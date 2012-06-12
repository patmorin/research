numeric u;

u := 2cm;

pair s[];
numeric n;

s0 := (0,0);
s1 := s0 + (0,-1)*u rotated -45;
s2 := (1/2)*s1 rotated 20;
s3 := 4/3*s1;
s4 := s3 reflectedabout(s0, s0+(0,1));
s5 := s2 reflectedabout(s0, s0+(0,1));
s6 := s1 reflectedabout(s0, s0+(0,1));
n := 7;

% outputtemplate := "%j.mps";
% beginfig(1);
%   draw s0--s1--s2--s3--s4--s5--s6--cycle;
% endfig;

outputtemplate := "%j-tri.mps";
beginfig(1);
  draw s0--s1--s2--s3--s4--s5--s6--cycle;

  draw s0--s2;
  draw s0--s5;
  draw s2--s5;
  draw s5--s3;

  label.urt(btex $e$ etex, 1/2[s6,s0]);
  label.lrt(btex $v$ etex, s4);
  label.lrt(btex $d$ etex, 3/5[s3,s5]);
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

s := 1.2;
r := 4pt;

t0 := 1/3 * (s0 + s1 + s2) scaled s;
t1 := 1/3 * (s0 + s2 + s5) scaled s;
t2 := 1/3 * (s0 + s5 + s6) scaled s;
t3 := 1/3 * (0.9s2 + 0.9s3 + 1.2s5) scaled s;
t4 := 1/3 * (s3 + s4 + s5) scaled s;

for i=0 upto n-1:
  f[i] := 1/2[s[i],s[(i+1) mod n]] scaled s;
endfor;

path labarc;
pair labloc;
labarc := get_arc(t3, t4);
labloc := directionpoint (t4-t3) of labarc;

outputtemplate := "%j-ddual-cand.mps";
beginfig(2)
  pickup pencircle scaled r;
  for i=0 upto n-3:
    drawdot t[i];
  endfor;
  
  pickup defaultpen;
  draw_arc(t0, t1, r);
  draw_arc(t1, t2, r);
  draw_arc(t1, t3, r);
  draw_arc(t3, t4, r);
  
  draw_term(t0, f0, r);
  draw_term(t0, f1, r);
  draw_term(t3, f2, r);
  draw_term(t4, f3, r);
  draw_term(t4, f4, r);
  draw_term(t2, f5, r);
  draw_term(t2, f6, r);

  labeloffset := 0.5mm;
  label.urt(btex $e^D$ etex, f6);
  label.urt(btex $d^D$ etex, labloc);
endfig;

bye;
