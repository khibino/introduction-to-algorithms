
ocamlc=ocamlc.opt

libs = \
	Show.cmo

%.cmo: %.ml
	$(ocamlc) -g -c $<

%.byte: %.cmo $(libs)
	$(ocamlc) -g -o $@ $(libs) $<

programs = \
	BitPlus.byte \
	BinSearch.byte \
	SelectionSort.byte \
	LinearSearch.byte \
	InsertionSort.byte \
	MergeSort.byte \
	MergeSort2.byte \
	BubbleSort.byte

all: $(programs)

BinSearch.byte: Show.cmo BinSearch.cmo

clean:
	rm -f *.byte
	rm -f *.cmo *.cmi

rebuild: clean all
