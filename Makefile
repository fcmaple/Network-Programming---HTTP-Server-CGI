CXX=g++
CXXFLAGS=-std=c++17 -Wall -pedantic -pthread -lboost_system -g
CXX_INCLUDE_DIRS:=/usr/local/include
CXX_INCLUDE_PARAMS=$(addprefix -I , $(CXX_INCLUDE_DIRS))
CXX_LIB_DIRS=/usr/local/lib
CXX_LIB_PARAMS=$(addprefix -L , $(CXX_LIB_DIRS))

all:
	g++ server.cpp -o http_server -I /usr/local/include -L /usr/local/lib -std=c++17 -Wall -pedantic -pthread -lboost_system -g
	g++ console.cgi.cpp print_shell.cpp -o console.cgi -I /usr/local/include -L /usr/local/lib -std=c++17 -Wall -pedantic -pthread -lboost_system -g
clean:
	rm -f http_server *.cgi