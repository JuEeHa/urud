PYTHON ?= python3

GENERATED = grammar.py

all: $(GENERATED)

grammar.py: grammar.ebnf
	$(PYTHON) -m grako $< > $@

.PHONY: all test install_requirements clean

test: grammar.py test.urud
	$(PYTHON) grammar.py test.urud

clean:
	rm $(GENERATED)
