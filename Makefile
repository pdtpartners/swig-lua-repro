# This makefile demonstrates differences between swig 2 and swig4

LUA      := /tmp/lua
LUALIB   := -llua

SWIG2    := /tmp/swig/swig2
SWIG4    := /tmp/swig/swig4

SWIG_W   := -w312,314,315,319,325,351,361,362,383,384,389,401,451,503,504,508,509

SWIG_I   += -I.

CC       := /opt/rh/devtoolset-8/root/bin/g++
CC_OPTS  := -g -fPIC
#CC_OPTS  += -DSWIGRUNTIME_DEBUG
INCLUDES := -I $(LUA)/include -I ./
LIBDIRS  := -L $(LUA)/lib -Wl,-rpath,$(LUA)/lib

mods  := $(wildcard *.i)
obj2  := $(patsubst %.i, swig2/%.o, $(mods))
obj4  := $(patsubst %.i, swig4/%.o, $(mods))

build: ; mkdir  swig2 swig4
clean: ; rm -rf swig2 swig4

lua2 : swig2/lua
lua4 : swig4/lua

fwd2: lua2; swig2/lua fwd.lua
fwd4: lua4; swig4/lua fwd.lua

dup2: lua2; swig2/lua dup.lua
dup4: lua4; swig4/lua dup.lua

all  : lua2 lua4

.PHONY : build clean all lua2 lua4
.PRECIOUS: swig2/%.cc swig4/%.cc

swig2/lua: $(obj2)
	$(CC) $(CC_OPTS) $(INCLUDES) $(LIBDIRS) $(LUALIB) -lm $(obj2) -o $@ main.1.cc

swig4/lua: $(obj4)
	$(CC) $(CC_OPTS) $(INCLUDES) $(LIBDIRS) $(LUALIB) -lm $(obj4) -o $@ main.1.cc

%.o: %.cc
	$(CC) $(CC_OPTS) $(INCLUDES) -c -o $@ $<

swig2/%.cc: %.i
	@$(SWIG2) -version | head -n 2 | tail -n 1
	$(SWIG2) $(SWIG_W) $(SWIG_I) -c++ -lua -o $@ $<
	sed -i '1s/^/#include <header.h>/' $@
	@if [ "${FIXNAMESPACE}" = '1' ]; then \
	  echo "Fixing namespace in $@";\
	  sed -i 's,"SWIG","$@",g' $@;\
	fi

swig4/%.cc: %.i
	@$(SWIG4) -version | head -n 2 | tail -n 1
	$(SWIG4) -c++ -lua -o $@ $<
	sed -i '1s/^/#include <header.h>/' $@
	@if [ "${FIXNAMESPACE}" = '1' ]; then \
	  echo "Fixing namespace in $@";\
	  sed -i 's,"SWIG","$@",g' $@;\
	fi

