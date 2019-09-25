SYSTEMC=/usr/local/systemc-2.3.0
SYSTEMC_LIB=$(firstword $(wildcard $(SYSTEMC)/lib*))

.PHONY: all clean 

all: tlm2_1 tlm2_2 tlm2_3

clean:
	rm -fr *.x

tlm2_1:
	@echo "\n###Compiling tlm2_getting_started_1.cpp"
	g++ -O0 -g -ggdb -Wno-deprecated \
		-DDEBUG_SYSTEMC \
		-I./ -I$(SYSTEMC)/include \
		tlm2_getting_started_1.cpp \
		-o tlm2_1.x \
		-L$(SYSTEMC_LIB) -lsystemc
	LD_LIBRARY_PATH=$(SYSTEMC_LIB):$(LD_LIBRARY_PATH) ./tlm2_1.x

tlm2_2: #add "-DINJECT_ERROR" to see error report
	@echo "\n###Compiling tlm2_getting_started_2.cpp"
	g++ -O0 -g -ggdb -Wno-deprecated \
		-DDEBUG_SYSTEMC \
		-I./ -I$(SYSTEMC)/include \
		tlm2_getting_started_2.cpp \
		-o tlm2_2.x \
		-L$(SYSTEMC_LIB) -lsystemc
	LD_LIBRARY_PATH=$(SYSTEMC_LIB):$(LD_LIBRARY_PATH) ./tlm2_2.x

tlm2_3: #add "-DINJECT_ERROR" to see error report
	@echo "\n###Compiling tlm2_getting_started_3.cpp"
	g++ -O0 -g -ggdb -Wno-deprecated \
		-DDEBUG_SYSTEMC \
		-I./ -I$(SYSTEMC)/include \
		tlm2_getting_started_3.cpp \
		-o tlm2_3.x \
		-L$(SYSTEMC_LIB) -lsystemc
	LD_LIBRARY_PATH=$(SYSTEMC_LIB):$(LD_LIBRARY_PATH) ./tlm2_3.x
