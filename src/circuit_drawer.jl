
function draw_qcir(circ::q_circ)
	
	circl_x_offset=5
	circl_y_offset=10
	rec_x_offset=-10
	rec_y_offset=0
	gbl_offset=45
	x_offset=44
	y_offset=31
	num_q=length(circ.circ_q_regs.q_regs)
	res_y=gbl_offset + (num_q*30)
	num_opr=length(circ.oper_list)
	res_x=gbl_offset + ((num_opr+1) * 42)
	using Makie
	scene = Scene(raw = true,resolution=(res_x,res_y), camera = campixel!)
	qiskit.draw_qubits(scene,num_q,res_x,res_y)
	measured=false
	if(measured)
		qiskit.draw_classical_lines(scene,1,res_x)
	end
	oper_per_g=[[] for i in 1:1:num_q]
	for i in 1:1:num_opr
		oper::Symbol=circ.oper_list[i][1]
		if(oper==:cnot)
			append!(oper_per_g[circ.oper_list[i][2]],[:cnot,circ.oper_list[i][3]])
			append!(oper_per_g[circ.oper_list[i][3]],[:cnott])
		else
			append!(oper_per_g[circ.oper_list[i][2]],[oper])
		end
	end

	for i in 1:num_q
		for j in 1:length(oper_per_g[i])
			oper::Symbol=oper_per_g[i][j]
			if(oper==:h)
				qiskit.draw_H(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)*y_offset))
			elseif(oper==:rx)
				qiskit.draw_Rx(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)*y_offset))
			elseif(oper==:rz)
				qiskit.draw_Rz(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:t)
				qiskit.draw_T(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:u1)
				qiskit.draw_U1(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:u3)
				qiskit.draw_U3(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:z)
				qiskit.draw_Z(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:crz)
				qiskit.draw_cRz(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:ry)
				qiskit.draw_Ry(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:s)
				qiskit.draw_S(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:tdag)
				qiskit.draw_T_dag(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:sdag)
				qiskit.draw_S_dag(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:u2)
				qiskit.draw_U2(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:x)
				qiskit.draw_X(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:ch)
				qiskit.draw_cH(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:cnot)
				qiskit.draw_CNOT(scene,gbl_offset+((j-1)*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			end
		end
	end
end
