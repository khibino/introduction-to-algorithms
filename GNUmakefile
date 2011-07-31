
ocamlc=ocamlc.opt

objs = \
	Show.cmo \
	ITARandom.cmo \
	Bit.cmo \
	e5_1_2.cmo \
	Heap.cmo \
	TestHeap.cmo

lib_cmas =

%.cmo: %.ml
	$(ocamlc) -g -c $<

%.byte: %.cmo $(objs)
	$(ocamlc) -g -o $@ $(objs) $(lib_cmas) $<

programs = \
	BitPlus.byte \
	BinSearch.byte \
	SelectionSort.byte \
	LinearSearch.byte \
	InsertionSort.byte \
	MergeSort.byte \
	MergeSort2.byte \
	BubbleSort.byte \
	e2_3_7.byte


all: $(objs) $(programs)

BinSearch.byte: Show.cmo BinSearch.cmo

e5_1_2.byte: ITARandom.cmo e5_1_2.cmo

scratch.cma: $(objs)
	ocamlc -a -o $@ $(lib_cmas) $^

clean:
	rm -f *.byte
	rm -f *.cmo *.cmi

rebuild: clean all
