#!/bin/bash

# Setup directories
mkdir -p web logs

# Create web file
cat << 'EOF' > web/index.html
<!DOCTYPE html>
<html>
<head><title>Company Portal</title></head>
<body><h1>Welcome to the internal portal</h1></body>
</html>
EOF

# Create deploy script
cat << 'EOF' > web/deploy.sh
#!/bin/bash
echo "Deploying latest changes to production..."
echo "Done."
EOF

# Create logs
cat << 'EOF' > logs/deploy.log
[2023-10-27 14:00] Starting deployment...
[2023-10-27 14:01] Updating index.html
[2023-10-27 14:01] ERROR: Intern applied 'chmod -R 000' accidentally on web contents!
[2023-10-27 14:02] Rollback failed due to insufficient permissions.
EOF

cat << 'EOF' > logs/access.log
192.168.1.10 - - [27/Oct/2023:14:05:00] "GET / HTTP/1.1" 403 154
192.168.1.15 - - [27/Oct/2023:14:06:22] "GET / HTTP/1.1" 403 154
192.168.1.12 - - [27/Oct/2023:14:07:11] "GET / HTTP/1.1" 403 154
EOF

# Break permissions
chmod 000 web/index.html
chmod 444 web/deploy.sh
chmod 400 logs

echo "Environment initialized. Good luck!"
