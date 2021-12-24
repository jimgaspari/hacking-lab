#cloud-config
ssh_pwauth: true
disable_root: false
chpasswd:
  list: |
    user:somethingelse
  expire: false
users:
  - name: user
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    home: /home/user
    shell: /bin/bash
    lock_passwd: false
    ssh-authorized-keys:
      - insert ssh_key here
final_message: "The system is finally up, after $UPTIME seconds"
