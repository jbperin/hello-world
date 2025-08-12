

# recherche r3:
# 	r3 = 0

# recherche r2:
# 	(a3 == 0) ==> r2 = 0
#                       recherche r1 (sachant que a3 == 0):
#                               (a2 == 0) ==> (a1 == 0) ==> r1 = 0
#                                                           recherche r0 (sachant que a3 == 0, a2 == 0, a1 == 0)
#                                                           (a0 == 0) ==> r0 = 0
#                                                           (a0 == 1) ==> r0 = 1
#                                             (a1 == 1) ==> (a0 == 0) ==> r1 = 0
#                                                                         recherche r0 (sachant que a3 == 0, a2 == 0, a1 == 1, a0 == 0)
#                                                                         r0 = 0
#                                                           (a0 == 1) ==> r1 = 1 
#                                                                         recherche r0 (sachant que a3 == 0, a2 == 0, a1 == 0, a0 == 1)
#                                                                         r0 = 0
#                               (a2 == 1) ==> r1 = 1
#                                             recherche r0 (sachant que a3 == 0, a2 == 1)
#                                             (a1 == 0) ==> r0 = 0 
#                                             (a1 == 1) ==> (a0 == 0) ==> r0 = 0
#                                                           (a0 == 1) ==> r0 = 1
# 	(a3 == 1) ==> (a2 == 0) ==> r2 = 0
#                                     recherche r1 (sachant que a3 == 1, a2 == 0):
#                       (a2 == 1) ==> (a0 == 0) ==> (a1 == 0) ==> r2 = 0
#                                                                 recherche r1 (sachant que a3 == 1, a2 == 1, a0 == 0, a1 == 0)):
#                                                                 r1 = 0
#                                                                 r0 = 0
#                                                   (a1 == 1) ==> r2 = 1
#                                                                 recherche r1 (sachant que a3 == 1, a2 == 1, a0 == 0, a1 == 1)):
#                                                                 r1 = 0
#                                                                 r0 = 0
#                                     (a0 == 1) ==> r2 = 1
#                                                   recherche r1 (sachant que a3 == 1, a2 == 1, a0 == 1)):
#                                                   r1 = 0
#                                                   r0 = 0




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


def build_X_y(NBITS, idxOfBitToEncode, hypothesis):
    X = []
    y = []
    for v1 in range(2**NBITS):
        binv1 = toBin(v1, NBITS)
        include = True
        for hyp in hypothesis:
            if binv1[hyp[0]] != hyp[1]:
                include = False
                break
        if not include:
            continue
        mathval1 = round(math.sqrt(v1))
        binval1 = toBin(mathval1, NBITS)
        targetbit = binval1[idxOfBitToEncode]
        print(v1, binv1, mathval1, binval1, targetbit)
        X.append(binv1)
        y.append(targetbit)
    print(X)
    print(y)
    return X, y


NBITS = 4
idxOfBitToEncode = 3
hypothesis = []  # Example hypothesis to filter inputs

X, y = build_X_y(NBITS, idxOfBitToEncode, hypothesis)


print (X)
print(y)

tree = DecisionTreeClassifier(max_depth=2).fit(X, y)

# r = export_text(tree, feature_names = symA.split()[0:NBITS]) # , feature_names = ["a", "b"])

# print (r)

node_id         = 0
children_left   = tree.tree_.children_left
children_right  = tree.tree_.children_right
feature         = tree.tree_.feature
threshold       = tree.tree_.threshold
values          = tree.tree_.value

# n_nodes         = tree.tree_.node_count
is_split_node = children_left[node_id] != children_right[node_id]

if not is_split_node:
    print(
        "{space}node={node} is a leaf node with value={value}.".format(
            space=1 * "\t", node=node_id, value=values[node_id]
        )
    )
else:
    print(
        "{space}node={node} is a split node with value={value}: "
        "go to node {left} if X[:, {feature}] <= {threshold} "
        "else to node {right}.".format(
            space=1 * "\t",
            node=node_id,
            left=children_left[node_id],
            feature=feature[node_id],
            threshold=threshold[node_id],
            right=children_right[node_id],
            value=values[node_id],
        )
    )

        
# runthrough(tree)


idxOfBitToEncode = 2
hypothesis = []  # Example hypothesis to filter inputs

X, y = build_X_y(NBITS, idxOfBitToEncode, hypothesis)


print (X)
print(y)

tree = DecisionTreeClassifier(max_depth=2).fit(X, y)

# r = export_text(tree, feature_names = symA.split()[0:NBITS]) # , feature_names = ["a", "b"])

# print (r)

node_id         = 0
children_left   = tree.tree_.children_left
children_right  = tree.tree_.children_right
feature         = tree.tree_.feature
threshold       = tree.tree_.threshold
values          = tree.tree_.value

# n_nodes         = tree.tree_.node_count
is_split_node = children_left[node_id] != children_right[node_id]

if not is_split_node:
    print(
        "{space}node={node} is a leaf node with value={value}.".format(
            space=1 * "\t", node=node_id, value=values[node_id]
        )
    )
else:
    print(
        "{space}node={node} is a split node with value={value}: "
        "go to node {left} if X[:, {feature}] <= {threshold} "
        "else to node {right}.".format(
            space=1 * "\t",
            node=node_id,
            left=children_left[node_id],
            feature=feature[node_id],
            threshold=threshold[node_id],
            right=children_right[node_id],
            value=values[node_id],
        )
    )

