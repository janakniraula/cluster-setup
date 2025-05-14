#!/bin/bash

# Update system packages
sudo apt-get update
sudo apt-get upgrade -y

# Master node information
MASTER_IP="<IP>"
NODE_TOKEN="<TOKEN>"

# Install k3s on the worker node
curl -sfL https://get.k3s.io | K3S_URL="https://${MASTER_IP}:6443" K3S_TOKEN="${NODE_TOKEN}" sh -

echo "Worker node setup complete!"
echo "The worker node should now be joining the cluster."
echo "On the master node, run 'sudo kubectl get nodes' to verify."
