#!/bin/bash

# 1. Detect current user and home directory
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo "~$CURRENT_USER")
AUTHORIZED_KEYS="${USER_HOME}/.ssh/authorized_keys"

# 2. Ensure .ssh directory exists with proper permissions
mkdir -p "${USER_HOME}/.ssh"
chmod 700 "${USER_HOME}/.ssh"
touch "${AUTHORIZED_KEYS}"

# 3. Display instructions
echo "Paste the SSH public key below, then press [Enter] followed by [Ctrl+D] to submit."
echo ""
echo "Example public key formats:"
echo "  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3x... jenkins@ci-server"
echo "  ssh-ed25519 AAAAC3NzA... jenkins@ci-server"
echo ""
echo "To generate a new key (on Jenkins or any client):"
echo "  ssh-keygen -t rsa -b 4096"
echo ""
echo "To view the public key:"
echo "  cat ~/.ssh/id_rsa.pub"
echo ""

# 4. Read public key from standard input
PUB_KEY=$(</dev/stdin)

# 5. Append the key to authorized_keys
echo "$PUB_KEY" >> "$AUTHORIZED_KEYS"

# 6. Set proper ownership and permissions
chmod 600 "$AUTHORIZED_KEYS"
chown -R "$CURRENT_USER:$CURRENT_USER" "${USER_HOME}/.ssh"

# 7. Done
echo ""
echo "The SSH public key has been added to:"
echo "  ${AUTHORIZED_KEYS}"
