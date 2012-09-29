TEMPLATE_SETUP?=${HOME}/home/template_setup

build:: gitconfig

%: ./%-template ${TEMPLATE_SETUP}
	python $< -i ${TEMPLATE_SETUP} > $@
