.DEFAULT_GOAL := build

init-build-folder:
	mkdir -p build/
	mkdir -p temp/

clean-temp:
	rm -rf temp/

get-mains:
	git clone git@github.com:zellij-org/zellij.git temp/zellij
	cp -r temp/zellij/zellij-utils/assets/themes/* build/

get-rose-pine:
	git clone git@github.com:rose-pine/zellij.git temp/rose-pine
	cp -r temp/rose-pine/dist/* build/

get-rebecca:
	git clone git@github.com:vic/zellij-rebecca-theme.git temp/rebecca
	cp -r temp/rebecca/rebecca.kdl build/ 

get-sobrio:
	git clone git@github.com:elvessousa/sobrio-zellij.git temp/sobrio
	cp -r temp/sobrio/sobrio.kdl build/

clean: clean-temp
	rm -rf build/

build: init-build-folder get-mains get-rose-pine get-rebecca get-sobrio clean-temp
	
 


