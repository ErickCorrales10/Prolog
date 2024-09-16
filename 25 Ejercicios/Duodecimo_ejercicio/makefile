ERLC = erlc
ERl = erl
SRC = filtrar.erl
SRC1 = filtrar
BEAM = filtrar.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
