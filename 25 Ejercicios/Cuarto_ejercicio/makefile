ERLC = erlc
ERl = erl
SRC = factorial.erl
SRC1 = factorial
BEAM = factorial.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
