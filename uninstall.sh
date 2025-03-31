#!/bin/bash
set -e

echo "[*] Stopping systemd service..."
systemctl stop fix-keyboard.service || true

echo "[*] Disabling systemd service..."
systemctl disable fix-keyboard.service || true

echo "[*] Removing systemd service file..."
rm -f /etc/systemd/system/fix-keyboard.service

echo "[*] Removing RGB fix script..."
rm -f /usr/local/bin/fix_keyboard.py

echo "[*] Reloading systemd daemon..."
systemctl daemon-reload

echo "[✔] Uninstallation complete."
echo ""
echo "[✔] Done. Press Enter to close this window."
read
