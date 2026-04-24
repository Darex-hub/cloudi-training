# Weekend DevOps Challenge

Welcome to the Weekend DevOps Challenge! This repository contains three realistic Linux troubleshooting scenarios designed to test your command-line navigation, log analysis, and permission-fixing skills.

## Scenarios
1. **The Silent Failure**: A background processor has stopped working. Find out why and get the service restarted.
2. **Access Denied**: The nightly backup script failed. Restore access to the necessary files and directories.
3. **The Intern's Mistake**: A web deployment went wrong, resulting in 403 Forbidden errors and locked files.

## Instructions
1. Pick **ONE** scenario folder to start with.
2. Navigate into the folder.
3. Run the setup script to initialize the broken environment:
   ```bash
   chmod +x setup.sh && ./setup.sh
   ```
4. Investigate the issue using commands like `cd`, `ls`, `cat`, `less`, and `grep`.
5. Fix the issues using `chmod` to restore the correct permissions.

## Deliverables
Provide a report file (e.g., `report.txt`) explaining:
- What exactly was broken.
- How you found the issue (which commands you used).
- How you fixed it (the exact `chmod` commands).
