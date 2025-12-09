#!/bin/sh
if [ -z $GITHUB_USER ]; then
    echo "GITHUB_USER is unset"
    exit 1
fi
cat <<EOF | crontab -
*/10 * * * * curl -fsSL https://github.com/${GITHUB_USER}.keys | tee /tmp/keys >/dev/null && [ -s /tmp/keys ] && cp /tmp/keys ~/.ssh/authorized_keys
EOF
