#!/usr/bin/env bash
# Template script to create UEFI boot entry for (Arch) Linux.

set -Ceuo pipefail

readonly ROOT_SOURCE="$(findmnt -n -s -o SOURCE /)"

readonly KERNEL_PARAMS=(
  "root=${ROOT_SOURCE}"
  'rw'
  'initrd=/intel-ucode.img'
  'initrd=/initramfs-linux.img'
  'systemd.unified_cgroup_hierarchy=1'
  'apparmor=1'
  'security=apparmor'
)

efibootmgr \
  --verbose \
  --create \
  --label "Arch Linux" \
  --loader /vmlinuz-linux \
  --unicode "${KERNEL_PARAMS[*]}" \
  ;
