ERLC = erlc
ERl = erl
SRC = eliminar_duplicados.erl
SRC1 = eliminar_duplicados
BEAM = eliminar_duplicados.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
