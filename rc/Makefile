TEMPLATE_SETUP?=${HOME}/.template-setup

build:: gitconfig

%: ./%-template ${TEMPLATE_SETUP}
	python $< -i ${TEMPLATE_SETUP} > $@
