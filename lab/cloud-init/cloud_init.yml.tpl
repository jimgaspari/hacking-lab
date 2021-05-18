#cloud-config
ssh_pwauth: true
disable_root: false
chpasswd:
  list: |
     vagrant:somethingelse
  expire: false
users:
  - name: vagrant
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    home: /home/vagrant
    shell: /bin/bash
    lock_passwd: false
    ssh-authorized-keys:
      - insert ssh_key here
final_message: "The system is finally up, after $UPTIME seconds"
