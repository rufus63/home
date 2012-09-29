TEMPLATE_SETUP?=${HOME}/home/template_setup
DOWNLOADS?=${HOME}/Downloads
SHARE?=${HOME}/share

build:: gitconfig

build:: $(addprefix ${SHARE}/,. python-mode.el-6.0.12)

${SHARE}/.:
	mkdir -p $@

%: ./%-template ${TEMPLATE_SETUP}
	python $< -i ${TEMPLATE_SETUP} > $@

${DOWNLOADS}/python-mode.el-6.0.12.tar.gz: 
	curl -L https://launchpad.net/python-mode/trunk/6.0.12/+download/$(@F) -o $@

${SHARE}/python-mode.el-6.0.12: ${DOWNLOADS}/python-mode.el-6.0.12.tar.gz
	tar xf $< -C $(@D)
