# Acer Predator Triton 500 – RGB Keyboard Flicker Fix (Linux)

Fix RGB Keyboard Flicker on Acer Predator Triton 500 (Linux / Ubuntu 24.04) – A systemd + Python script to stop flickering and initialize RGB lighting via USB HID. Works on boot and resume. Tested on PT515-52.

This script fixes the keyboard flickering issue on the **Acer Predator Triton 500 (PT515-52)** when running Linux. 

The fix sends a custom USB HID command to the RGB keyboard via `pyusb` and sets it to plain white.

It runs automatically on boot and after waking from suspend.

---

## Background

The RGB keyboard on this laptop uses a per-key RGB which start in a chaotic blinking mode, which makes the laptop almost unsusable with background lighting on.
It is also very unprofessional. This script sends a SET_REPORT command to reinitialize a stable static lighting configuration.

---

## Requirements

- only Python 3 with `pyusb` (Python USB library)
- systemd (used on most modern Linux systems)

## Auto-install-script

Just run:

```bash
wget -O - https://raw.githubusercontent.com/DoStraTech/Linux-Acer-Predator-Triton-500-Keyboard-RGB-Fix/main/install.sh | sudo bash
```




### Manual Installation

You can also install the fix manually by following these steps:

#### 1. Install dependencies

```bash
sudo apt-get update
sudo apt-get install -y git python3 python3-usb
```

#### 2. Clone the repository

```bash
git clone https://github.com/DoStraTech/Linux-Acer-Predator-Triton-500-Keyboard-RGB-Fix.git
cd Linux-Acer-Predator-Triton-500-Keyboard-RGB-Fix
```

#### 3. Copy the Python script

```bash
sudo cp fix_keyboard.py /usr/local/bin/fix_keyboard.py
sudo chmod +x /usr/local/bin/fix_keyboard.py
```

#### 4. Install the systemd service

```bash
sudo cp fix-keyboard.service /etc/systemd/system/fix-keyboard.service
```

#### 5. Enable and start the service

```bash
sudo systemctl daemon-reload
sudo systemctl enable fix-keyboard.service
sudo systemctl start fix-keyboard.service
```

#### 6. (Optional) Clean up the repo

```bash
cd ..
rm -rf Linux-Acer-Predator-Triton-500-Keyboard-RGB-Fix
```

---

After installation, the RGB keyboard fix will be applied on boot and after resume from suspend.


