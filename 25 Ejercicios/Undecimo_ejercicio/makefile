ERLC = erlc
ERl = erl
SRC = suma_lista.erl
SRC1 = suma_lista
BEAM = suma_lista.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
