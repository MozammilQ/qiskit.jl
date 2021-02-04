
function draw_T(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 21, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "T", align = (:left, :center), position= (pos_x+6, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_H(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 21, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "H", align = (:left, :center), position= (pos_x+5, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_CNOT(scene::Scene,pos_x::Int64,pos_y::Int64,num_qu::Int64)::Scene
	linesegments!(scene , [Point2f0(pos_x,pos_y+6) => Point2f0(pos_x,pos_y-(num_qu*30))], color = :lightgreen, linewidth = 4)
	poly!(scene, decompose(Point2f0, Circle(Point2f0(pos_x,pos_y), 4f0)), color=:lightgreen, strokewidth=1, strokecolor=:black)
	poly!(scene, decompose(Point2f0, Circle(Point2f0(pos_x,pos_y-(num_qu*30)), 11f0)), color=:lightgreen, strokewidth=1, strokecolor=:black)
	text!(scene, "+", align=(:left, :center), position=(pos_x-7,1+pos_y-(num_qu*30)), textsize=15, linewidth=10)
	return scene
end

function draw_S(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 21, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "S", align = (:left, :center), position= (pos_x+6, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_X(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x::Int64, pos_y , 21, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "X", align = (:left, :center), position= (pos_x+5, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_Z(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 21, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "Z", align = (:left, :center), position= (pos_x+5, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_U1(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "U1", align = (:left, :center), position= (pos_x+4, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_U2(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "U2", align = (:left, :center), position= (pos_x+4, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_U3(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "U3", align = (:left, :center), position= (pos_x+4, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_Rx(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "Rx", align = (:left, :center), position= (pos_x+4, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_Ry(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "Ry", align = (:left, :center), position= (pos_x+4, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_Rz(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "Rz", align = (:left, :center), position= (pos_x+4, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_T_dag(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "T", align = (:left, :center), position= (pos_x+6, pos_y+11), textsize=15, linewidth=10)
	text!(scene, "+", align = (:left, :center), position= (pos_x+17, pos_y+14), textsize=9, linewidth=29)
	text!(scene, "|", align = (:left, :center), position= (pos_x+20, pos_y+12), textsize=6, linewidth=4, color=:black)
	return scene
end

function draw_S_dag(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "S", align = (:left, :center), position= (pos_x+6, pos_y+11), textsize=15, linewidth=10)
	text!(scene, "+", align = (:left, :center), position= (pos_x+17, pos_y+14), textsize=9, linewidth=29)
	text!(scene, "|", align = (:left, :center), position= (pos_x+20, pos_y+12), textsize=6, linewidth=4, color=:black)
	return scene
end

function draw_cH(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 28, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "cH", align = (:left, :center), position= (pos_x+4, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_cRz(scene::Scene, pos_x::Int64, pos_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, pos_y , 32, 21), color= :lightgreen, strokecolor= :black, strokewidth=1)
	text!(scene, "cRz", align = (:left, :center), position= (pos_x+2, pos_y+11), textsize=15, linewidth=10)
	return scene
end

function draw_qubits(scene::Scene, num::Int64, res_x::Int64, res_y::Int64)::Scene
	scene=draw_qubit_lines(scene, num, res_x, res_y)
	for i in 0:num-1
		text!(scene, "q", align = (:left, :center), position = (10, res_y-30-(i*30)), textsize=15)
		text!(scene, string(i), align = (:left, :center), position = (23, res_y-40-(i*30)), textsize=11)
	end
	return scene
end

function draw_qubit_lines(scene::Scene,num::Int64, res_x::Int64, res_y::Int64)::Scene
	for i in 0:num-1
		linesegments!(scene , [Point2f0(37+(6*floor(i/10)), res_y-35-(i*30)) => Point2f0(res_x-20, res_y-35-(i*30))], color = :black, linewidth = 2)
	end
	return scene
end

function draw_measure_lines(scene::Scene,pos_x::Int64,pos_y::Int64)::Scene
	linesegments!(scene , [Point2f0(pos_x + 8, pos_y) => Point2f0(pos_x +10, 36)], color = :gray, linewidth = 2)
	linesegments!(scene , [Point2f0(pos_x + 8 + 5, pos_y) => Point2f0(pos_x +10 + 4,36)], color = :gray, linewidth = 2)
	text!(scene, "v", align = (:left, :center), position = (pos_x-5 + 8, 7+ 36), textsize=27, color=:gray)
	poly!(scene, FRect2D(pos_x + 8, 4+ 36, 5, 5), color= :gray)
	return scene
end

function draw_measure(scene::Scene,pos_x::Int64,pos_y::Int64)::Scene
    scene=draw_measure_lines(scene,pos_x,pos_y)
    poly!(scene, FRect2D(pos_x, pos_y , 22, 22), color= :black)
    poly!(scene, decompose(Point2f0, Circle(Point2f0(pos_x+11,pos_y+8), 7f0)), color=:black, strokewidth=2, strokecolor=:white)
    linesegments!(scene , [Point2f0(pos_x+11, pos_y+9) => Point2f0(pos_x+19, pos_y+17)], color = :white, linewidth = 2)
	poly!(scene, FRect2D(pos_x, pos_y , 22, 8), color= :black)
	return scene
end

function draw_classical_lines(scene::Scene, num_measures::Int64, res_x::Int64)::Scene
	text!(scene, "c", align = (:left, :center), position = (20, 35), textsize=16)
	text!(scene, string(num_measures), align = (:left, :center), position = (floor(res_x/10)+16, 44), textsize=13)
	linesegments!(scene , [Point2f0(37, 35) => Point2f0(res_x-20, 35)], color = :gray, linewidth = 2)
	linesegments!(scene , [Point2f0(37, 30) => Point2f0(res_x-20, 30)], color = :gray, linewidth = 2)
	linesegments!(scene , [Point2f0(floor(res_x/10) +20 , 23) => Point2f0(floor(res_x/10) + 10 +20 , 42)], color = :gray, linewidth = 2)
	return scene
end

function draw_qubit_barrier(scene::Scene, num_qubit::Int64, pos_x::Int64, res_y::Int64)::Scene
	poly!(scene, FRect2D(pos_x, 50 , 10, res_y -  75), color= :gray, strokecolor= :gray, strokewidth=0.5)
	linesegments!(scene , [Point2f0(pos_x+5, 55 ) => Point2f0(pos_x+5, res_y - 30 )], color = :black, linewidth = 2, linestyle=:dash)
	return scene
end

