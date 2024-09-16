ERLC = erlc
ERl = erl
SRC = generar_lista.erl
SRC1 = generar_lista
BEAM = generar_lista.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
