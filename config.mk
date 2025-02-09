# surf version
VERSION = 2.1

# Customize below to fit your system

# paths
PREFIX = /usr
MANPREFIX = $(PREFIX)/share/man
LIBPREFIX = $(PREFIX)/lib
LIBDIR = $(LIBPREFIX)/surf

X11INC = `pkg-config --cflags x11`
X11LIB = `pkg-config --libs x11`

GTKINC = `pkg-config --cflags gtk+-3.0 gcr-3 webkit2gtk-4.1`
GTKLIB = `pkg-config --libs gtk+-3.0 gcr-3 webkit2gtk-4.1`
WEBEXTINC = `pkg-config --cflags webkit2gtk-4.1 webkit2gtk-web-extension-4.1 gio-2.0`
WEBEXTLIBS = `pkg-config --libs webkit2gtk-4.1 webkit2gtk-web-extension-4.1 gio-2.0`

# includes and libs
INCS = $(X11INC) $(GTKINC)
LIBS = $(X11LIB) $(GTKLIB) -lgthread-2.0

# flags from make.conf
BASE_FLAGS = -march=znver1 -O3
LTO_FLAGS = -flto
GRAPHITE_FLAGS = -fgraphite-identity -floop-nest-optimize

# compiler flags
CPPFLAGS = -DVERSION=\"$(VERSION)\" -DGCR_API_SUBJECT_TO_CHANGE \
           -DLIBPREFIX=\"$(LIBPREFIX)\" -DWEBEXTDIR=\"$(LIBDIR)\" \
           -D_DEFAULT_SOURCE
SURFCFLAGS = $(BASE_FLAGS) $(LTO_FLAGS) $(GRAPHITE_FLAGS) $(INCS) $(CPPFLAGS)
WEBEXTCFLAGS = $(BASE_FLAGS) $(LTO_FLAGS) $(GRAPHITE_FLAGS) $(WEBEXTINC)
CXXFLAGS = $(BASE_FLAGS) $(LTO_FLAGS) $(GRAPHITE_FLAGS)
LDFLAGS = $(LTO_FLAGS) -Wl,-O1 -Wl,--as-needed

# compiler
CC = gcc
