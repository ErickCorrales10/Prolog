ERLC = erlc
ERl = erl
SRC = convertir.erl
SRC1 = convertir
BEAM = convertir.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
