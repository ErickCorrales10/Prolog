ERLC = erlc
ERl = erl
SRC = celsius_fahrenheit.erl
SRC1 = celcius_fahrenheit
BEAM = celcius_fahrenheit.beam

compile:
	$(ERLC) $(SRC)

run: $(BEAM)
	erl -noshell -s $(SRC1) main -s init stop

all:	compile		run

clean:
	rm -f *.beam
