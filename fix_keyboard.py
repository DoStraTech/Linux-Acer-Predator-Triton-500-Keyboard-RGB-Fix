#!/usr/bin/env python3

import usb.core
import usb.util

VENDOR_ID = 0x0d62
PRODUCT_ID = 0x7cb1
INTERFACE = 3
PAYLOAD = bytes.fromhex("08 00 01 05 32 01 00 be")

dev = usb.core.find(idVendor=VENDOR_ID, idProduct=PRODUCT_ID)
if dev:
    if dev.is_kernel_driver_active(INTERFACE):
        dev.detach_kernel_driver(INTERFACE)
    usb.util.claim_interface(dev, INTERFACE)
    dev.ctrl_transfer(0x21, 0x09, 0x0300, INTERFACE, PAYLOAD)
    usb.util.release_interface(dev, INTERFACE)
