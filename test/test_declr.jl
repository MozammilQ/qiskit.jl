using Makie
function test_draw()::Scene
        res_x=1840;  # 1920 - 80
	res_y=1000;  # 1080 - 80
	scene = Scene(raw = true,resolution=(res_x,res_y), camera = campixel!)
	scene=qiskit.draw_qubits(scene,31,res_x, res_y)

	scene=qiskit.draw_Rx(scene,70,res_y-17-(1*30))
	scene=qiskit.draw_Ry(scene,70,res_y-17-(9*30))
	scene=qiskit.draw_Rz(scene,70,res_y-17-(2*30))

	scene=qiskit.draw_U1(scene,70,res_y-17-(4*30))
	scene=qiskit.draw_U2(scene,70,res_y-17-(13*30))
	scene=qiskit.draw_U3(scene,70,res_y-17-(5*30))

	scene=qiskit.draw_H(scene,70,res_y-17-(8*30))
	scene=qiskit.draw_T(scene,70,res_y-17-(3*30))
	scene=qiskit.draw_Z(scene,70,res_y-17-(6*30))
	scene=qiskit.draw_S(scene,70,res_y-17-(10*30))
	scene=qiskit.draw_X(scene,70,res_y-17-(14*30))
	scene=qiskit.draw_cH(scene,70,res_y-17-(15*30))
	
	scene=qiskit.draw_T_dag(scene,70,res_y-17-(11*30))

	scene=qiskit.draw_S_dag(scene,70,res_y-17-(12*30))
	scene=qiskit.draw_cRz(scene,70,res_y-17-(7*30))

	scene=qiskit.draw_measure(scene,440,res_y-17-(16*30))
	
	scene=qiskit.draw_CNOT(scene,70,res_y-665,5)

	scene=qiskit.draw_qubit_barrier(scene,1,240, res_y)
	scene=qiskit.draw_classical_lines(scene,1, res_x)
	return scene
end

