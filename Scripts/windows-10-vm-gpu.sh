#!/bin/bash

read -p "Are you sure you want to start the windows VM? (Y/n): " confirmation

if [[ $confirmation == [Y] ]]; then
    printf "\n\e[1;34m%-6s\e[m\n\n" "Starting the virtual machine..."
else
    printf "\n\e[1;34m%-6s\e[m\n\n" "Cancelled."
    exit 1
fi

# detach/remove/disable the dgpu from the host and pass it to the VM
printf "\n\e[1;34m%-6s\e[m\n\n" "Removing the gpu..."
sudo modprobe -i vfio_pci vfio_pci_core vfio_iommu_type1
virsh nodedev-detach pci_0000_03_00_0
printf "\n\e[1;34m%-6s\e[m\n\n" "GPU reattached and passed to the VM."

# kill xremap
pkill xremap
printf "\n\e[1;34m%-6s\e[m\n\n" "Killed xremap."

# start the VM
printf "\n\e[1;34m%-6s\e[m\n\n" "Starting the VM..."
virsh start Windows-10-LTSC_GPU
sleep 5

# start looking glass
printf "\n\e[1;34m%-6s\e[m\n\n" "Starting Looking Glass..."
looking-glass-client -s -F -S -m "KEY_RIGHTCTRL"
printf "\n\e[1;34m%-6s\e[m\n\n" "Exiting Looking Glass..."
sleep 5

# check if VM is shut down
running_status=$(virsh list --all | grep "Windows-10-LTSC_GPU" | awk '{printf $3 $4}')
printf "\n\e[1;34m%-6s\e[m\n\n" "Checking if the VM is shut down..."
while [ "$running_status" != "shutoff" ]; do
    sleep 5
done
if [ "$running_status" == "shutoff" ]; then
    printf "\n\e[1;34m%-6s\e[m\n\n" "VM shut down successfully."
    printf "\n\e[1;34m%-6s\e[m\n\n" "Wait..."
    sleep 10
fi


# reattach/enable/give back the gpu from the Vm back to the host
# printf "\n\e[1;34m%-6s\e[m\n\n" "Attaching the gpu..."
# sudo rmmod vfio_pci vfio_pci_core vfio_iommu_type1
# virsh nodedev-reattach pci_0000_03_00_0
# printf "\n\e[1;34m%-6s\e[m\n\n" "GPU reattached and given back to the host."
printf "\n\e[1;34m%-6s\e[m\n\n" "Restart to properly use the GPU"



# start xremap
printf "\n\e[1;34m%-6s\e[m\n\n" "Starting xremap..."
sleep 5
nohup xremap --watch /home/arch/.config/xremap/config.yml >/dev/null 2>&1 &
printf "\n\e[1;34m%-6s\e[m\n\n" "Wait..."
sleep 5
printf "\n\e[1;34m%-6s\e[m\n\n" "Done"
printf "\n\e[1;34m%-6s\e[m\n\n" "Press Ctrl+D to exit (Do not manually close the window!)"
