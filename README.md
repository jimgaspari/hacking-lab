# This is my hacking lab 
This hacking lab is complete the following tasks:
* Create a kali VM
* Create a Metasploitable 1 VM
* Create a Metasploitable 2 VM
* Create a VM for golden eye from VulnHub
* Create a Isolated network for the VM's

## Applications required to build the lab
* kvm
* packer
* terraform

## Steps to create the Lab
1. Create the kali template vm with packer
1. Download and extract metasploitable 1
1. Download and extract metasploitable 2
1. Download and extract Golden Eye from VulnHub
1. Deploy Lab with Terraform

## KVM Kali Template
Since there is not currently a Kali image for kvm, I have automated the build like the kali team does for the Vagrant Images. In the packer build, I am using [qemu](https://www.qemu.org/) to build a [kvm](https://www.linux-kvm.org/page/Main_Page) image.

The process is simple enough to complete.
```bash
cd kali-vm
packer build config.json
```
