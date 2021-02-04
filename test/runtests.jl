using qiskit
include("./test_declr.jl")


q_r=QuantumRegister(5)
c_r=ClassicalRegister(5)
q=QuantumCircuit(5)


H(q,2)
X(q,1)
Y(q,3)
Z(q,2)
S(q,1)
T(q,1)

CNOT(q,1,3)
CZ(q,2,3)
SWAP(q,2,3)

test_draw()

