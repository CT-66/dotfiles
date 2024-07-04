#!/bin/bash
sudo rmmod vfio_pci vfio_pci_core vfio_iommu_type1
sudo modprobe -i amdgpu radeon
