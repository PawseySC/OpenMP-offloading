CC=cc
F90=ftn
CFLAGS=-O3 -fopenmp
FFLAGS=-O3 -fopenmp
LIBS=
OBJ=laplace.o,laplacef.o
TARGET= laplace laplacef

all: $(TARGET)

laplace.o: laplace.c
	$(CC) $(CFLAGS) -c -o $@ $<

laplacef.o: laplace.f90
	$(F90) $(FFLAGS) -c -o $@ $<

laplace: laplace.o
	$(CC) $(CFLAGS) $(LIBS) -o $@ $^

laplacef: laplacef.o
	$(F90) $(FFLAGS) $(LIBS) -o $@ $^

clean:
	rm -f $(TARGET) *.o
