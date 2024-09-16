ERLC = erlc
ERl = erl
SRC = ordenar.erl
SRC1 = ordenar
BEAM = ordenar.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
