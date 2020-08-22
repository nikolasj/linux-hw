yum install nfs-utils -y
for action in {start,enable}; do
  echo 'performing action $action'
  systemctl $action nfs-server.service
  systemctl $action firewalld.service
done

mkdir -p /var/nfsfileshare
chown -R nfsnobody:nfsnobody /var/nfsfileshare
echo "/var/nfsfileshare 192.168.51.0/24(rw,sync,all_squash,no_subtree_check)" > /etc/exports
exportfs -a

firewall-cmd --permanent --zone public --add-service nfs
firewall-cmd --reload