import sklearn

from sklearn.tree import DecisionTreeClassifier
from sklearn.tree import export_text

import numpy as np
import math


def toBin (val, size):
    return list(reversed(list(map(lambda x: int(x),'{:0{}b}'.format(val, size)))))

NBITS = 4

X=[]

for v1 in range(2**NBITS):
        binv1       = toBin(v1, NBITS)
        X.append(binv1)

y=[]
idxOfBitToEncode = 0
for v1 in range(2**NBITS):
        mathval1    = round(math.sqrt(v1))
        binval1     = toBin (mathval1, NBITS)
        targetbit   = binval1[idxOfBitToEncode]
        print (v1, toBin(v1, NBITS), mathval1, binval1, targetbit)
        y.append(targetbit)
            
#tree = DecisionTreeClassifier(max_depth=2).fit(X, y)
tree = DecisionTreeClassifier(max_depth=2).fit(X, y)

r = export_text(tree) # , feature_names = ["a", "b"])

print (r)

clf = tree

n_nodes = clf.tree_.node_count
children_left = clf.tree_.children_left
children_right = clf.tree_.children_right
feature = clf.tree_.feature
threshold = clf.tree_.threshold
values = clf.tree_.value

print (n_nodes, children_left, children_right, feature, threshold, values)
