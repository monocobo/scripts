#!/bin/sh
if [ -z $USER ]; then
    echo "USER is unset"
    exit 1
fi
cat <<EOF
*/10 * * * * curl -fsSL https://github.com/${USER}.keys | tee /tmp/keys >/dev/null && [ -s /tmp/keys ] && cp /tmp/keys ~/.ssh/authorized_keys
EOF | crontab -
