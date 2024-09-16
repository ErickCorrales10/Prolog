ERLC = erlc
ERl = erl
SRC = producto.erl
SRC1 = producto
BEAM = producto.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
