from __future__ import division

from math import log
from math import ceil
from math import floor

def log2(x):
	return log(x,2)

def dumb(n):
	'''Compute the running-time of merge-insertion'''
	return reduce(lambda x,y: x+y, [ceil(log2(3*i/4)) for i in range(1,n+1)])

def dumb2(n):
	'''Compute the running-time of merge-insertion'''
	return n * ceil(log2(3*n/4)) - floor(2**floor(log2(6*n))/3) + floor(log2(6*n)/2)

def lower_bound(n):
	'''Compute the inf. theor. lower-bound on sorting'''
	return reduce(lambda x,y: x+y, [log2(i) for i in range(1,n+1)])

def lower_bound2(n):
	'''Compute our new lower-bound on sorting'''
	return lower_bound(n)+n/9

for n in xrange(1,1000):
	print "%d vs. %f vs. %f vs. %f" % (dumb(n), dumb2(n), lower_bound(n), lower_bound2(n))

