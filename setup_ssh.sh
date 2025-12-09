#!/bin/sh
cat <<EOF > /etc/ssh/sshd_config
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
EOF
systemctl daemon-reload
systemctl restart ssh
