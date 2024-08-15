.DEFAULT_GOAL := build

init-build-folder:
	mkdir -p build/
	mkdir -p temp/

clean-temp:
	rm -rf temp/

get-mains:
	git clone https://github.com/zellij-org/zellij temp/zellij
	cp -r temp/zellij/zellij-utils/assets/themes/* build/

get-rose-pine:
	git clone https://github.com/rose-pine/zellij temp/rose-pine
	cp -r temp/rose-pine/dist/* build/

get-rebecca:
	git clone https://github.com/vic/zellij-rebecca-theme temp/rebecca
	cp -r temp/rebecca/rebecca.kdl build/ 

get-sobrio:
	git clone https://github.com/elvessousa/sobrio-zellij temp/sobrio
	cp -r temp/sobrio/sobrio.kdl build/

clean: clean-temp
	rm -rf build/

build: init-build-folder get-mains get-rose-pine get-rebecca get-sobrio clean-temp
