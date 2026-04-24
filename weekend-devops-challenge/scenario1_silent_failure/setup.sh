#!/bin/bash

# Setup directories
mkdir -p app scripts

# Create config
cat << 'EOF' > app/config.yml
db_host: postgres.internal
db_port: 5432
job_queue_limit: 1000
log_level: DEBUG
EOF

# Create misleading and real logs
cat << 'EOF' > app/app.log
[INFO] 2023-10-27 08:00:01 - Web server started on port 8080
[INFO] 2023-10-27 08:00:05 - Connection to primary database successful.
[WARNING] 2023-10-27 08:15:22 - Memory usage exceeding 75%
[ERROR] 2023-10-27 08:30:00 - Connection to legacy database timed out. Retrying in 5s...
[ERROR] 2023-10-27 08:30:05 - Connection to legacy database timed out. Retrying in 5s...
[ERROR] 2023-10-27 08:30:10 - Connection to legacy database timed out. Moving on.
[INFO] 2023-10-27 09:00:00 - Starting job processor...
[FATAL] 2023-10-27 09:00:01 - JobProcessor - Insufficient permissions to read app/config.yml
[FATAL] 2023-10-27 09:00:01 - JobProcessor - Process exited with code 1.
EOF

# Create script
cat << 'EOF' > scripts/restart_service.sh
#!/bin/bash
echo "Stopping job processor..."
sleep 1
echo "Starting job processor..."
echo "Service restarted successfully."
EOF

# Break permissions
chmod 000 app/config.yml
chmod 644 scripts/restart_service.sh

echo "Environment initialized. Good luck!"
