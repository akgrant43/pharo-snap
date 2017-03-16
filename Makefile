all:
	curl get.pharo.org/60+vm | bash
	./fix_ld_path

install:
	mkdir -p $(DESTDIR)/usr/bin/
	cp -a pharo-ui $(DESTDIR)/usr/bin/
	cp -a pharo $(DESTDIR)/usr/bin/
	cp -a pharo-vm $(DESTDIR)/usr/bin/
	cp -a newvm $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/var/Pharo
	cp -a Pharo.image Pharo.changes $(DESTDIR)/var/Pharo/

