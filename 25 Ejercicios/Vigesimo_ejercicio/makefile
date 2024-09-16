ERLC = erlc
ERl = erl
SRC = ocurrencias.erl
SRC1 = ocurrencias
BEAM = ocurrencias.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
