#!/bin/bash

# Setup directories
mkdir -p secure_data keys scripts

# Create dummy data
echo "Q1_Report,Confidential,Revenue: $1M" > secure_data/q1_report.csv
echo "Q2_Report,Confidential,Revenue: $1.2M" > secure_data/q2_report.csv

# Create dummy key
echo "-----BEGIN PRIVATE KEY-----" > keys/app_key.pem
echo "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC..." >> keys/app_key.pem
echo "-----END PRIVATE KEY-----" >> keys/app_key.pem

# Create backup script
cat << 'EOF' > scripts/backup.sh
#!/bin/bash

echo "Starting backup process..."

if [ ! -r keys/app_key.pem ]; then
    echo "ERROR: Cannot read keys/app_key.pem. Permission denied."
    exit 1
fi

if [ ! -x secure_data ] || [ ! -r secure_data ]; then
    echo "ERROR: Cannot access secure_data directory. Permission denied."
    exit 1
fi

echo "Encrypting and backing up data..."
cat secure_data/*.csv > backup_archive.tmp
echo "Backup completed successfully!"
rm backup_archive.tmp
EOF

# Break permissions
chmod 000 secure_data
chmod 000 keys/app_key.pem
chmod 644 scripts/backup.sh

echo "Environment initialized. Good luck!"
