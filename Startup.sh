#!/bin/bash

yum -y install mlocate vim bash-completion
systemctl stop firewalld NetworkManager
systemctl disable firewalld NetworkManager
