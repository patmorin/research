numeric u;

u := 1cm;

pair t[];

t0 := (0, 0);
t1 := (-0.75, 0.75)*u;
t2 := t1 + (-0.75, -1.75)*u;
t3 := t1 rotated 55 scaled 0.75;
t4 := (0.75, -1.5)*u;
t5 := (1, -0.3)*u;
t6 := (2.25,1)*u;

outputtemplate := "%j.mps";
beginfig(1)
  draw t0--t1--t2--t3--t4--t5--t6--cycle;
endfig;

outputtemplate := "%j-vg.mps";
beginfig(2)
  draw t0--t1--t2--t3--t4--t5--t6--cycle;
  
  draw t0--t3;
  draw t0--t4;
  draw t0--t5;
  draw t1--t3;
  draw t1--t4;
  draw t3--t5;
endfig;

outputtemplate := "%j-tri.mps";
beginfig(3)
  draw t0--t1--t2--t3--t4--t5--t6--cycle;
  draw t0--t3;
  draw t0--t5;
  draw t1--t3;
  draw t3--t5;
endfig;

numeric d;
pair s[], f[];

d := 4pt;
sr := 1;

s0 := 1/3(t0 + t3 + t5) scaled sr;
s1 := 1/3(t0 + t1 + t3) scaled sr;
s2 := 1/3(t1 + t2 + t3) scaled sr;
s3 := 1/3(t3 + t4 + t5) scaled sr;
s4 := 1/3(t5 + t6 + t0) scaled sr;

f0 := 1/2[t0, t1] scaled sr;
f1 := 1/2[t1, t2] scaled sr;
f2 := 1/2[t2, t3] scaled sr;
f3 := 1/2[t3, t4] scaled sr;
f4 := 1/2[t4, t5] scaled sr;
f5 := 1/2[t5, t6] scaled sr;
f6 := 1/2[t6, t0] scaled sr;

f1 := f1 + (-1,0)*0.1*u;

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

outputtemplate := "%j-dual.mps";
beginfig(4)
  pickup pencircle scaled d;
  drawdot(s0);
  drawdot(s1);
  drawdot(s2);
  drawdot(s3);
  drawdot(s4);
  
  pickup defaultpen;
  draw_term(s1, f0, d);
  draw_term(s2, f1, d);
  draw_term(s2, f2, d);
  draw_term(s3, f3, d);
  draw_term(s3, f4, d);
  draw_term(s4, f5, d);
  draw_term(s4, f6, d);
  
  draw s0--s1;
  draw s0--s3;
  draw s4--s0;
  draw s2--s1;
endfig;

outputtemplate := "%j-dirdual.mps";
beginfig(5)
  pickup pencircle scaled d;
  drawdot(s0);
  drawdot(s1);
  drawdot(s2);
  drawdot(s3);
  drawdot(s4);
  
  pickup defaultpen;
  draw_term(s1, f0, d);
  draw_term(s2, f1, d);
  draw_term(s2, f2, d);
  draw_term(s3, f3, d);
  draw_term(s3, f4, d);
  draw_term(s4, f5, d);
  draw_term(s4, f6, d);
  
  draw_arc(s0, s1, d);
  draw s0--s3;
  draw_arc(s4, s0, d);
  draw_arc(s2, s1, d);
endfig;

labeloffset := 1.3mm;

outputtemplate := "%j-labdual.mps";
beginfig(6)
  pickup pencircle scaled d;
  drawdot(s0);
  drawdot(s1);
  drawdot(s2);
  drawdot(s3);
  drawdot(s4);
  
  pickup defaultpen;
  draw_term(s1, f0, d);
  draw_term(s2, f1, d);
  draw_term(s2, f2, d);
  draw_term(s3, f3, d);
  draw_term(s3, f4, d);
  draw_term(s4, f5, d);
  draw_term(s4, f6, d);
  
  draw s0--s1;
  draw s0--s3;
  draw s4--s0;
  draw s2--s1;

  label.top(btex $n_1$ etex, s0);
  label.ulft(btex $n_2$ etex, s1);
  label.lrt(btex $n_3$ etex, s2);
  label.bot(btex $n_4$ etex, s3);
  label.bot(btex $n_5$ etex, s4);
  label.urt(btex $t_1$ etex, f0);
  label.lft(btex $t_2$ etex, f1);
  label.bot(btex $t_3$ etex, f2);
  label.lft(btex $t_4$ etex, f3);
  label.rt(btex $t_5$ etex, f4);
  label.rt(btex $t_6$ etex, f5);
  label.top(btex $t_7$ etex, f6);
endfig;

bye;
