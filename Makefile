BUNDLE = "<<PlugName>>.lv2"
INSTALL_DIR = /usr/lib/lv2/
BUILD_DIR=../build/$(BUNDLE)

$(BUNDLE): manifest.ttl <<PlugName>>.ttl <<PlugName>>.so
	rm -rf $(BUNDLE)
	mkdir $(BUNDLE)
	cp manifest.ttl <<PlugName>>.ttl <<PlugName>>.so $(BUNDLE)
	rm <<PlugName>>.so

<<PlugName>>.so: <<PlugName>>.c
	gcc -c -g -fpic <<PlugName>>.c
	gcc -shared -o <<PlugName>>.so <<PlugName>>.o
	rm <<PlugName>>.o

install:
	mkdir -p $(INSTALL_DIR)
	rm -rf $(INSTALL_DIR)$(BUNDLE)
	cp -R $(BUILD_DIR) $(INSTALL_DIR)

uninstall:
	rm -rf $(INSTALL_DIR)$(BUNDLE)

clean:
	rm -rf $(BUNDLE) <<PlugName>>.so
