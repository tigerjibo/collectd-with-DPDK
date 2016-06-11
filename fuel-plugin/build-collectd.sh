#!/bin/bash

VERSION=${VERSION:-5.5.2}
set -eux
sudo apt-get -y install build-essential dh-autoreconf fakeroot dpkg-dev devscripts dpkg-dev git wget

sudo apt-get -y install debhelper dpkg-dev po-debconf dh-systemd \
    bison  flex autotools-dev libltdl-dev pkg-config \
    iptables-dev \
    javahelper \
    libatasmart-dev  \
    libcap-dev  \
    libcurl4-gnutls-dev \
    libdbi0-dev \
    libesmtp-dev \
    libganglia1-dev \
    libgcrypt11-dev \
    libglib2.0-dev \
    libhiredis-dev \
    libldap2-dev \
    liblvm2-dev  \
    libmemcached-dev \
    libmodbus-dev \
    libmnl-dev  \
    libnotify-dev \
    libopenipmi-dev \
    liboping-dev \
    libow-dev \
    libpcap0.8-dev \
    libpcap-dev \
    libperl-dev \
    libpq-dev \
    librdkafka-dev \
    librabbitmq-dev \
    librrd-dev  \
    libsensors4-dev \
    libsigrok-dev  \
    libsnmp9-dev \
    libsnmp-dev \
    perl \
    libtokyocabinet-dev  \
    libtokyotyrant-dev  \
    libudev-dev  \
    libupsclient-dev \
    libvarnishapi-dev \
    libvirt-dev \
    libxml2-dev \
    libyajl-dev \
    linux-libc-dev \
    default-jdk \
    protobuf-c-compiler \
    python-dev

DIR="$(dirname `readlink -f $0`)"

cd ${DIR}/..
rm -rf pkg-debian debian
git clone https://github.com/collectd/pkg-debian; cd pkg-debian; git checkout 81153cb; mv debian ..
cd ${DIR}/..

./build.sh
debian/rules build || true
debian/rules build
fakeroot debian/rules binary
