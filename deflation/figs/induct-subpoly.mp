def angle(expr A,O,B,d) =
  (O + d*unitvector(A-O))
    { d*unitvector(A-O) rotated 90 }
    ..
    {d * unitvector(B-O) rotated 90 }
    (O + d*unitvector(B-O))
enddef;

numeric u;

u := 0.75cm;

pair uu, v, p[];

uu := (0,0)*u;
p0 := uu - (2,0)*u;
v := uu + (0.3,2.5)*u;
p1 := uu + (0.3,-2.5)*u;
p3 := p1 rotated 120;

p4 := p3 rotated -20;
p5 := p4 rotated -20;
p6 := p1 rotated 20;

p7 := 1.3[uu,p5];
p8 := uu + (-3,-2)*u;

outputtemplate := "%j.mps";
beginfig(1)
  draw uu--p0--p1--cycle;
  draw p0--v--uu dashed withdots scaled 0.5;
  draw uu--p3;
  draw uu--0.75[uu,p4];
  draw uu--0.75[uu,p5];
  draw uu--0.75[uu,p6];
  draw 0.75[uu,p4]--p4 dashed evenly;
  draw 0.75[uu,p5]--p5 dashed evenly;
  draw 0.75[uu,p6]--p6 dashed evenly;

  draw p0..{dir 0}p8{dir -80}..{dir 50}p1{dir -30}..{dir 100}p7{dir 20}..{dir 180}p3;

  label(btex $y_1$ etex, 1/3(uu + p3 + p4));
  label(btex $y_2$ etex, 1/3(uu + p4 + p5));
  draw thelabel(btex $\ddots$ etex, (0,0)) rotated 90
    shifted 1/3(uu + p5 + p6);
  label(btex $y_n$ etex, 1/3(uu + p6 + p1));
  label(btex $a$ etex, 1/3(uu + p0 + p1));
  label(btex $b$ etex, 1/3(uu + v + p0));

  label.ulft(btex $\beta$ etex, uu);
  label.llft(btex $\alpha$ etex, uu);

  labeloffset := 2.5mm;
  label.lrt(btex $\gamma$ etex, uu);
  draw angle(p1, uu, p3, 2.25mm);
endfig;

bye;
