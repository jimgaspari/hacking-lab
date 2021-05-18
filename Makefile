
network:
	source variables.sh
	cd network
	terraform init && terraform apply
	cd ../

kali: 
	cd kali-vm
	packer build config.json

msf1:

install: 