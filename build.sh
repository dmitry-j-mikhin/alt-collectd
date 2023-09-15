set -ex

sudo rm -rf out
mkdir -p out
docker run -it --rm \
 -v `realpath .`:/tmp/host \
 alt:p10 \
 sh -e -x -c \
"useradd -m -U builder && \
apt-get update && \
apt-get install -y rpm-build wget \
  flex gcc-c++ iptables-devel libgcrypt-devel libpcap-devel libxfs-devel libstatgrab-devel perl-devel perl-threads perl-Regexp-Common perl-Pod-Parser perl-RRD dpdk-devel \
  libgps-devel apache2-devel rpm-macros-apache2 libcurl-devel libxml2-devel perl-CGI libdbi-devel libopenipmi-devel libvirt-devel libmemcached-devel libMySQL-devel \
  libnotify-devel libesmtp-devel libupsclient-devel librrd-devel liboping-devel postgresql-devel libsensors3-devel libnet-snmp-devel net-snmp-common libtokyotyrant-devel \
  libyajl-devel python3-dev && \
cd /tmp && \
runuser -u builder -- wget http://ftp.altlinux.ru/pub/distributions/ALTLinux/c10f1/branch/x86_64/SRPMS.classic/collectd-5.12.0-alt1.src.rpm && \
runuser -u builder -- rpm -i ./collectd-5.12.0-alt1.src.rpm && \
runuser -u builder -- cp -a -v /tmp/host/collectd.spec /home/builder/RPM/SPECS/collectd.spec && \
runuser -u builder -- cp -a -v /tmp/host/collectd-5.12.0-python.patch /home/builder/RPM/SOURCES/ && \
runuser -u builder -- rpm -ba --target x86_64 /home/builder/RPM/SPECS/collectd.spec && \
cp -a -v /home/builder/RPM /tmp/host/out/"
