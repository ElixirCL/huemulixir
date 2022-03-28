.PHONY: install start

i install:
	mix deps.get

s start:
	iex -S mix
