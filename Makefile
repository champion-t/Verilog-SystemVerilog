all: compile run view

compile:
	iverilog design.v tb.v
run:
	./a.out
view:
	gtkwave design.vcd