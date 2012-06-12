numeric u;

u := 2cm;

pair s[];
numeric n;

vardef dist(expr a, b) =
  sqrt((xpart (b-a))**2 + (ypart (b-a))**2)
enddef;

s0 := (0,0);
s1 := (1,0)*u rotated -20;
s2 := 1/2s1 rotated 5;
s3 := (xpart s2, 3/2u);
s4 := (s3 + (0,-1)*2/5*dist(s2,s3)) rotated 3;
s5 := s4 reflectedabout(s0, s0+(0,2)*u);
s6 := s3 reflectedabout(s0, s0+(0,2)*u);
s7 := s2 reflectedabout(s0, s0+(0,2)*u);
s8 := s1 reflectedabout(s0, s0+(0,2)*u);

outputtemplate := "%j.mps";
beginfig(1);
  draw s0--s1--s2--s3--s4--s5--s6--s7--s8--cycle;
endfig;

bye;
