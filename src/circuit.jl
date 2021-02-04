
struct q_reg_list
	q_regs::Array{Int64,1}
	q_regs_names::Array{String,1}
end

struct c_reg_list
	c_regs::Array{Int64,1}
end

struct oper
	oper::Array{Any,1}
end

mutable struct q_circ
	circ_q_regs::q_reg_list
	oper_list::Array{Array{Any,1},1}
	circ_c_regs::c_reg_list
end

QuantumRegister(num_regs::Int64)::q_reg_list=q_reg_list([i for i in 1:num_regs],[])

QuantumRegister(num_regs::Int64,names::Array{String,1})::q_reg_list=q_reg_list([i for i in 1:num_regs],names)

QuantumRegister(num_regs::Int64,name::String)::q_reg_list=q_reg_list([1],[name])

ClassicalRegister(num_regs::Int64)::c_reg_list=c_reg_list([i for i in 1:num_regs])

QuantumCircuit(num_regs::Int64)::q_circ=q_circ( q_reg_list([i for i in 1:num_regs],[]),[] ,c_reg_list([i for i in 1:num_regs],))

H(circ::q_circ,g_num::Int64)=append!(circ.oper_list,[[:h,g_num]])

CNOT(circ::q_circ,from_g::Int64,to_g::Int64)=append!(circ.oper_list,[[:cnot,from_g,to_g]])

CZ(circ::q_circ,from_g::Int64,to_g::Int64)=append!(circ.oper_list,[[:cz,from_g,to_g]])

SWAP(circ::q_circ,from_g::Int64,to_g::Int64)=append!(circ.oper_list,[[:swap,from_g,to_g]])

X(circ::q_circ,g_num::Int64)=append!(circ.oper_list,[[:x,g_num]])

Y(circ::q_circ,g_num::Int64)=append!(circ.oper_list,[[:y,g_num]])

Z(circ::q_circ,g_num::Int64)=append!(circ.oper_list,[[:z,g_num]])

S(circ::q_circ,g_num::Int64)=append!(circ.oper_list,[[:s,g_num]])

T(circ::q_circ,g_num::Int64)=append!(circ.oper_list,[[:t,g_num]])



#import Base: +
#+(q_regs::q_reg_list, c_regs::c_reg_list)::q_circ=q_circ(q_regs, c_regs)

export QuantumRegister,ClassicalRegister,QuantumCircuit,H,CNOT,CZ,SWAP,X,Y,Z,S,T

