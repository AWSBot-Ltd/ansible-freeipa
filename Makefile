DATE = $(shell date)
HOSTNAME = $(shell hostname)

install:
	yum install ansible

uninstall_ipa:
	ipa-server-install --uninstall
	yum remove ipa-server ipa-server-dns

client:
	ansible-playbook -i "${HOSTNAME}", -c local ipa-client.yml

server:
	ansible-playbook -i "${HOSTNAME}", -c local ipa-server.yml

release:
	@echo "Enter commit message:"
	@read REPLY; \
	echo "${DATE} - $$REPLY" >> CHANGELOG; \
	git add --all; \
	git commit -m "$$REPLY"; \
	git push
