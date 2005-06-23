#include <stdio.h>
#include <math.h>

double log_func(double k)
{
  return 1 + log(k) + log(k-1) + log(k-2) + log(k-3) + log(k-4) + log(k-5)
    - log(6) - log(5) - log(4) - log(3) - log(2) - log(1);
}

int main(void)
{
  double k;

  k = 6;
  while (log_func(k) >= k/6.0) {
    printf("log(%f choose 6) = %f, %f/6 = %f\n", k, log_func(k), k, k/6.0);
    k = k + 1.0;
  }
  printf("log(%f choose 6) + 1 = %f < %f / 6\n", k, log_func(k), k);
  printf("The value of r is: %f\n",
	 k*(k-1)*(k-2)*(k-3)*(k-4)*(k-5) / (6.0*5*4*3*2*1));
  return 0;
}

