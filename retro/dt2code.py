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

import json 


symA = 'a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15'
symB = 'b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15'

a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 = symbols(symA)
b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 = symbols(symB)

A = [a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15]

B = [b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15]

def toBin (val, size):
    return list(reversed(list(map(lambda x: int(x),'{:0{}b}'.format(val, size)))))

NBITS = 4


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
        # print(v1, binv1, mathval1, binval1, targetbit)
        X.append(binv1)
        y.append(targetbit)
    # print(X)
    # print(y)
    return X, y


def display_tree(tree):
    r = export_text(tree)
    print(r)




def full_abstract_tree   (listOfIdxOfBitToEncode,  hypothesis):

    idxOfBitToEncode = listOfIdxOfBitToEncode[0]

    X, y = build_X_y(NBITS, idxOfBitToEncode, hypothesis)

    tree = DecisionTreeClassifier().fit(X, y) # max_depth=2
    display_tree(tree)
    node_id=0

    if tree.tree_.children_left[node_id] == tree.tree_.children_right[node_id]:  # Leaf node
        listOfIdxOfBitToEncode.pop(0)  
        max_idx = np.argmax(tree.tree_.value[node_id][0].tolist())          
        if len(listOfIdxOfBitToEncode) != 0:                
            result = {'value': f"r{idxOfBitToEncode} = {max_idx}",
                        'subtree': full_abstract_tree(listOfIdxOfBitToEncode, hypothesis)
                        }
            # listOfIdxOfBitToEncode.insert(0, sav)  # Restore the index for the next call
            return result
        else:
            result = {'value': f"r{idxOfBitToEncode} = {y[0]}"}
            # listOfIdxOfBitToEncode.insert(0, sav)
            return result
    else:
        result = {
            'feature': tree.tree_.feature[node_id],
            # 'threshold': "", #tree.tree_.threshold[node_id], #
            # 'value': "", # tree.tree_.value[node_id][0].tolist(), # 
        }
        savl = listOfIdxOfBitToEncode.copy()
        result['left'] = full_abstract_tree(listOfIdxOfBitToEncode, hypothesis + [(tree.tree_.feature[node_id], 0)])
        listOfIdxOfBitToEncode = savl.copy()
        result['right'] = full_abstract_tree(listOfIdxOfBitToEncode, hypothesis + [(tree.tree_.feature[node_id], 1)])
        listOfIdxOfBitToEncode = savl.copy()

        return result


def abstree_to_python_code(abstree, indent=0):
    code_lines = []
    ind = '  ' * indent
    # Handle value assignment
    if 'value' in abstree:
        code_lines.append(f"{ind}{abstree['value']}")
    
    # If there is a subtree, process it recursively
    if 'subtree' in abstree:
        if 'feature' in abstree['subtree']:
            var = f"a{abstree['subtree']['feature']}"
            code_lines.append(f"{ind}if ({var} == 0):")
            code_lines += abstree_to_python_code(abstree['subtree']['left'], indent + 1)   
            code_lines.append(f"{ind}else:")     
            code_lines += abstree_to_python_code(abstree['subtree']['right'], indent + 1)        
        else:
            code_lines += abstree_to_python_code(abstree['subtree'], indent)
    return code_lines
### value subtree feature left right

listOfIdxOfBitToEncode = [3, 2, 1, 0]  
hypothesis = []

abstree = full_abstract_tree   (listOfIdxOfBitToEncode,  hypothesis)


print(json.dumps(json.loads(str(abstree).replace ("'",'"')), indent=2))
