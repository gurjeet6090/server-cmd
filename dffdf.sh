#!/bin/bash
# ============================================
# Linux Server Health & Service Audit Script
# Author: [Your Name]
# Date: [Today's Date]
# Description: System health check for CPU, memory, Apache, PHP, and MySQL
# ============================================

echo "============================"
echo "🔧 System Health Check"
echo "============================"

echo -e "\n🖥️  CPU and Memory Usage:"
top -b -n 1 | head -n 10

echo -e "\n💾 RAM Usage:"
free -m

echo -e "\n🗃️  Disk Usage:"
df -h

echo -e "\n🧠 CPU Info:"
lscpu

echo -e "\n⏱️  Uptime:"
uptime

echo -e "\n🖥️  OS and Kernel Info:"
hostnamectl

echo -e "\n🧮 Number of CPU Cores:"
nproc

echo -e "\n🚀 Running Services:"
systemctl list-units --type=service --state=running

# --------------------------------------------
echo -e "\n============================"
echo "🌐 Apache (HTTPD) Information"
echo "============================"

echo -e "\n🌐 Apache Version:"
httpd -v

echo -e "\n⚙️  Apache Config Test:"
apachectl configtest

echo -e "\n🔁 Restarting Apache..."
systemctl restart httpd

echo -e "\n🔄 Reloading Apache Config..."
systemctl reload httpd

echo -e "\n📍 Apache Binary Path:"
which httpd

echo -e "\n⚙️  Apache MPM Info:"
apachectl -V | grep -i mpm

# --------------------------------------------
echo -e "\n============================"
echo "🐘 PHP Information"
echo "============================"

echo -e "\n📦 PHP Version:"
php -v

echo -e "\n🔌 PHP Modules:"
php -m

echo -e "\n📍 PHP Binary Path:"
which php

echo -e "\n💡 PHP Memory Limit:"
php -i | grep memory_limit

echo -e "\n📤 PHP Upload Max Filesize:"
php -i | grep upload_max_filesize

echo -e "\n📊 PHP-FPM Status:"
systemctl status ea-php82-php-fpm

echo -e "\n📂 PHP.ini Config Path:"
find
