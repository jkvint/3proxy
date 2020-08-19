ufw default deny incoming
ufw default allow outgoing

ufw allow ssh
ufw allow 8088

echo "y" | ufw enable

version=0.8.13
apt-get update && apt-get -y upgrade
apt-get install gcc make git libc6-dev -y
wget --no-check-certificate -O 3proxy-${version}.tar.gz https://github.com/z3APA3A/3proxy/archive/${version}.tar.gz
tar xzf 3proxy-${version}.tar.gz
cd 3proxy-${version}
make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://github.com/jkvint/3proxy/raw/master/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
mkdir /var/log/3proxy/
wget --no-check-certificate https://github.com/jkvint/3proxy/raw/master/.proxyauth
chmod 600 /etc/3proxy/.proxyauth
cd /etc/init.d/
wget --no-check-certificate  https://raw.githubusercontent.com/jkvint/3proxy/master/3proxy?token=ADFSQRA7GJ73Z6UL726DLLC7HVJPS
chmod  +x /etc/init.d/3proxy
update-rc.d 3proxy defaults
