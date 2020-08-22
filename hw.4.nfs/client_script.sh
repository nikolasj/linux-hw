yum install nfs-utils -y
for action in {start,enable}; do
  echo 'performing action $action'
  systemctl $action firewalld.service
done

mkdir -p /mnt/nfsfileshare
grep '192.168.51.5:/var/nfsfileshare' /etc/fstab >/dev/null
if [ $? -ne 0 ]; then
  echo 'mounting nfsfileshare'
  echo "192.168.51.5:/var/nfsfileshare/ /mnt/nfsfileshare nfs rw,sync,hard,intr 0 0" >> /etc/fstab
  mount -a
else
  echo 'share is already mounted'
fi

echo 'Can I write?' > /mnt/nfsfileshare/test
if [ $? -ne 0 ]; then
  echo 'I cant write!!!'
  exit 1
fi
  echo 'The share seems to be working'
