all:
	curl get.pharo.org/60+vmT | bash
	./fix_scripts

install:
	mkdir -p $(DESTDIR)/usr/bin/
	cp -a pharo-ui $(DESTDIR)/usr/bin/
	cp -a pharo $(DESTDIR)/usr/bin/
	cp -a pharo-vm $(DESTDIR)/usr/bin/
	cp -a cleanvm $(DESTDIR)/usr/bin/
	cp -a getvm $(DESTDIR)/usr/bin/
	cp -a CONFIG $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/var/Pharo
	cp -a Pharo.image Pharo.changes $(DESTDIR)/var/Pharo/

