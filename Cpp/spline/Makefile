all: main.o
	g++ main.o -o main.out -lboost_iostreams -lboost_system -lboost_filesystem

main.o: main.cpp
	g++ -c main.cpp

clean:
	rm *.o
