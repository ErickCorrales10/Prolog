ERLC = erlc
ERl = erl
SRC = holamundo.erl
BEAN = holamundo.beam

all: compile run

compile:
	$(ERLC) $(SRC)

run: compile
	$(ERL) -noshell -s holamundo start -s init stop

clean:
	rm -f *.beam