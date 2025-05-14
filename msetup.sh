#!/bin/bash

# Update system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install k3s on the master node
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable=traefik" sh -

# Wait for k3s to start
sleep 30

# Get the node token for worker nodes to join
NODE_TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)
MASTER_IP=$(hostname -I | awk '{print $1}')

echo "Master node setup complete!"
echo "Master IP: $MASTER_IP"
echo "Node Token: $NODE_TOKEN"
echo ""
echo "Use these values in the worker node setup script."
echo "To check node status, run: sudo kubectl get nodes"
