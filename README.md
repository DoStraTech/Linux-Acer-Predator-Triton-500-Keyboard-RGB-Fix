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
