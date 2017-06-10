all:
	./build_scripts/get-sources.sh 2>&1 | tee get-sources.log
	./build_scripts/use_gcc48.sh
	./patches/file_attributes.sh
	./build_scripts/vm-build.sh > build.log 2>&1
	./build_scripts/vm-build32.sh > build32.log 2>&1
	./build_scripts/fix_scripts

install:
	mkdir -p $(DESTDIR)/usr/bin/
	./build_scripts/install.sh $(DESTDIR)
	./build_scripts/install32.sh $(DESTDIR)
