mkdir /home/admin/ftp && chown nobody:nogroup /home/admin/ftp
chmod a-w /home/admin/ftp/
mkdir /home/admin/ftp/files && chown admin:password /home/admin/ftp/files

./telegraf/telegraf & rc-service vsftpd restart

while true; do
    rc-service vsftpd status || rc-service vsftpd restart;
    sleep 5;
done;