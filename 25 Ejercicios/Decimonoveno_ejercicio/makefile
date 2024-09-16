ERLC = erlc
ERl = erl
SRC = convertir2.erl
SRC1 = convertir2
BEAM = convertir2.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
