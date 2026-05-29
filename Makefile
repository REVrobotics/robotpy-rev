$(info --- This MUST be run from a Developer Powershell for VS ---)

# .PHONY tells make these aren't files, but command names
.PHONY: all fix build tests

# Default target when you just type 'make'
all: build tests

# Delete stale Meson cache
fix:
	powershell.exe -NoProfile -Command "Remove-Item -Recurse -Force build\cp313"

# build revlib python bindings
build:
	py -m pip install -v -e .

# run tests
tests:
	py -m pytest tests/ -v 2>&1

