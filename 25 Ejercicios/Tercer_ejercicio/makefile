ERLC = erlc
ERl = erl
SRC = suma.erl
SRC1 = suma
BEAM = suma.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
