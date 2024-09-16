ERLC = erlc
ERl = erl
SRC = holamundo.erl
SRC1 = holamundo
BEAM = holamundo.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
