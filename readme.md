# SSH access

# Also add the public key (~/.ssh/id_ras.pub) of the local machine to the authorized key(~/.ssh/authorizedkey) of the remote machine [VM] .

# Sudo

### Add sudo privilege to the ansible user in the virtual machine by modifying the `/etc/sudoers` file:

### Add the line:

### Allow ansible user to run without sudo command for ansible

```bash
hostname ALL=(ALL) NOPASSWD: ALL
```

### To see the name of ansible user execute `whoami` in the device running the ansible command.



