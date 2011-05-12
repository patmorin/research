#include<stdio.h>
#include<stdlib.h>

#define w 9 
#define mask ((1<<w)-1)
#define d 2

#define maxw mask

#define h(z, x) (((z*x)&mask) >> (w-d))

int main(void)
{
  unsigned z, x, y, c;

  for (x = 0; x <= maxw; x++) {
    for (y = 0; y <= maxw; y++) {
      c = 0;
      for (z = 1; z <= maxw; z+=2) {
        if (h(z, x) == h(z, y)) 
          c++;
      }
      printf("%u %u %lf\n", x, y, ((double)c)/(1<<(w-1)));
    }
    printf("\n");
  }
  return 0;
}

