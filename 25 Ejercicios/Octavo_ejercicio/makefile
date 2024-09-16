ERLC = erlc
ERl = erl
SRC = reverso.erl
SRC1 = reverso
BEAM = reverso.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
