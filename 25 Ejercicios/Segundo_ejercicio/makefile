ERLC = erlc
ERl = erl
SRC = capturar.erl
SRC1 = capturar
BEAM = capturar.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
