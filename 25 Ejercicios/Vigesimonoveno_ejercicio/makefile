ERLC = erlc
ERl = erl
SRC = ordenar_tuplas.erl
SRC1 = ordenar_tuplas
BEAM = ordenar_tuplas.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
