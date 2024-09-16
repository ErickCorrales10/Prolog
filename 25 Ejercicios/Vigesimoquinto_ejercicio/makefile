ERLC = erlc
ERl = erl
SRC = iterate.erl
SRC1 = iterate
BEAM = iterate.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
