all:
	./try-build.sh > build.log 2>&1
	./fix_scripts

install:
	env
	mkdir -p $(DESTDIR)/usr/bin/
	cp -a pharo-ui $(DESTDIR)/usr/bin/
	cp -a pharo $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/usr/bin/pharo-vm
	cp -a pharo-vm/opensmalltalk-vm/products/phcogspurlinuxht/lib/pharo/5.0-/* $(DESTDIR)/usr/bin/pharo-vm/
	cp -a cleanvm $(DESTDIR)/usr/bin/
	cp -a getvm $(DESTDIR)/usr/bin/
	cp -a CONFIG $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/var/Pharo
	cp -a Pharo.image Pharo.changes $(DESTDIR)/var/Pharo/

