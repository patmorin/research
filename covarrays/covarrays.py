"""Some code for generating covering arrays
In this code
  - n is the number of columns (factors)
  - q is the size of the alphabet (number of levels)
  - t is the the size of the subsets of columns we consider (strength)
  - m is the covering array, indexed first by columns, then by rows
"""
from math import log, ceil
import random

def gen_column(k, q):
    """ Return a new random column of k q-ary values """
    a = [ i//(k//q) for i in range(k) ]
    random.shuffle(a)
    return a

    
def halver(k):
    """ Return a binary array of length k with half its bits set to 1 """
    p = random.sample(range(k), k//2)
    a = [0]*k
    for i in p: a[i] = 1
    return a


def print_array(m):
    """ Print a covering array """
    for j in range(len(m[0])):
        for i in range(len(m)):
            print "%d " % m[i][j],
        print
        

def gen_subsets(s, t):
    """ Return a list of all subets of s of size t """
    if t == 0: return [[]]
    a = []
    s2 = s.copy()
    while len(s2) > 0:
        x = s2.pop()
        tmp = gen_subsets(s2, t-1)
        for i in range(len(tmp)): tmp[i].append(x)
        a.extend(tmp)
    return a

    
def nchoosek(n,k):
    """ Return the binomial coefficient n choose k """
    return reduce(lambda a,b: a*(n-b)/(b+1),xrange(k),1)


def bad_event(m, t, q, k, idx):
    """ Determine if the indices given by idx form a bad event """
    a = [False]*q**t
    for j in range(k):
        z = 0
        for i in idx:
            z *= q
            z += m[i][j]
        a[z] = True
    return False in a

            
def main(n, t, q):
    """ Find covering array of strength t with n inputs over q-ary vars """
    # pick a suitable number, k, of columns - should be a multiple of q
    k = int(ceil(t*q**t*log(n,2)))
    k += q-(k%q)
    m = [ gen_column(k, q) for i in range(n) ]
    print_array(m)
    print "n = %d, t = %d, q = %d, k=%d" % (n, t, q, k)
    print "The preceding is the starting array"
    indices = gen_subsets(set(range(n)), t)
    while True:
        done = False
        while not done:
            done = True
            for idx in indices:
                if bad_event(m, t, q, k, idx):
                    for j in idx:
                        m[j] = gen_column(k, q)
                    done = False
                    break
        print_array(m)
        print "n = %d, t = %d, q = %d, k=%d" % (n, t, q, k)
        k -= q
        for c in m: 
            for i in range(q): c.pop()

main(20, 3, 2)

