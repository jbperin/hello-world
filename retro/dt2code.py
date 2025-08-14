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
import pandas as pd

from sympy.logic import POSform, SOPform
from sympy import symbols

import json 
import inspect

symA = 'a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15'
symB = 'b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15'

a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 = symbols(symA)
b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15 = symbols(symB)

A = [a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15]

B = [b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15]

def toBin (val, size):
    return list(reversed(list(map(lambda x: int(x),'{:0{}b}'.format(val, size)))))

# Dummy function: implements round(math.sqrt(v1))
def square_root_4_4(a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 4)

def square_root_8_8(a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 8)

def square_root_16_16(a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 16)

def uneFonction(a3, a2, a1, a0):
    # args: bits, most significant first (a3, a2, a1, a0)
    bits = [a3, a2, a1, a0]
    # Convert bits (MSB first) to int
    v1 = 0
    for i, b in enumerate(reversed(bits)):
        v1 += b << i
    mathval1 = round(math.sqrt(v1))
    # Output as list of bits (LSB first)
    return toBin(mathval1, 4)



def deduce_fonction_prototype(fonction):
    nb_input = len (inspect.signature(fonction).parameters)
    fake_parametres = [0] * nb_input
    nb_output = len(fonction(*fake_parametres))
    return nb_input, nb_output


NBITS_INPUT, NBITS_OUTPUT = deduce_fonction_prototype(uneFonction)

print (f"Nb input = {NBITS_INPUT}, Nb ouput = {NBITS_OUTPUT}")



# Build a DataFrame with all possible input/output pairs for uneFonction
def build_training_samples():
    data = []
    for v1 in range(2**NBITS_INPUT):
        binv1 = toBin(v1, NBITS_INPUT)
        # uneFonction expects MSB first
        out_bits = uneFonction(*reversed(binv1))
        row = {}
        for i in range(NBITS_INPUT):
            row[f'a{i}'] = binv1[i]
        for i in range(NBITS_OUTPUT):
            row[f'r{i}'] = out_bits[i]
        data.append(row)
    df = pd.DataFrame(data)
    return df

theDataframe = build_training_samples()

# build_X_y now filters from the DataFrame
def build_X_y(idxOfBitToEncode, hypothesis, df=None):
    if df is None:
        raise ValueError("A DataFrame of training samples must be provided.")
    # Build filter mask
    mask = pd.Series([True] * len(df))
    for hyp in hypothesis:
        mask &= (df[f'a{hyp[0]}'] == hyp[1])
    filtered = df[mask]
    X = filtered[[f'a{i}' for i in range(NBITS_INPUT)]].values.tolist()
    y = filtered[f'r{idxOfBitToEncode}'].values.tolist()
    return X, y


def display_tree(tree):
    r = export_text(tree)
    print(r)

def full_abstract_tree   (listOfIdxOfBitToEncode,  hypothesis):

    idxOfBitToEncode = listOfIdxOfBitToEncode[0]

    X, y = build_X_y( idxOfBitToEncode, hypothesis, theDataframe)

    if len(y) == 1:
        result = {'value': f"r{idxOfBitToEncode} = {y[0]}"}
        if (len(listOfIdxOfBitToEncode) != 1):
            listOfIdxOfBitToEncode.pop(0)
            result['subtree'] = full_abstract_tree(listOfIdxOfBitToEncode, hypothesis)
        return result
    
    tree = DecisionTreeClassifier().fit(X, y) # max_depth=2
    # display_tree(tree)
    node_id=0

    if tree.tree_.children_left[node_id] == tree.tree_.children_right[node_id]:  # Leaf node
        listOfIdxOfBitToEncode.pop(0)  
        if len(listOfIdxOfBitToEncode) != 0:                
            result = {'value': f"r{idxOfBitToEncode} = {y[0]}",
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


def build_abstree_to_json():
    listOfIdxOfBitToEncode = list(reversed(range(NBITS_OUTPUT))) 
    hypothesis = []

    abstree = full_abstract_tree   (listOfIdxOfBitToEncode,  hypothesis)

    print(json.dumps(json.loads(str(abstree).replace ("'",'"')), indent=2))

    with open("retro/abstree.json", "w") as f:
        f.write(json.dumps(json.loads(str(abstree).replace ("'",'"')), indent=2))

def read_abstree_from_json():
    with open("retro/abstree.json", "r") as fic_in:
        abstree = json.load(fic_in)
    return abstree

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
    else:
        # If there is a feature, handle it
        if 'feature' in abstree:
            var = f"a{abstree['feature']}"
            code_lines.append(f"{ind}if ({var} == 0):")
            code_lines += abstree_to_python_code(abstree['left'], indent + 1)
            code_lines.append(f"{ind}else:")
            code_lines += abstree_to_python_code(abstree['right'], indent + 1)
    return code_lines


# Function to generate the code
def generate_function_code(abstree, indent=0):
    code_lines = ["def compute_r(a):",
                  #"  [a0, a1, a2, a3] = a",
                  f"  [{', '.join([f'a{i}' for i in range(NBITS_INPUT)])}] = a",
                  #"  [r0, r1, r2, r3] = [0, 0, 0, 0]",
                  f"  [{', '.join([f'r{i}' for i in range(NBITS_OUTPUT)])}] = [{', '.join([f'0' for i in range(NBITS_OUTPUT)])}]",
                 ]  # Function header
    code_lines += abstree_to_python_code(abstree, indent=indent+1)
    code_lines.append(f"  r = [{', '.join([f'r{i}' for i in range(NBITS_OUTPUT)])}]")
    code_lines.append(f"  return r")
    return code_lines



import importlib.util
def save_function_to_file(function_code, filename):
    with open(filename, 'w') as f:
        for line in function_code:
            f.write(line + '\n')

def load_and_run_function(filename):
    spec = importlib.util.spec_from_file_location("abstree_module", filename)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return getattr(module, "compute_r")


build_abstree_to_json()


abstree = read_abstree_from_json()

function_code = generate_function_code(abstree)
save_function_to_file(function_code, 'retro/abstree.py')


# Load and run the function
compute_r = load_and_run_function('retro/abstree.py')

for v1 in range(2**NBITS_INPUT):
    binv1 = toBin(v1, NBITS_INPUT)
    mathval1 = round(math.sqrt(v1))
    binval1 = toBin(mathval1, NBITS_OUTPUT)
    bf_result = compute_r(binv1)
    print(v1, binv1, binval1, bf_result, bf_result == binval1 )
