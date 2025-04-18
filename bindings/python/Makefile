# Python binding for Keystone engine. Nguyen Anh Quynh <aquynh@gmail.com>

ifndef BUILDDIR
OBJDIR = ./build
else
OBJDIR = $(abspath $(BUILDDIR))/obj/bindings/python
endif

# Get Python path from environment or use default
PYTHON_PATH ?= /opt/homebrew/bin/python3.11

.PHONY: gen_const install install3 clean

gen_const:
	cd .. && python const_generator.py python

install:
	rm -rf $(OBJDIR) src/
	rm -rf prebuilt/win64/keystone.dll
	rm -rf prebuilt/win32/keystone.dll
	if test -n "${DESTDIR}"; then \
		python setup.py build -b $(OBJDIR) install --root="${DESTDIR}"; \
	else \
		python setup.py build -b $(OBJDIR) install; \
	fi

install3:
	rm -rf $(OBJDIR) src/
	rm -rf prebuilt/win64/keystone.dll
	rm -rf prebuilt/win32/keystone.dll
	if test -n "${DESTDIR}"; then \
		python3 setup.py build -b $(OBJDIR) install --root="${DESTDIR}"; \
	else \
		python3 setup.py build -b $(OBJDIR) install; \
	fi

# build & upload PyPi package with source code of the core
sdist:
	rm -rf src/ dist/
	rm -rf prebuilt/win64/keystone.dll
	rm -rf prebuilt/win32/keystone.dll
	cp README.pypi-src README
	cp PKG-INFO.src PKG-INFO
	python setup.py sdist register upload

# build & upload PyPi package with source code of the core
sdist3:
	rm -rf src/ dist/
	rm -rf prebuilt/win64/keystone.dll
	rm -rf prebuilt/win32/keystone.dll
	cp README.pypi-src README
	cp PKG-INFO.src PKG-INFO
	python3 setup.py sdist register upload

# build & upload PyPi package with prebuilt core
# NOTE: be sure to have precompiled core under prebuilt/win*/ beforehand
sdist_win:
	rm -rf src/ dist/
	cp README.pypi-win README
	cp PKG-INFO.win PKG-INFO
	python setup.py sdist register upload

# build & upload PyPi package with prebuilt core
# NOTE: be sure to have precompiled core under prebuilt/win*/ beforehand
sdist3_win:
	rm -rf src/ dist/
	cp README.pypi-win README
	cp PKG-INFO.win PKG-INFO
	python3 setup.py sdist register upload

clean:
	rm -rf $(OBJDIR) src/ dist/ README
	rm -f keystone/*.so
	rm -rf prebuilt/win64/keystone.dll
	rm -rf prebuilt/win32/keystone.dll


SAMPLES = sample_arm.py sample_arm64.py sample_mips.py
SAMPLES += sample_sparc.py sample_m68k.py sample_x86.py
check:
	@for t in $(SAMPLES); do \
		echo Check $$t ... ; \
		./$$t > /dev/null && echo OK || echo FAILED; \
	done

# Build wheel package
wheel:
	rm -rf $(OBJDIR) src/ dist/
	rm -rf prebuilt/win64/keystone.dll
	rm -rf prebuilt/win32/keystone.dll
	$(PYTHON_PATH) setup.py bdist_wheel

# Build wheel package with Python3
wheel3:
	rm -rf $(OBJDIR) src/ dist/
	python3 setup.py bdist_wheel

