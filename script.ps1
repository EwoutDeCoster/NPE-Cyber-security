

Write-Output "Kali aanmaken..."

VBoxManage createvm --name "Kalivm" --ostype "Debian_64" --register --basefolder "D:\vms"

Write-Output "Kali Configureren..."

VBoxManage modifyvm "Kalivm" --cpus 3
VBoxManage modifyvm "Kalivm" --memory 3072

VBoxManage storagectl "Kalivm" --name "SATA Controller" --add sata --controller IntelAhci --portcount 1 --bootable on
VBoxManage storageattach "Kalivm" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\vms\Kali Linux 2022.1 (64bit).vdi"

VBoxManage  modifyvm "Kalivm" --nic1 natnetwork
VBoxManage  modifyvm "Kalivm" --nic2 nat



Write-Output "MetaSploitable aanmaken..."

VBoxManage createvm --name "MetaSploitablevm" --ostype "Other Linux(64-bit)" --register --basefolder "D:\vms"

Write-Output "MetaSploitable Configureren..."

VBoxManage modifyvm "MetaSploitablevm" --cpus 3
VBoxManage modifyvm "MetaSploitablevm" --memory 3072

VBoxManage storagectl "MetaSploitablevm" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "MetaSploitablevm" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\vms\Metasploitable2-Linux\Metasploitable.vmdk"

VBoxManage  modifyvm "MetaSploitablevm" --nic1 natnetwork

Write-Output "VM's zijn succesvol aangamaakt!"
Write-Output "VM's opstarten..."

VBoxManage startvm "Kalivm"
VBoxManage startvm "MetaSploitablevm"


