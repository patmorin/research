numeric u;

u := 1.25cm;

pair uu, v, w, t[];
numeric el, ed;

el := 0.75*u;
ed := 2*u;
alpha := 20;

uu := (0,0);
v := (ed, 0);
w := (0, el) rotated -alpha + v;
t0 := ((0, el*1.1) rotated 1/2alpha) + v;
t1 := 1/3[uu,v] + (0,0.5el);
t2 := 2/3[uu,v] + (0,-0.5el);
t3 := uu + (3/2*ed, 0);

outputtemplate := "%j.mps";
beginfig(1)
  dotlabel.lft(btex $u$ etex, uu);
  dotlabel.bot(btex $v$ etex, v);
  dotlabel.top(btex $w$ etex, w);
  label.rt(btex $e$ etex, 1/2[v,w]);
  
  draw uu{up}..{dir -45}t1{dir 75}..{dir -100}v--w{right}..{dir 225}t3{dir -45}
    ..{dir 135}t2{dir -135}..{up}cycle;
endfig;

bye;
