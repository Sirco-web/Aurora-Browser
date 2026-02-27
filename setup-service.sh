#!/bin/bash

# Aurora Browser systemd service setup script
# This script creates and enables a systemd service to run Aurora Browser in the background

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root (use sudo)${NC}"
   exit 1
fi

# Get the absolute path of the Aurora Browser directory
AURORA_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NODE_PATH=$(which node)

if [ -z "$NODE_PATH" ]; then
    echo -e "${RED}Error: Node.js is not installed or not in PATH${NC}"
    exit 1
fi

echo -e "${BLUE}Setting up Aurora Browser systemd service...${NC}"
echo "Aurora Browser path: $AURORA_DIR"
echo "Node.js path: $NODE_PATH"

# Create systemd service file
SERVICE_FILE="/etc/systemd/system/aurora-browser.service"

echo -e "${BLUE}Creating systemd service file at $SERVICE_FILE...${NC}"

cat > "$SERVICE_FILE" << EOF
[Unit]
Description=Aurora Browser - Web Proxy Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$AURORA_DIR
ExecStart=$NODE_PATH $AURORA_DIR/src/index.js
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

echo -e "${GREEN}Service file created${NC}"

# Reload systemd daemon
echo -e "${BLUE}Reloading systemd daemon...${NC}"
systemctl daemon-reload

# Enable the service
echo -e "${BLUE}Enabling Aurora Browser service...${NC}"
systemctl enable aurora-browser.service

# Start the service
echo -e "${BLUE}Starting Aurora Browser service...${NC}"
systemctl start aurora-browser.service

# Check service status
echo -e "${BLUE}Checking service status...${NC}"
if systemctl is-active --quiet aurora-browser.service; then
    echo -e "${GREEN}✓ Aurora Browser service is running!${NC}"
else
    echo -e "${RED}✗ Service failed to start${NC}"
    echo "View logs with: journalctl -u aurora-browser.service -f"
    exit 1
fi

echo ""
echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo "Service will now run on port 8580"
echo ""
echo "Useful commands:"
echo "  Check status:    systemctl status aurora-browser.service"
echo "  View logs:       journalctl -u aurora-browser.service -f"
echo "  Restart service: systemctl restart aurora-browser.service"
echo "  Stop service:    systemctl stop aurora-browser.service"
echo "  Disable service: systemctl disable aurora-browser.service"
