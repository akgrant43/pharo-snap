all:
	curl get.pharo.org/vmLatest60 | bash
	./fix_ld_path

install:
	cp -a pharo-ui $(DESTDIR)/usr/bin/
	cp -a pharo $(DESTDIR)/usr/bin/
	cp -a pharo-vm $(DESTDIR)/usr/bin/

