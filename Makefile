CXX=g++
OPTS=-O
LIBS=
CFLAGS=$(OPTS) -Wall
SRC=src

JSON_SRC=$(SRC)/json.cpp

ifeq ($(OS),Windows_NT)
	LIBS+=-lWs2_32
endif

all: wof unit_tests

wof: $(SRC)/ipaddr.cpp $(SRC)/wof.cpp $(JSON_SRC)
	$(CXX) $(CFLAGS) $^ $(LIBS) -o $@ -Wno-tautological-constant-out-of-range-compare

unit_tests: $(SRC)/ipaddr.cpp $(SRC)/unit_tests.cpp $(JSON_SRC)
	$(CXX) $(CFLAGS) $^ $(LIBS) -o $@ -Wno-tautological-constant-out-of-range-compare

clean:
	- rm -f wof wof.exe unit_tests unit_tests.exe
