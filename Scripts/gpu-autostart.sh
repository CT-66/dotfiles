#!/bin/bash
# needs to run twice
virsh nodedev-detach pci_0000_03_00_0
virsh nodedev-reattach pci_0000_03_00_0
sudo ~/Scripts/gpu-autostart-2.sh

virsh nodedev-detach pci_0000_03_00_0
virsh nodedev-reattach pci_0000_03_00_0
sudo ~/Scripts/gpu-autostart-2.sh


notify-send "VFIO" "GPU attached"
