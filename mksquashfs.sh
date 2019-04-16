sudo kpartx -av $1
sudo mount /dev/mapper/loop0p2 /mnt
sudo sed -i 's/^\/dev\/mmcblk/#\0/g' /mnt/etc/fstab
sudo sed -i 's/^PARTUUID/#\0/g' /mnt/etc/fstab
sudo rm -f /mnt/etc/console-setup/cached_UTF-8_del.kmap.gz
sudo rm -f /mnt/etc/systemd/system/multi-user.target.wants/apply_noobs_os_config.service
sudo rm -f /mnt/etc/systemd/system/multi-user.target.wants/raspberrypi-net-mods.service
sudo rm -f /mnt/etc/rc3.d/S01resize2fs_once
sudo mksquashfs /mnt converted_image_for_berryboot.img -comp lzo -e lib/modules
sudo umount /mnt
sudo kpartx -d $1