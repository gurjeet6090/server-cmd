
# 🛠️ Linux Server Health & Service Audit

A simple shell script to perform a full system audit on a Linux server, including checks for system performance, Apache, PHP, and MySQL status/configuration.

---

## 📋 Contents

- [System Info](#system-info)
- [Apache (HTTPD)](#apache-httpd)
- [PHP](#php)
- [MySQL](#mysql)

---

## 📊 System Info

| Task | Command |
|------|---------|
| Check CPU & memory usage | `top` |
| RAM usage | `free -m` |
| Disk usage | `df -h` |
| CPU details | `lscpu` |
| System uptime | `uptime` |
| OS & Kernel info | `hostnamectl` |
| Number of CPU cores | `nproc` |
| Running services | `systemctl list-units --type=service --state=running` |

---

## 🌐 Apache (HTTPD)

| Task | Command |
|------|---------|
| Apache version | `httpd -v` |
| Test config | `apachectl configtest` |
| Restart Apache | `systemctl restart httpd` |
| Reload config | `systemctl reload httpd` |
| Apache binary path | `which httpd` |
| Check MPM | `apachectl -V \| grep -i mpm` |

---

## 🐘 PHP

| Task | Command |
|------|---------|
| PHP version | `php -v` |
| Installed PHP modules | `php -m` |
| PHP binary path | `which php` |
| Memory limit | `php -i \| grep memory_limit` |
| Upload max filesize | `php -i \| grep upload_max_filesize` |
| PHP-FPM status | `systemctl status ea-php82-php-fpm` |
| PHP config path | `find /opt/cpanel/ -name php.ini`<br>`php -i \| grep "Loaded Configuration File"` |
| FPM config path | `cat /opt/cpanel/ea-php82/root/etc/php-fpm.conf` |
| Restart PHP-FPM | `/scripts/restartsrv_apache_php_fpm` |

---

## 🐬 MySQL

| Task | Command |
|------|---------|
| MySQL version | `mysql -V` |
| MySQL binary path | `which mysql` |
| Monitor real-time usage | `mysqladmin proc status` |
| Connect to MySQL | `mysql -u root -p` |

### 🔍 Important MySQL Queries

```sql
-- Configuration Variables
SHOW VARIABLES WHERE Variable_name IN (
  'default_storage_engine',
  'innodb_data_file_path',
  'innodb_buffer_pool_size',
  'max_allowed_packet',
  'open_files_limit',
  'innodb_file_per_table',
  'tmp_table_size',
  'innodb_buffer_pool_instances',
  'innodb_log_file_size',
  'join_buffer_size',
  'max_heap_table_size',
  'key_buffer_size',
  'unix_socket',
  'max_connections',
  'table_open_cache',
  'thread_cache_size',
  'query_cache_type',
  'query_cache_limit',
  'query_cache_size',
  'innodb_flush_method',
  'myisam_sort_buffer_size',
  'read_rnd_buffer_size',
  'aria_pagecache_buffer_size',
  'aria_sort_buffer_size',
  'slow_query_log',
  'slow_query_log_file',
  'long_query_time'
);

-- Connection Statistics
SHOW STATUS LIKE 'Threads_created';
SHOW STATUS LIKE 'Connections';
SHOW STATUS LIKE 'Max_used_connections';
