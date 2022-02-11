sudo parted /dev/sda
resizepart 3
19GB
exit
sudo pvresize /dev/sda3
sudo lvextend -r -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv