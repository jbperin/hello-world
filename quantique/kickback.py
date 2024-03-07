import sympy
# from qiskit import QuantumCircuit
# start the pretty-printer to get nicely typeset math
sympy.init_printing()

from sympy.physics.quantum import Bra, Ket
from sympy import Matrix
from sympy.physics.quantum import TensorProduct
from sympy.physics.quantum.gate import HadamardGate,CNotGate, IdentityGate
from sympy.physics.quantum.qapply import qapply
from sympy import eye

from sympy.physics.quantum import Ket
from sympy import sqrt


#definition des états
ket0 = Matrix([1,0])
ket1 = Matrix([0,1])

α = sympy.Symbol("α")
β = sympy.Symbol("β")
ϕ = α * ket0 + β * ket1 # Matrix([α,β])


notgate=Matrix([[0,1], [1,0]])
hadamardgate = Matrix([[1/sqrt(2),1/sqrt(2)], [1/sqrt(2),-1/sqrt(2)]])
Zgate=Matrix([[1,0], [0,-1]])

SWAP = Matrix ([[1,0,0,0],[0,0,1,0],[0,1,0,0],[0,0,0,1]])
cnotgate = TensorProduct(eye(2),ket0*ket0.T) + TensorProduct(notgate, ket1*ket1.T)
ps = hadamardgate*ket0
ms = hadamardgate*ket1

U00 = sympy.Symbol("U00")
U01 = sympy.Symbol("U01")
U10 = sympy.Symbol("U10")
U11 = sympy.Symbol("U11")
U = Matrix([[U00, U01], [U10, U11]])




