.PHONY:all clean
targets=30-1 30-2 30-3 30-4.so 30-5.so
libobjects=30-4.o 30-5.o
objects=30-1.o 30-2.o 30-3.o 30-4.o 30-5.o
all:$(targets)

$(filter %.so,$(targets)):LDFLAGS=-fPIC -shared
$(word 4,$(targets)):$(word 1,$(libobjects))
	$(CC) $^ -o $@ $(LDFLAGS)
$(word 5,$(targets)):$(word 2,$(libobjects))
	$(CC) $^ -o $@ $(LDFLAGS)
$(filter-out %.so,$(targets)):LDLIBS=/usr/local/lib/liblua.a -ldl -lm


clean:
	$(RM) $(targets) $(objects)
