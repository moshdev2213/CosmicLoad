#!/bin/bash

# Update package list
apt-get update

# Install Apache
apt-get install -y apache2

# Create index.html file with hostname info
cat <<EOF >/var/www/html/index.html
<html>
    <body>
        <h1>Hello from $(hostname)</h1>
    </body>
</html>
EOF

# Restart Apache to ensure the changes are applied
systemctl restart apache2