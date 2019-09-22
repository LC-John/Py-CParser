all: 
	(cd lib; make)
	cp lib/parser ./parser

clean:
	(cd lib; make clean)
	rm parser