


function parll_untry(oper_matx_sym::Array{Array,1},1})::Array{Complex{Float64},2}
	mat=[ [1 0];[0 1] ]
	for i in 1:length(oper_matx_sym)
		sym::Symbol=oper_matx_sym[i][1]
		if sym==:rx
			mat*=[  []  []  ]
		elseif sym=:ry
			mat*=[  []  []  ]
		elseif sym=:rz
			mat*=[  []  []  ]
		elseif sym=:u1
			mat*=[  []  []  ]
		elseif sym=:u2
			mat*=[  []  []  ]
		elseif sym=:u3
			mat*=[  []  []  ]
		elseif sym=:h
			mat*=sqrt(2).*[  [1 1] ; [1 -1] ]
		elseif sym=:t
			mat*=[  [1 0] ;  [0 exp((im*pi)/4)]  ]
		elseif sym=:z
			mat*=[  [1 0];  [0 -1]  ]
		elseif sym=:s
			mat*=[  [1 0] ;  [0 im]  ]
		elseif sym=:x
			mat*=[  [0 1] ;  [1 0]  ]
		elseif sym=:tdag
			mat*=[]
		elseif sym=:sdag
			mat*=[]
		end
	end
end

using Kronecker
mat=[[1 0];[0 1]]
for i in 1:num_q
	for j in 1:length(oper_per_g[i])
			mat*=ser_untry(oper_per_g[i][1:j-1])
	end
end


f_untry=mat[1]
for i in 2:length(mat)
	f_untry=kronecker(f_untry,mat[i])
end

