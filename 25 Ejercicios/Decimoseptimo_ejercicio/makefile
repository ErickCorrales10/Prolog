ERLC = erlc
ERl = erl
SRC = comprobar.erl
SRC1 = comprobar
BEAM = comprobar.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
