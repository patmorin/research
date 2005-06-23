#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int x, y;
} point;

point tmp;

#define SWAP(a,b) { (tmp)=(a); (a)=(b); (b)=(tmp); }
//#define SWAP(a,b) if (&a != &b) { (a)=(a)^(b); (b)=(a)^(b); (a)^=(a)^(b); }

void print(point *a, int n) 
{
  int i;

  for (i = 0; i < n; i++) {
    printf("(%2d,%2d)", a[i]);
  }
  printf("\n");
}

void permute(point *a, int n)
{
  int i, j;

  for (i = 0; i < n; i++) {
    j = rand()%(n-i);
    SWAP(a[i], a[i+j]);
  }
}

int partition(point *a, int i, int n) 
{
  int h;

  SWAP(a[0], a[i]);
  h = 1;
  for (i = 1; i < n; i++) {
    if (a[i].x < a[h-1].x) {
      SWAP(a[i], a[h]);
      SWAP(a[h-1], a[h]);
      h = h + 1;
    }
  }
  return h;
}

void partition_undo(point *a, int h, int n) 
{
  int i;

  h = h - 1;
  for (i = n - 1; i > 0; i--) {
    if (a[h-1].y > a[i].y) {
      SWAP(a[h-1], a[h]);
      SWAP(a[i], a[h]);
      h = h - 1;
      print(a, n);
    }
  }
}


#define N 10

int main(void) {
  int i, h;
  point a[N];

  srand(time(NULL));
  for (i = 0; i < N; i++) {
    a[i].x = i;
    a[i].y = 0;
  }
  printf("y-Sorted: ");
  print(a, N);
  permute(a, N);
  for (i = 0; i < N; i++) {
    a[i].y = i;
  }
  printf("Permuted: ");
  print(a, N);
  h = partition(a, 0, N);
  printf("x-Part'd: ");
  print(a, N);
  partition_undo(a, h, N);
  printf("y-Sorted: ");
  print(a, N);
  return 0;
}
 
