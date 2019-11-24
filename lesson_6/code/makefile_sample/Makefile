.SUFFIXES: .erl .beam

.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS = sample

all: compile
	${ERL} -pa '${HOME}/programing-erlang/lesson_6/code/makefile_sample' -s sample main

compile: ${MODS:%=%.beam}

clean:
	rm -rf *.beam erl_crash.dump
