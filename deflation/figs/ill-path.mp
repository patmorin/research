numeric u;

u := 2.2cm;

def draw_arc(expr a, b, r) =
  pair v, w;
  path p, cl[];
  ahlength := 2mm;
  alpha := 60;
  v := (b rotated (90-alpha)) - (a rotated (90-alpha));
  w := (b rotated (90+alpha)) - (a rotated (90+alpha));
  p := a{v}..{-w}b;
  cl1 := fullcircle scaled r shifted a;
  cl2 := fullcircle scaled r shifted b;
  drawarrow p cutbefore cl1 cutafter cl2;
enddef;

def circ(expr p, s) =
  fullcircle scaled s shifted p;
enddef;

pair t[], r[], q[];
path c[], l[];
numeric alpha, s, d;

alpha := 240;
s := 1.65;
d := 4pt;

t0 := (0,-0.5)*u rotated -(alpha/2);
t1 := t0 rotated (alpha/4);
t2 := t1 rotated (alpha/4);
t3 := t2 rotated (alpha/4);
t4 := t3 rotated (alpha/4);

r1 := t1 scaled s;
r2 := t2 scaled s;
r3 := t3 scaled s;

l1 := t1--r1;
l2 := t2--r2;
l3 := t3--r3;

c1 := circ(r1, d);
c2 := circ(r2, d);
c3 := circ(r3, d);

q1 := l1 intersectionpoint c1;
q2 := l2 intersectionpoint c2;
q3 := l3 intersectionpoint c3;

outputtemplate := "%j.mps";
beginfig(1)
  pickup pencircle scaled d;
  drawdot t0;
  drawdot t1;
  drawdot t2;
  drawdot t3;
  drawdot t4;
  
  pickup defaultpen;
  
  draw_arc(t1,t0,d);
  draw t1--1/3[t1,t2];
  draw 1/3[t1,t2]--t2 dashed withdots scaled 0.5;
  draw t2--1/3[t2,t3] dashed withdots scaled 0.5;
  draw 1/3[t2,t3]--t3;
  draw_arc(t4,t3,d);
  
  draw c1;
  draw c2;
  draw c3;
  
  draw t1--q1;
  draw t2--q2;
  draw t3--q3;

  label.top(btex $x_n$ etex, t0);
  label.urt(btex $x_{n-1}$ etex, t1);
  label.top(btex $x_i$ etex, t2);
  label.ulft(btex $x_2$ etex, t3);
  label.top(btex $x_1$ etex, t4);
endfig;

numeric alpha, beta, gamma, l[];
pair t[], w[];

alpha := -70;
beta := 10;
gamma := 55;

l0 := 0.8;
l2 := 0.6;
l4 := 1;

t0 := (l0,0)*u rotated alpha;
t1 := t0 reflectedabout((0,0), (0,1)) rotated -5;
t2 := (l2,0)*u rotated beta;
t3 := t2 reflectedabout((0,0), (0,1));
t4 := (l4*0.8, 0)*u rotated (gamma-10);
t5 := (l4, 0)*u rotated (180-gamma);

outputtemplate := "%j-poly.mps";
beginfig(2)
  pickup defaultpen;
  draw (0,0)--t5--t2;
  pickup pencircle scaled 2pt;
  unfilldraw (0,0)--t3--t4--cycle;
  pickup defaultpen;
  draw (0,0)--t2;
  draw (0,0)--t3--t4--cycle;
  
  draw t0--1/3[t0,(0,0)] dashed withdots scaled 0.5;
  draw 1/3[t0,(0,0)]--(0,0);
  draw (0,0)--2/3[(0,0),t1] dashed withdots scaled 0.5;
  draw 2/3[(0,0),t1]--t1;
  draw t0--t2;
  draw t1--t3;

  w1 := 1/3(t5 + (((0,0)--t5) intersectionpoint (t3--t4)) +
      ((t2--t5) intersectionpoint (t3--t4)));
  w2 := 1/3((0,0) + t2 + t0);
  w3 := 1/3((0,0) + t0 + t1);
  w4 := 1/3((0,0) + t1 + t3);
  w5 := 1/3((0,0) + t3 + t4);
  
  label(btex $x_1$ etex, w1);
  label(btex $x_2$ etex, w2);
  label(btex $x_i$ etex, w3);
  label(btex $x_{n-1}$ etex, w4);
  label(btex $x_n$ etex, w5);
endfig;

bye;
