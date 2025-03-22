import inspect
import itertools
import sympy as sp


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
    def binaire_vers_entier(binaire: str) -> int: return int(binaire, 2)
    def booleens_vers_chaine(liste_booleens): return ''.join('1' if b else '0' for b in liste_booleens)
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

if __name__ == "__main__":
    def uneFonction(param1, param2): return param1 and param2

    M=buildUnitaryMatrix(uneFonction)
    print (format_matrice(M))
