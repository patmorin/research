"""A simulation to help understand fast finger search/exponential search

This module helps understand the process of implementing a form of
exponential search (searching from a finger at position 0) that works
by assigning each position a weight w[i] = 1/(i log^2(i)) and building a
weighted binary search tree that has i=1...n as leaves using Mehlhorn's
algorithm [SICOMP, 6(2):235-239, 1977].

This method is guaranteed to find the element at position i after at most
log(i) + 2loglog(i) + O(1) comparisons.
"""


from __future__ import division
from math import log, ceil


from Tkinter import *

class Node(object):
    def __init__(self, left, right, w, k):
        self.left = left
        self.right = right
        self.w = w
        self.k = k
    def __str__(self):
        return "(%s %s %s)" \
            % (str(self.left), str(self.k), str(self.right))

def mehlhorn(leaves):

    def mehlhorn_r(i, j, lo, hi):
        # base case - only 2 leaves
        if j == i+1: 
            lc = leaves[i]
            rc = leaves[j]
        else:
            # find node, k,  that bisects [lo, hi]
            target = (lo+hi)/2
            if s[i] > target: 
                k = i+1
            elif s[j] < target:
                k = j
            else:
                k = i+1
                while s[k] < target: k += 1
            # recurse
            if k == i+1:
                lc = leaves[i]
                rc = mehlhorn_r(i+1, j, target, hi)
            elif k == j:
                lc = mehlhorn_r(i, j-1, lo, target)
                rc = leaves[j]
            else:
                lc = mehlhorn_r(i, k-1, lo, target)
                rc = mehlhorn_r(k, j, target, hi)
        return Node(lc, rc, lc.w+rc.w, rc.k)

    # normalize weights
    w = [ ell.w for ell in leaves]
    W = sum(w)
    w = [ x/W for x in w ]
    # make s[i] = s[0] + s[1] + ... + s[i-1] + s[i]/2
    s = [ x for x in w ]
    for i in range(1, len(s)):
        s[i] += s[i-1]
    for i in range(1,len(s)):
        s[i] -= leaves[i].w/2
    t = mehlhorn_r(0, len(w)-1, 0, 1)
    assign_internal_keys(t)
    return t

def assign_internal_keys(t):
    if t:
        if t.left: t.k = t.left.k
        assign_internal_keys(t.left)
        assign_internal_keys(t.right)
    
def real_weights(n):
    return [1./(i*log(i)**2) for i in range(2,n+1)]

def rough_weights(n):
    c = [ceil(log(i)) for i in range(2, n+1)]
    return [1./((2**c[i])*(c[i]**2)) for i in range(len(c))]


class App():
    def __init__(self):
        w = rough_weights(150)
        leaves = [Node(None, None, w[i], i+2) for i in range(len(w))]
        self.t = mehlhorn(leaves)
        print self.t
        print sum(w)
        print w

        self.root = Tk()
        self.root.wm_title("FFS")
        self.canvas = Canvas(self.root, width=1600, height=600)
        self.canvas.pack()

        self.draw_tree(self.t, 1)

        self.root.mainloop()
        
    def draw_tree(self, r, d):
        if r.left: 
            self.draw_edge(r.k, d, r.left.k, d+1)
            self.draw_tree(r.left, d+1)
        if r.right: 
            self.draw_edge(r.k, d, r.right.k, d+1)
            self.draw_tree(r.right, d+1)
        self.draw_node(r.k, d) 
        
    def draw_edge(self, x0, d0, x1, d1):
        x0 *= 10
        y0 = d0*10
        x1 *= 10
        y1 = d1*10
        self.canvas.create_line(x0+3, y0+3, x1+3, y1+3, width=1) 

    def draw_node(self, x, d):
        x *= 10
        y = d*10
        self.canvas.create_oval(x, y, x+6, y+6, fill="green", width=1) 

App()
