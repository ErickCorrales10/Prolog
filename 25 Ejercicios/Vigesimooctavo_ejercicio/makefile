ERLC = erlc
ERl = erl
SRC = reemplazar.erl
SRC1 = reemplazar
BEAM = reemplazar.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
