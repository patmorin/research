numeric u;
u = 1cm;

numeric alpha, beta, rs;
pair a[], b[], c[], d[], e[];

alpha = -14;
beta = -alpha;
gamma = 25;
rs = 3;

a0 = (0,1)*u rotated alpha;
b0 = a0 rotated 120;
c0 = b0 rotated 120;

a1 = a0*rs rotated beta;
b1 = b0*rs rotated beta;
c1 = c0*rs rotated beta;

d0 = a0 rotated -5;
d1 = a1 rotated -20;
e0 = 0.375[a0,c0] + 0.1*((c0 rotated 90) - (a0 rotated 90));
e1 = a1 rotated -gamma;

outputtemplate := "%j.mps";
beginfig(1)
  draw e1--e0--d1--d0--b1--b0--c1--c0--cycle;
  draw c0--d0 dashed evenly;
  label.lft(btex $f$ etex, 0.5[c0,d0]);
  labeloffset := 0.5mm;
  label.rt(btex $u$ etex, e0);

  % draw b0--3[b1,b0];
  %draw e0--2[d1,e0];
endfig;

bye;
