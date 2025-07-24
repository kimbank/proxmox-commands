#!/bin/bash

# Update package index
sudo apt-get update -y

# Install prerequisites
sudo apt-get install -y ca-certificates curl gnupg

# Create directory for NodeSource GPG key
sudo mkdir -p /etc/apt/keyrings

# Download and add NodeSource GPG key
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Add NodeSource repository (Node.js LTS)
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Update package index with new repository
sudo apt-get update -y

# Install Node.js
sudo apt-get install -y nodejs

# Verify installation
echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"
