
import sklearn

from sklearn.tree import DecisionTreeClassifier
from sklearn.tree import export_text

import numpy as np
import math

from sympy.logic import POSform, SOPform
from sympy import symbols

symA = 'a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15'
symB = 'b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15'

a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 = symbols(symA)
b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 = symbols(symB)

A = [a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15]

B = [b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15]

def toBin (val, size):
    return list(reversed(list(map(lambda x: int(x),'{:0{}b}'.format(val, size)))))

NBITS = 8
idxOfBitToEncode = 6
X=[]
y=[]
minterms = []
dontcares  = []
def f(i): return min((2**NBITS)-1,round(math.log2((i))*(((2**NBITS))/NBITS))) if i != 0 else 0

for v1 in range(2**NBITS):
        binv1       = toBin(v1, NBITS)
        mathval1    = f(v1) # round(math.sqrt(v1)) #
        binval1     = toBin (mathval1, NBITS)
        targetbit   = binval1[idxOfBitToEncode]
        print (v1, binv1, mathval1, binval1, targetbit)
        X.append(binv1)
        y.append(targetbit)
        if targetbit == 1:
            minterms.append(binv1)
##        else:
##            dontcares.append(binv1)
            
        
##X = [[0,0] , [0, 1], [1, 0], [1, 1]]
##y = [0, 1, 1, 1]

print (X)
print(y)
print ("minterms = ",minterms)
print ("dontcares = ",dontcares)
tree = DecisionTreeClassifier().fit(X, y)

r = export_text(tree, feature_names = symA.split()[0:NBITS]) # , feature_names = ["a", "b"])

print (r)
##minterms = [[0, 0, 0, 1], [0, 0, 1, 1], [0, 1, 1, 1],
##            [1, 0, 1, 1], [1, 1, 1, 1]]
##dontcares = [[0, 0, 0, 0], [0, 0, 1, 0], [0, 1, 0, 1]]
pos = POSform(A[0:NBITS], minterms, dontcares)
sop = SOPform(A[0:NBITS], minterms, dontcares)
print (pos)
print (sop)



def runthrough(clf):
    n_nodes = clf.tree_.node_count
    children_left = clf.tree_.children_left
    children_right = clf.tree_.children_right
    feature = clf.tree_.feature
    threshold = clf.tree_.threshold
    values = clf.tree_.value

    node_depth = np.zeros(shape=n_nodes, dtype=np.int64)
    is_leaves = np.zeros(shape=n_nodes, dtype=bool)
    stack = [(0, 0)]  # start with the root node id (0) and its depth (0)
    while len(stack) > 0:
        # `pop` ensures each node is only visited once
        node_id, depth = stack.pop()
        node_depth[node_id] = depth

        # If the left and right child of a node is not the same we have a split
        # node
        is_split_node = children_left[node_id] != children_right[node_id]
        # If a split node, append left and right children and depth to `stack`
        # so we can loop through them
        if is_split_node:
            stack.append((children_left[node_id], depth + 1))
            stack.append((children_right[node_id], depth + 1))
        else:
            is_leaves[node_id] = True

    print(
        "The binary tree structure has {n} nodes and has "
        "the following tree structure:\n".format(n=n_nodes)
    )
    for i in range(n_nodes):
        if is_leaves[i]:
            print(
                "{space}node={node} is a leaf node with value={value}.".format(
                    space=node_depth[i] * "\t", node=i, value=values[i]
                )
            )
        else:
            print(
                "{space}node={node} is a split node with value={value}: "
                "go to node {left} if X[:, {feature}] <= {threshold} "
                "else to node {right}.".format(
                    space=node_depth[i] * "\t",
                    node=i,
                    left=children_left[i],
                    feature=feature[i],
                    threshold=threshold[i],
                    right=children_right[i],
                    value=values[i],
                )
            )
        
runthrough(tree)
