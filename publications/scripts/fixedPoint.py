from math import log2, log, exp

h = 100
d = 1
r = 32
lh = round(log2(h)*r)
ld = round(log2(d)*r)
res = round(2**((lh-ld)/r))
print (res, h/d)
