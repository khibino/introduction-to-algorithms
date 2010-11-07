
ocamlc=ocamlc.opt

%.cmo: %.ml
	$(ocamlc) -g -c $<

%.byte: %.cmo
	$(ocamlc) -g -o $@ $<

programs = \
	InsertionSort.byte \
	MergeSort.byte \
	MergeSort2.byte

all: $(programs)

clean:
	rm -f *.byte
	rm -f *.cmo *.cmi

rebuild: clean all
