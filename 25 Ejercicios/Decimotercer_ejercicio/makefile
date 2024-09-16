ERLC = erlc
ERl = erl
SRC = dividir_cadena.erl
SRC1 = dividir_cadena
BEAM = dividir_cadena.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
