
function draw_qcir(circ::q_circ)
	
	circl_x_offset=5
	circl_y_offset=10
	rec_x_offset=-10
	rec_y_offset=0
	gbl_offset=45
	x_offset=44
	y_offset=31
	num_q=length(circ.circ_q_regs.q_regs)
	num_opr=length(circ.oper_list)
	oper_per_g=[[] for i in 1:1:num_q]

	for i in 1:1:num_opr
		oper::Symbol=circ.oper_list[i][1]
		if(oper==:cnot)
			append!(oper_per_g[circ.oper_list[i][2]],[:cnot,circ.oper_list[i][3]])

			for j in circ.oper_list[i][2]+1:1:circ.oper_list[i][3]-1
				append!(oper_per_g[j],[:cnotp])
			end

			append!(oper_per_g[circ.oper_list[i][3]],[:cnott])
		else
			append!(oper_per_g[circ.oper_list[i][2]],[oper])
		end
	end

	res_x=gbl_offset + ((maximum([length(oper_per_g[i]) for i in 1:num_q])+1) * 42)
	res_y=gbl_offset + (num_q*30) + (circ.measured ? 60 : 0)
	
	using Makie
	scene = Scene(raw = true,resolution=(res_x,res_y), camera = campixel!)
	qiskit.draw_qubits(scene,num_q,res_x,res_y)
	circ.measured ? qiskit.draw_classical_lines(scene,1,res_x) : nothing

	
	for i in 1:num_q
		j=1
		counter=0
		while(j<=length(oper_per_g[i]))
			oper::Symbol=oper_per_g[i][j]

			if(oper==:rx)
				qiskit.draw_Rx(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)*y_offset))
			elseif(oper==:ry)
				qiskit.draw_Ry(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)*y_offset))
			elseif(oper==:rz)
				qiskit.draw_Rz(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:u1)
				qiskit.draw_U1(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:u2)
				qiskit.draw_U2(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:u3)
				qiskit.draw_U3(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:h)
				qiskit.draw_H(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:t)
				qiskit.draw_T(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:z)
				qiskit.draw_Z(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:s)
				qiskit.draw_S(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:x)
				qiskit.draw_X(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:tdag)
				qiskit.draw_T_dag(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			elseif(oper==:sdag)
				qiskit.draw_S_dag(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
	

			elseif(oper==:crz)
				qiskit.draw_cRz(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
		
			elseif(oper==:cnot)
				qiskit.draw_CNOT(scene,gbl_offset+(counter*x_offset)+circl_x_offset,res_y-gbl_offset-((i-1)* y_offset)+circl_y_offset, oper_per_g[i][j+1]-i)
				j+=1
	
			elseif(oper==:ch)
				qiskit.draw_cH(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))

			elseif(oper==:swap)
				qiskit.draw_swap(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			end
		
			j+=1
			counter+=1

		end
	end






end

