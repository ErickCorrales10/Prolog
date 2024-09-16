ERLC = erlc
ERl = erl
SRC = par_impar.erl
SRC1 = par_impar
BEAM = par_impar.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
