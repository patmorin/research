numeric u, w;

w := 24mm;

string f;

f := "otypes06.txt";

vardef perm(suffix c) =
  save has, unq, i, j;
  numeric i, j;
  boolean dist;
  dist := true;
  for i:=0 upto 4:
    for j:=i+1 upto 5:
      if c[i] = c[j]:
      	dist := false;
      fi;
    endfor;
  endfor;
  dist
enddef;

vardef gord(suffix c) =
  save i, res, sawone;
  numeric i;
  boolean res, sawone;
  res := true;
  sawone := false;
  for i:=0 upto 5:
    if c[i] = 1:
      sawone := true;
    fi;
    if ((c[i] = 2) and (not sawone)):
      res := false;
    fi;
  endfor;
  res
enddef;

vardef ints(expr a, b) =
  save intr;
  boolean intr;
  intr := true;
  if a intersectiontimes b = (-1,-1):
    intr := false;
  fi;
  intr
enddef;

vardef simp(suffix e) =
  save i, j, smp;
  numeric i, j;
  boolean smp;
  smp := true;
  for i:=0 upto 3:
    for j:=i+2 upto 5:
      if (not ((i=0) and (j=5))) and ints(e[i], e[j]):
  	smp := false;
      fi;
    endfor;
  endfor;
  smp
enddef;

vardef visib(expr i, j)(suffix e, v, c) =
  save res;
  boolean res, k;
  numeric k;
  res := true;
  for k:=0 upto 5:
    if ((i <> k) and (i <> ((k+1) mod 6))
  	and (j <> k) and (j <> ((k+1) mod 6))
  	  and (((v[c[i]]--v[c[j]]) intersectiontimes e[k]) <> (-1,-1))):
  	res := false;
    fi;
  endfor;
  res
enddef;

vardef wnum(expr pt)(suffix v, c) =
  save res, i;
  res := 0;
  for i:=0 upto 5:
    res := res + angle((v[c[(i+1)mod6]]-pt) rotated (-angle(v[c[i]]-pt)));
  endfor;
  round(res)
enddef;

vardef inside(expr pt)(suffix v, c) =
  (wnum(pt,v,c)<>0)
enddef;

vardef cross(suffix v, d)(expr n) =
  save res, i, j;
  boolean res;
  res := false;
  for i:=0 upto n-1:
    for j:=0 upto n-1:
      if (xpart d[i] <> xpart d[j]) and (xpart d[i] <> ypart d[j])
   	and (ypart d[i] <> xpart d[j]) and (ypart d[i] <> ypart d[j])
	  and (((v[xpart d[i]]--v[ypart d[i]]) intersectiontimes
	      (v[xpart d[j]]--v[ypart d[j]])) <> (-1,-1)):
	 res := true;
     fi;
    endfor;
  endfor;
  res
enddef;

vardef ordcode(suffix c) =
  save i;
  for i:=0 upto 5: decimal c[i] & endfor ""
enddef;

vardef tnangle(expr a, b, c) =
  angle((c-b) rotated (180-angle(a-b)))
enddef;

vardef tnum(suffix v, c) =
  save res, i;
  res := 0;
  for i:=0 upto 5:
    res := res + tnangle(v[c[(i-1)mod6]], v[c[i]], v[c[(i+1)mod6]]);
  endfor;
  round(res/360)
enddef;

vardef tnapos(suffix v, c) =
  save res, i;
  res := 0;
  for i:=0 upto 5:
    if tnangle(v[c[(i-1)mod6]], v[c[i]], v[c[(i+1)mod6]]) > 0:
      res := res + 1;
    fi;
  endfor;
  res
enddef;

vardef numrflx(suffix v, c) =
  save res;
  if tnum(v, c) > 0:
    res := 6 - tnapos(v, c);
  else:
    res := tnapos(v,c);
  fi;
  res
enddef;

color pink, lightblue;
pink := (255, 192, 203)/255;
lightblue := (173, 216, 230)/255;

def prfpoly(suffix c)(expr o, ot, oc, poly) =
  if (o = ot) and ((ordcode(c)) = oc):
    fill poly withcolor pink;
  fi;
