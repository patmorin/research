#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

unsigned int B = 40;
unsigned int nnodes = 0;

typedef double number;

typedef struct tag_btree_node {
  unsigned int nkeys;
  number *keys;
  struct tag_btree_node **children;
} btree_node;

/* Create a new empty btree node */
btree_node *make_node(void)
{
  btree_node *n;

  nnodes++;
  assert((n = malloc(sizeof(btree_node))) != NULL);
  n->nkeys = 0;
  assert((n->keys = malloc(sizeof(number)*(B-1))) != NULL);
  assert((n->children = malloc(sizeof(btree_node*)*B)) != NULL);
  return n;
}



void print_btree(btree_node *r)
{
  unsigned int j;

  if (r != NULL) {
    for (j = 0; j < r->nkeys; j++) {
      print_btree(r->children[j]);
      printf("%f ", r->keys[j]);
    }
    print_btree(r->children[j]);
  }
}

int main(int argc, char *argv[]) 
{
  btree_node *r = NULL, *n;
  unsigned int N = 2000000, i, j, k;
  number key;

  if (argc != 3 || (B = atoi(argv[1])) < 2 || (N = atoi(argv[2])) <= 0) {
    fprintf(stderr, "Usage: %s <B> <N>\n", argv[0]);
    exit(-1);
  }

  r = make_node();
  for (i = 0; i < N; i++) {
    key = ((double)rand()) / RAND_MAX;
    n = r;
    while (1) {
      for (j = 0; j < n->nkeys; j++) {
	if (n->keys[j] > key) break;
      }
      if (n->nkeys < B-1) {
	for (k = n->nkeys; k > j; k--) {
	  n->keys[k] = n->keys[k-1];
	}
	n->keys[j] = key;
	n->nkeys++;
	break;
      } else if (n ->children[j] == NULL) {
	n->children[j] = make_node();
      }
      n = n->children[j];
    } 
  }
  // print_btree(r);
  printf("N = %d , B = %d , nnodes = %d , %f items/node\n",
	 N, B, nnodes, ((double)N)/nnodes);
  return 0;
}


