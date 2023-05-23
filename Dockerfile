FROM centos:centos7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
COPY pxe_boot.sh /
RUN chmod +x /pxe_boot.sh
#RUN bash -c "/pxe_boot.sh"
#ENTRYPOINT ["/bin/bash","/pxe1.sh"]
#RUN systemctl enable dhcpd \
# && systemctl enable xinetd.service \
# && systemctl enable tftp.service \
# && systemctl enable httpd
#ADD pxe1.sh /pxe1.sh
#RUN chmod +x /pxe1.sh
#VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
