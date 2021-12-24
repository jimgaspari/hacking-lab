# Deploy the lab

Once the images have been gathered, you will need to use terraform to deploy them here.

## Create a Cloud Init Config for Kali
Sice we made a cloud image for Kali, you will need to create a copy of the `cloud_init.cfg.tpl` file and call it `cloud_init.cfg`.

## Use Terraform to Deploy the Lab

```bash
terraform init
terraform apply
```
