PLUGINS = 	adv_benc.so \
		adv_epg.so \
		adv_fbcf.so \
		adv_ffcf.so \
		adv_pareq.so \
		adv_sap.so

FAUST =	faust -a ladspa.cpp
INCLUDES = -I.
LIBRARIES = -ldl -lm
CFLAGS = $(INCLUDES) -Wall -Werror -O3 -fPIC
CXXFLAGS = $(CFLAGS)
CPP = g++

%.cpp:	%.dsp adverb.lib ladspa.cpp
	$(FAUST) -o $*.cpp $*.dsp	

%.o:	%.cpp
	$(CPP) $(CXXFLAGS) -o $*.o -c $*.cpp

%.so:	%.o
	$(CPP) -o $*.so $*.o -shared

all:	$(PLUGINS)
