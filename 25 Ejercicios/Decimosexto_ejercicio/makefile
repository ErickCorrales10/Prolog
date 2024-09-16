ERLC = erlc
ERl = erl
SRC = mapear.erl
SRC1 = mapear
BEAM = mapear.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
