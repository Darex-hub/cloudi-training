# Scenario 2: Access Denied

## Story
The daily backup job failed last night. The backup script is supposed to archive the secure data from the reporting system and use the application key to encrypt it. Someone was auditing the server yesterday and might have accidentally messed up the file and folder permissions.

## Objective
Restore access to the necessary directories and files so that the `backup.sh` script can run successfully without any "Permission denied" errors.

*Note: You'll need to figure out which permissions the directory, the key, and the script actually need.*
