from sympy import symbols, eye, Matrix, tensorproduct

# Définir les symboles
n = symbols('n')

# Créer la matrice d'Hadamard (manuellement)
H = Matrix([[1/sqrt(2) for _ in range(n)] for _ in range(n)])

# Créer la matrice identité
I = eye(n)

# Calculer le produit tensoriel
produit_tensoriel = tensorproduct(H, I)

# Afficher le résultat
print(produit_tensoriel)
