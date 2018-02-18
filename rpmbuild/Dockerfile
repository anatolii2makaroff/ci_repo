FROM centos:7
MAINTAINER makarov version: 0.1

RUN yum install -y epel-release
RUN yum install -y ruby-devel gcc make rpm-build
RUN yum install -y libffi-devel autoconf
RUN gem install fpm ffi
RUN yum install -y git
RUN yum install -y python-devel python-pip
RUN yum install -y openssl-devel
RUN yum install -y createrepo
RUN useradd rpmbuild
