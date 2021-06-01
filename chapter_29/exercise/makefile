#cc 29-1.c -o 29-1 /usr/local/lib/liblua.a -ldl -lm
#cc 29-2.c -o 29-2 /usr/local/lib/liblua.a -ldl -lm
#cc 29-3.c -o 29-3 /usr/local/lib/liblua.a -ldl -lm
#cc 29-4.c -o 29-4 /usr/local/lib/liblua.a -ldl -lm
#cc 29-5.c -o 29-5 /usr/local/lib/liblua.a -ldl -lm
#cc 29-6.c -o 29-6.so -fPIC -shared
.PHONY:all clean
targets=29-1 29-2 29-3 29-4 29-5 29-6.so
objects=29-1.o 29-2.o 29-3.o 29-4.o 29-5.o 29-6.o
all:$(targets)

$(filter %.so,$(targets)):LDFLAGS=-fPIC -shared
$(filter %.so,$(targets)):$(filter 29-6%,$(objects))
	$(CC) $^ -o $@ $(LDFLAGS)
$(filter-out %.so,$(targets)):LDLIBS=/usr/local/lib/liblua.a -ldl -lm


clean:
	$(RM) $(targets) $(objects)
