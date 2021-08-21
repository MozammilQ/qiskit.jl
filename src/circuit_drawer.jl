
function draw_qcir(circ::q_circ)::Scene
	
	circl_x_offset=5
	circl_y_offset=10
	rec_x_offset=-10
	rec_y_offset=0
	gbl_offset=45
	x_offset=44
	y_offset=31
	num_q=length(circ.circ_q_regs.q_regs)
	num_oper=length(circ.oper_list)
     
        oper_per_g=[[[:nop] for i in 1:num_oper] for j in 1:num_q]
        
        for i in 1:num_oper
                
                operat::Symbol=circ.oper_list[i][1]
                q_n::Int64=circ.oper_list[i][2]

                if(operat==:cnot)
			for j in 1:num_oper
				if oper_per_g[q_n][j]==[:nop]
					oper_per_g[q_n][j]=[:cnot,Symbol(circ.oper_list[i][3])]

					for k in q_n+1:circ.oper_list[i][3]
						insert!(oper_per_g[k],j,[:blk])
					end
					break
				end
			end
		else
			for j in 1:num_oper
	                        if oper_per_g[q_n][j]==[:nop]
	                                oper_per_g[q_n][j]=[operat]
	                                break
	                        end
	                end
		end
        end


	for i in 1:num_q
		for j in num_oper:-1:1
			if j==1 && oper_per_g[i][1][1]==:nop
				oper_per_g[i]=[]
			elseif !(oper_per_g[i][j][1]==:nop)
				oper_per_g[i]=oper_per_g[i][1:j]
				break
			end
		end
	end

	oper_per_g

	res_x=gbl_offset + ((maximum([length(oper_per_g[i]) for i in 1:num_q])+1) * 42)
	res_y=gbl_offset + (num_q*30) + (circ.measured ? 60 : 0)
	
	scene = Scene(raw = true,resolution=(res_x,res_y), camera = campixel!)
	qiskit.draw_qubits(scene,num_q,res_x,res_y)
	circ.measured ? qiskit.draw_classical_lines(scene,1,res_x) : nothing

	
	for i in 1:num_q
		j=1
		counter=0
		while(j<=length(oper_per_g[i]))
			oper::Symbol=oper_per_g[i][j][1]

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
				qiskit.draw_CNOT(scene,gbl_offset+(counter*x_offset)+circl_x_offset,res_y-gbl_offset-((i-1)* y_offset)+circl_y_offset, parse(Int,string(oper_per_g[i][j][2]))-i)
	
			elseif(oper==:ch)
				qiskit.draw_cH(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))

			elseif(oper==:swap)
				qiskit.draw_swap(scene,gbl_offset+(counter*x_offset),res_y-gbl_offset-((i-1)* y_offset))
			end
		
			j+=1
			counter+=1

		end
	end
	return scene
end

export draw_qcir
