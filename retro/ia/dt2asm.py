import sklearn


from sklearn.tree import DecisionTreeClassifier
from sklearn.tree import export_text

import numpy as np
import math


def collide(x, y):
    return (
        ((x==3) and (3<=y) and (y<=6))
        or ((y==6) and (2<=x) and (x<=5))
    )


def toBin (val, size):
    return list(reversed(list(map(lambda x: int(x),'{:0{}b}'.format(val, size)))))

NBITS=4

def buildDataSet():
    lInputs = []
    lOutputs = []
    for ix in range(2**NBITS):
        binX    = toBin(ix, NBITS)
        for iy in range(2**NBITS):
            binY    = toBin(iy, NBITS)
            lInputs.append([ix, iy] + binX + binY)
            lOutputs.append(collide(ix, iy))
            if collide(ix, iy): print (ix, iy)
    return (lInputs, lOutputs)

##print (collide(3,6))
lInputs, lOutputs = buildDataSet()
##for i in range(len(lInputs)):
##    print (lInputs[i], lOutputs[i])

tree = DecisionTreeClassifier().fit(lInputs, lOutputs)

r = export_text(tree) # , feature_names = ["a", "b"])

print (r)
