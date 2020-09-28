# Front End Topics
## Vue Router History Mode Configuration
Using history mode with vue router allows you to have a clean url "without # symbol in it", but it requires a server configuration. As I'm using Apache I found elaboration [here](https://medium.com/swlh/using-vue-routers-history-mode-6d9395e8122e) for both Apache and Nginx.

Yet, on practicing as I'm using virtual hosts, I wanted to note here that block `<IfModule>` is nested inside block `<Directory>` as shown in example below.
```conf
<VirtualHost domain:80>
    DocumentRoot /var/www/html/frontendscript
    ServerName servername

    <Directory /var/www/html/>
        Options All
        AllowOverride All
        Require all granted

       <IfModule mod_rewrite.c>
          RewriteEngine On
          RewriteBase /
          RewriteRule ^index\.html$ - [L]
          RewriteCond %{REQUEST_FILENAME} !-f
          RewriteCond %{REQUEST_FILENAME} !-d
          RewriteRule . /index.html [L]
       </IfModule>
   </Directory>
</VirtualHost>
```