#!/bin/bash

# Update system
yum update -y

# Install nginx and git
amazon-linux-extras install nginx1 -y
yum install git -y      

# Start and enable nginx
systemctl start nginx
systemctl enable nginx

# Clone HTML file from GitHub
cd /tmp
git clone https://github.com/Benjamin-Klenam-Akakpo/nginx-site-html-file.git

# Copy index.html to nginx web directory
cp /tmp/nginx-site-html-file/index.html /usr/share/nginx/html/index.html

# Set permissions
chown nginx:nginx /usr/share/nginx/html/index.html
chmod 644 /usr/share/nginx/html/index.html  

# Configure nginx
cat <<EOF > /etc/nginx/nginx.conf
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  _;
        root         /usr/share/nginx/html; 

        location / {
            index  index.html index.htm;
        }

        location /health {
            access_log off;
            return 200 "healthy\n";
            add_header Content-Type text/plain;
        }

        error_page   404              /404.html;
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }
    }
}
EOF

# Restart nginx to apply configuration
systemctl restart nginx

# Install CloudWatch agent
yum install -y amazon-cloudwatch-agent

# Health check script
cat <<EOF > /usr/local/bin/health_check.sh
#!/bin/bash
curl -f http://localhost/health > /dev/null 2>&1
exit \$?
EOF

chmod +x /usr/local/bin/health_check.sh

# Log deployment completion
echo "Nginx deployment completed at \$(date)" >> /var/log/deployment.log
