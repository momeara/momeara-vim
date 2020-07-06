


install_emacs:
	wget http://mirrors.ibiblio.org/gnu/ftp/gnu/emacs/emacs-26.3.tar.gz
	tar xzvf emacs-26.3.tar.gz
	cd emacs-26.3 && \
		./configure \
			--prefix $(cd .. && pwd) \
			--with-gif=no \
			--with-tiff=no \
			--with-jpeg=no \
			--with-png=no \
			--with-rsvg=no
	cd emacs-26.3 && make && make install
	rm -rf emacs-26.4.tar.gz

setup_emacs:
	# remove the default ~/.emacs config
	echo "Removing default '~/.emacs' file"
	rm -rf ~/.emacs

	echo "Copying ~/.emacs/init.el"
	mkdir -p ~/.emacs.d
	cp .emacs.d/init.el ~/.emacs.d/

	# install packages
	emacs --script .emacs.d/install.el
