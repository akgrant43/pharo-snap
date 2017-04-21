all:
	./get-sources.sh 2>&1 | tee get-sources.log
	./vm-build.sh > build.log 2>&1
	./vm-build32.sh > build32.log 2>&1
	./fix_scripts

install:
	mkdir -p $(DESTDIR)/usr/bin/
	./install.sh $(DESTDIR)
	./install32.sh $(DESTDIR)
