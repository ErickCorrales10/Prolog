ERLC = erlc
ERl = erl
SRC = maximo.erl
SRC1 = maximo
BEAM = maximo.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
