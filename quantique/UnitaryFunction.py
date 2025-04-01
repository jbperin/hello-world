import inspect
import itertools
import sympy as sp

def binaire_vers_entier(binaire: str) -> int: return int(binaire, 2)
def booleens_vers_chaine(liste_booleens): return ''.join('1' if b else '0' for b in liste_booleens)

def format_matrice(matrice):
    # Récupérer le nom de la variable passée à la fonction
    frame = inspect.currentframe().f_back
    noms_variables = {id(v): k for k, v in frame.f_locals.items()}
    nom_matrice = noms_variables.get(id(matrice), "Matrice")

    # Construire la représentation en chaîne
    lignes = [', '.join(map(str, row)) + ',' for row in matrice.tolist()]
    lignes[-1] = lignes[-1][:-1]  # Retire la dernière virgule
    return f"{nom_matrice} =\n" + '\n'.join(lignes)

def buildUnitaryMatrix(fonction):
    def bool2char(b): return "1" if b else "0"
    nb_parametres = len (inspect.signature(fonction).parameters)
    entrees = [[False, True] for _ in range (nb_parametres+1)]
    M = sp.zeros(2**(nb_parametres+1))
    for combinaison in itertools.product(*entrees):
        resultat = fonction(*(combinaison[1:]))
        yxoru = resultat ^ combinaison[0]
        # print(f"Entrée: {combinaison}, Résultat: {resultat}, yxoru = {yxoru}")
        idxstart= binaire_vers_entier(booleens_vers_chaine(combinaison))
        idxend = binaire_vers_entier(bool2char(yxoru) + booleens_vers_chaine(combinaison[1:]))
        # print (f"{idxstart} -> {idxend}")
        M[idxstart, idxend] = 1
    return M


def buildUnitaryMatrixFromSimonFunction(fonction):
    nb_input = len (inspect.signature(fonction).parameters)
    fake_parametres = [False] * nb_input
    nb_output = len(fonction(*fake_parametres))
    # print (nb_output)
    nb_qubits = nb_input + nb_output
    entrees = [[False, True] for _ in range (nb_qubits)]
    list_combinaison = itertools.product(*entrees)
    M = sp.zeros(2**(nb_qubits)) # sp.Matrix([])
    for combinaison in list_combinaison:

        idxstart= binaire_vers_entier(booleens_vers_chaine(combinaison))
        
        resultat = fonction(*(combinaison[nb_output:]))
        fullstate = [combinaison[ii] ^ resultat[ii] for ii in range(nb_output)] + list(combinaison[nb_output:]) # -1, -1, -1
        idxend = binaire_vers_entier(booleens_vers_chaine(fullstate))
        
        #vect = [1 if fullstate[u] else 0 for u in range(len(fullstate))]
        print (f"{idxstart} {idxend}{list(combinaison)}, {fullstate}, ")
        #M=M.row_insert(idx_col, sp.Matrix([vect]))
        # print (M)
        M[idxstart, idxend] = 1
    return M

if __name__ == "__main__":
    def uneFonction(param1, param2): return param1 and param2

    def uneFonction2x2(param1, param2):
        table1={
            "00": "11",
            "01": "00",    
            "10": "11",    
            "11": "00",    
        } # s = 10
        table2={
            "00": "01",
            "01": "10",    
            "10": "01",    
            "11": "10",    
        } # s = 10
        # Convertir les paramètres booléens en une chaîne de caractères
        key = f"{int(param1)}{int(param2)}"

        # Obtenir la valeur correspondante dans le dictionnaire
        value = table1.get(key, "")

        # Convertir la valeur en un tableau de booléens
        result = [char == '1' for char in value]

        return result
    
    def uneFonction3x3(param1, param2, param3):
        table2={
            "000": "011",
            "001": "101",    
            "010": "000",    
            "011": "010",    
            "100": "101",
            "101": "011",
            "110": "010",
            "111": "000",
        } # s = 101
        # Convertir les paramètres booléens en une chaîne de caractères
        key = f"{int(param1)}{int(param2)}{int(param3)}"

        # Obtenir la valeur correspondante dans le dictionnaire
        value = table2.get(key, "")

        # Convertir la valeur en un tableau de booléens
        result = [char == '1' for char in value]

        return result

    #M=buildUnitaryMatrix(uneFonction)
    #print (format_matrice(M))
    M=buildUnitaryMatrixFromSimonFunction(uneFonction2x2)
    print (format_matrice(M))
    #print(uneFonction3x3(False, False, False))  # Output: [False, True, True]
    #print(uneFonction3x3(False, False, True))  # Output: [True, False, True, False]

    #M=buildUnitaryMatrixFromSimonFunction(uneFonction2x2)
    #print (M)

