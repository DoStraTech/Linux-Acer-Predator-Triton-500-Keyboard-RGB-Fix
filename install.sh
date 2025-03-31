#!/bin/bash
set -e

echo "[*] Installing dependencies..."
apt-get update
apt-get install -y git python3 python3-usb

echo "[*] Cloning fix repository..."
git clone https://github.com/DoStraTech/Linux-Acer-Predator-Triton-500-Keyboard-RGB-Fix.git /tmp/keyboard-fix
cd /tmp/keyboard-fix

echo "[*] Copying fix script to /usr/local/bin..."
cp fix_keyboard.py /usr/local/bin/fix_keyboard.py
chmod +x /usr/local/bin/fix_keyboard.py

echo "[*] Installing systemd service..."
cp fix-keyboard.service /etc/systemd/system/fix-keyboard.service

echo "[*] Enabling and starting the service..."
systemctl daemon-reload
systemctl enable fix-keyboard.service
systemctl start fix-keyboard.service

echo "[*] Cleaning up..."
cd /
rm -rf /tmp/keyboard-fix

echo "[✔] Installation complete. The RGB keyboard fix is now active."
