# Scenario 1: The Silent Failure

## Story
The application stopped processing background jobs early this morning, but the primary web interface is still running fine. We aren't getting any automated alerts, but the job queue is backing up fast. 

## Objective
Investigate the logs to find out why the jobs are failing. 
Once you identify the root cause, fix the permission issues so that the application can read its configuration again, and make sure the restart script can be executed to bring the service back online.

*Note: There might be a red herring in the logs. Look closely.*
