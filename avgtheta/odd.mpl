# Area of upper rectangle
A := proc(r, theta)
  local a, b;
  a := r*sin((Pi-theta)*(1/2))/sin((1/2)*theta);
  b := r*sin((1/2)*theta)/sin((Pi-theta)*(1/2));
  (1/2)*(a+b)*r;
end proc

# Area of lower rectangle
B := proc(l, r, theta)
  local s, t, q, h, y;
  s := r*sin((1/2)*Pi-theta)/sin(3*theta*(1/2));
  t := l*sin((Pi-theta)*(1/2))/sin(3*theta*(1/2));
  q := t*sin(theta)/sin((1/2)*theta)-s;
  h := q*sin((1/2)*Pi-theta);
  y := q*sin(3*theta*(1/2))/sin((Pi-theta)*(1/2));
  (1/2)*y*h;
end proc

# Pr{uw is mutual | l}
f := proc(l, theta) 
  int((1/l)*exp(-A(r,theta)-B(l,r,theta), r = 0 .. l);
end proc

# Cumulative distribution function on l (P(x) = Pr{l <= x})
P := proc(x, theta)
 1-exp(-x^2*sin((1/2)*Pi-(1/2)*theta)/sin((1/2)*theta))
end proc

# Probability density function on l
p := unapply(diff(P(x, theta), x), x, theta);

psubk := Int(p(l, 2*Pi/k)*f(l, 2*Pi/k), l = 0 .. infinity)



