ERLC = erlc
ERl = erl
SRC = remove_item.erl
SRC1 = remove_item
BEAM = remove_item.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
