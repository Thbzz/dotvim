CC	= gcc
AR	= ar
RM	= rm
CFLAGS	= -Wall -W -Werror -Wformat -Wmissing-braces -Wunreachable-code \
          -Wunused -Wunused-function -Wunused-parameter -Wunused-variable \
          -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes \
          -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wbad-function-cast \
          -Wcast-qual -Wcast-align -Waggregate-return -Wnested-externs -ansi \
          -pedantic
LDFLAGS	= -L. -L/usr/pkg/lib -lefence
ARFLAGS	= rsc
RMFLAGS = -rf
TARGET	= # FIXME
SOURCE	= # FIXME
OBJS	= $(SOURCE:.c=.o)
TODEL	= tags *~ .*.sw? \\\#*\\\# *.core

.PHONY: all clean distclean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) -c $<

clean: 
	$(RM) $(RMFLAGS) $(OBJS) $(TODEL)

distclean: clean
	$(RM) $(RMFLAGS) $(TARGET)
