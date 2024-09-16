ERLC = erlc
ERl = erl
SRC = concatenar.erl
SRC1 = concatenar
BEAM = concatenar.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
