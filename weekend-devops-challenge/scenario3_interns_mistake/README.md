# Scenario 3: The Intern's Mistake

## Story
A new intern deployed a hotfix to the static website. Since then, the site is throwing a 403 Forbidden error to all visitors. To make matters worse, the deployment script can no longer be executed, and the logs directory seems completely locked down. We can see the files inside `logs/`, but we can't actually read them.

## Objective
Investigate the environment to find out what permissions the intern broke.
Fix the website's index file, make the deployment script executable again, and restore full access to the logs directory so we can read the deployment logs.