enddef;

ahlength := 1mm;
ahangle := 30;
def prfarrow(suffix c)(expr o, ot, oc, s, l, x, y) =
  save arr, int;
  path arr;
  if (o = ot) and ((ordcode(c)) = oc):
    pair int;
    int = whatever[s, l] = whatever[x, y];
    arr := s--int;
    drawarrow arr withcolor red;
  fi;
enddef;

input "prfpolys.gen";
input "prfarrows.gen";

numeric fignum, otfignum, otype, numdiag, c[], vl[];
path e[];
pair v[], d[];

fignum := 0;

numeric m, n;

m := 1;
n := 16;

for otype:=1 upto (m-1)*6:
  readfrom f;
endfor;

for otype:=m upto n:
  otfignum := 0;

  for i=0 upto 5:
    v[i] := scantokens(readfrom f);
  endfor;
  
  maxx := 0;
  minx := 255;
  maxy := 0;
  miny := 255;
  for i=0 upto 5:
    if (xpart v[i]) > maxx: maxx := xpart v[i]; fi;
    if (xpart v[i]) < minx: minx := xpart v[i]; fi;
    if (ypart v[i]) > maxy: maxy := ypart v[i]; fi;
    if (ypart v[i]) < miny: miny := ypart v[i]; fi;
  endfor;
  
  u := w/(maxx-minx);
  
  for i=0 upto 5:
    v[i] := v[i]*u;
  endfor;
  
  c0 := 0;
  for A := 1 upto 5:
    for B := 1 upto 5:
      for C := 1 upto 5:
    	for D := 1 upto 5:
    	  for E := 1 upto 5:
  	    c1 := A;
  	    c2 := B;
  	    c3 := C;
  	    c4 := D;
  	    c5 := E;
	    
  	    if perm(c) and gord(c):
  	      e0 := v[c0]--v[c1];
  	      e1 := v[c1]--v[c2];
  	      e2 := v[c2]--v[c3];
  	      e3 := v[c3]--v[c4];
  	      e4 := v[c4]--v[c5];
  	      e5 := v[c5]--v[c0];
	      
	      numdiag := 0;
	      for i:=0 upto 3:
		for j:=i+2 upto 5:
		  if (not ((i=0) and (j=5))) and visib(i,j,e,v,c)
		    and inside(1/2[(v[c[i]]),(v[c[j]])], v, c):
		    d[numdiag] := (c[i],c[j]);
		    numdiag := numdiag + 1; 
		  fi;
		endfor;
	      endfor;
	      
  	      if simp(e) and cross(v, d, numdiag) and (numrflx(v, c) > 1):
		otfignum := otfignum + 1;
  	      	outputtemplate := "%j-";
		if otype < 10: outputtemplate := outputtemplate & "0"; fi;
		outputtemplate := outputtemplate & decimal otype & "-"
		  & ordcode(c) &".mps";
  	      	fignum := fignum + 1;
  	      	beginfig(fignum)
		  drawprfpoly(otype, v, c);
		  
  	      	  % for i:=0 upto 5:
		  %   label.ulft(decimal c[i], v[c[i]]);
  	      	  % endfor;
		  % label.lrt(decimal otype & "-" & ordcode(c), (minx,miny)*u);
		  
		  for k:=0 upto numdiag-1:
		    draw v[xpart d[k]]--v[ypart d[k]] dashed withdots
		      scaled 1/4;
		  endfor;
		  
		  drawprfarrow(otype, v, c);
		  
  	      	  for i:=0 upto 5:
  	      	    draw e[i];
  	      	  endfor;
		  
  	      	endfig;
  	      fi;

	      % Specific examples used in the paper:

	      % XXX ugly code duplication

	      % XXX no clean way to resize these without fixing the
	      % duplication issue

	      if (otype = 6) and (ordcode(c) = "012435"):
		outputtemplate := "hexdef-one-reflex.mps";
		fignum := fignum + 1;
		beginfig(fignum)
		  pair bpa, bpb, intpt;

		  width := maxx-minx;
		  height := maxy-miny;
		  minx := minx - 0.1*width;
		  maxx := maxx + 0.2*width;
		  miny := miny - 0.25*height;
		  maxy := maxy + 0.25*height;
		  
		  bpa := 3/4[(minx, miny)*u, (minx, maxy)*u];
		  bpb = whatever[bpa, v[4]] =
		    whatever[(maxx, miny)*u, (maxx, maxy)*u];
		  
		  fill ((minx,maxy)*u)--((maxx,maxy)*u)--bpb--bpa--cycle
		    withcolor lightblue;
		  
		  fill v[0]--v[1]--v[2]--cycle withcolor pink;
		  
		  for k:=0 upto numdiag-1:
		    draw (v[xpart d[k]]--v[ypart d[k]]) dashed withdots
		      scaled 1/4;
		  endfor;
		  
		  intpt = whatever[v[0],v[2]] = whatever[v[1],v[4]];
		  
		  drawarrow v[1]--intpt withcolor red;
		  
  	      	  for i:=0 upto 5:
  	      	    draw e[i];
  	      	  endfor;

		  label.ulft(btex $d$ etex, v[0]);
		  label.urt(btex $c$ etex, v[1]);
		  label.lrt(btex $b$ etex, v[2]);
		  label.lrt(btex $f$ etex, v[3]);
		  label.lft(btex $a$ etex, v[4]);
		  label.llft(btex $e$ etex, v[5]);
		endfig;
	      fi;
	      
	      if (otype = 10) and (ordcode(c) = "013245"):
		outputtemplate := "hexdef-example-before.mps";
		fignum := fignum + 1;
		beginfig(fignum)
		  drawprfpoly(otype, v, c);
		  
		  for k:=0 upto numdiag-1:
		    draw v[xpart d[k]]--v[ypart d[k]] dashed withdots
		      scaled 1/4;
		  endfor;
		  
		  drawprfarrow(otype, v, c);
		  
  	      	  for i:=0 upto 5:
  	      	    draw e[i];
  	      	  endfor;
		  
		  label.urt(btex $d$ etex, v[0]);
		  label.lrt(btex $c$ etex, v[1]);
		  label.lft(btex $a$ etex, v[2]);
		  label.llft(btex $b$ etex, v[3]);
		  label.llft(btex $f$ etex, v[4]);
		  label.ulft(btex $e$ etex, v[5]);
		endfig;
		
		numeric endtm;
		pair vtmp[];
		path etmp[];
		
		endtm[v[3],v[2]] = whatever[v[4],v[1]];

		for i:=0 upto 5:
		  vtmp[i] := v[i];
		endfor;
		
		vtmp[2] := (endtm+0.3*u)[vtmp[3],vtmp[2]];
		etmp0 := vtmp[c0]--vtmp[c1];
		etmp1 := vtmp[c1]--vtmp[c2];
		etmp2 := vtmp[c2]--vtmp[c3];
		etmp3 := vtmp[c3]--vtmp[c4];
		etmp4 := vtmp[c4]--vtmp[c5];
		etmp5 := vtmp[c5]--vtmp[c0];
		
		outputtemplate := "hexdef-example-after.mps";
		fignum := fignum + 1;
		beginfig(fignum)
		  for k:=0 upto numdiag-1:
		    draw vtmp[xpart d[k]]--vtmp[ypart d[k]] dashed withdots
		      scaled 1/4;
		  endfor;
		  
  	      	  for i:=0 upto 5:
  	      	    draw etmp[i];
  	      	  endfor;
		  
		  label.urt(btex $d$ etex, vtmp[0]);
		  label.lrt(btex $c$ etex, vtmp[1]);
		  label.lft(btex $a$ etex, vtmp[2]);
		  label.llft(btex $b$ etex, vtmp[3]);
		  label.llft(btex $f$ etex, vtmp[4]);
		  label.ulft(btex $e$ etex, vtmp[5]);
		endfig;
	      fi;
	      
  	    fi;
    	  endfor;
    	endfor;
      endfor;
    endfor;
  endfor;
endfor;

bye;
