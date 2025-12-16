#!/bin/sh
cat <<EOF > /etc/ssh/sshd_config
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
Subsystem sftp /usr/lib/openssh/sftp-server # for Ansible Warn
EOF
systemctl daemon-reload
systemctl restart ssh
