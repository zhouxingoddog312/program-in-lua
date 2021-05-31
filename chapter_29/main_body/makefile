#gcc page348.c -fPIC -shared -o mylib.so
#gcc page342.c -o page342 /usr/local/lib/liblua.a -ldl -lm
#gcc page343.c -o page343 /usr/local/lib/liblua.a -ldl -lm

objects=page348.o page342.o page343.o
targets=mylib.so page342 page343
all:$(targets)

$(filter %.so,$(targets)):LDFLAGS=-shared
$(filter page348%,$(objects)):CFLAGS=-fPIC
$(filter %.so,$(targets)):$(filter page348%,$(objects))
	$(CC) $(filter page348%,$(objects)) -o $(filter %.so,$(targets)) $(LDFLAGS)

$(filter page%,$(targets)):LDLIBS=/usr/local/lib/liblua.a -ldl -lm

.PHONY:cleanall cleantargets cleanobjects

cleanall:cleantargets cleanobjects

cleantargets:
	$(RM) $(targets)

cleanobjects:
	$(RM) $(objects)
