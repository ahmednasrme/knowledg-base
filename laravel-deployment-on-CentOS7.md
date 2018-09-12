# Deploying Laravel Apps on CentOS 7 Server
## Sep 12 2018
### Main Steps
- Setup [Apache](https://www.linode.com/docs/web-servers/apache/install-and-configure-apache-on-centos-7/), PHP 7.x, mysql and composer
- access with ssh
- Place Application(s) in /var/www/html
- Change files permissions and owners as the following:
```bash
$ sudo chown -R apache:apache /var/www/html/{project}/storage
$ sudo chmod -R 775 /var/www/html/{project}/storage
```
[Read more](https://github.com/BookStackApp/BookStack/issues/436)
- Your Application still not allowed to edit 'storage/logs/laravel.log' because of selinux, to solve it:
```bash
$ sudo chcon -R -t httpd_sys_rw_content_t storage
```
[more](https://laracasts.com/discuss/channels/laravel/laravel5-gives-blank-page-with-500-status-code-on-apache-fedora22/replies/98874)
- Create mysql db and user:
```mysql
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE database;
GRANT ALL PRIVILEGES ON database.* TO 'user'@'localhost';
```
[more](https://dev.mysql.com/doc/refman/8.0/en/set-password.html)
- From Applications folder, install dependencies
```bash
$ composer install --optimize-autoloader --no-dev
```
*Dont use sudo*
- Create .env
```bash
$ nano .env.example
```
then save the new file as .env
- Setup Your application
```bash
php artisan key:generate
php artisan migrate
php artisan db:seed
php artisan passport:install
php artisan config:cache
```
consider the front-end as well to be compiled properly for production.
[more](https://laravel.com/docs/5.6/deployment)
- Create Virtual host for each application
```bash
sudo nano /etc/httpd/conf.d/vhost1.conf
```
add the following configration:
```
<VirtualHost *:80>
    DocumentRoot /var/www/html/App1/public
    ServerName AppUrl.com

    <Directory /var/www/html/App1/public/>
        Options All
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```
- Restart Apache
```bash
$ sudo service httpd restart
```
- List all Virtual Hosts you have
```bash
$ httpd -S
$ apachectl -S
```
### Multithreading Server
Apache MPM (stands for Multi-Processing Module) to activate.
- Edit MPM configration file
```bash
$ sudo nano /etc/httpd/conf.modules.d/00-mpm.conf
```
- comment/uncomment lines as below:
```
#LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
#LoadModule mpm_worker_module modules/mod_mpm_worker.so

LoadModule mpm_event_module modules/mod_mpm_event.so
```
- Restart Apache
```bash
$ systemctl restart httpd
```
[more](https://tecadmin.net/enable-event-mpm-in-apache-2-4/)
[even more](https://www.linode.com/docs/web-servers/apache-tips-and-tricks/tuning-your-apache-server/)