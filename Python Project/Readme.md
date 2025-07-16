# Slack Channel Provisioning Tool

This project gives list of slack channels based on a user's Team and Title, using data from three anonymised structured datasets.


The goal is to ensure only eligible users get access to the correct Slack channels, based on both:
- If they should have an access - 'Slack_Acces' - TRUE
- Their Title (TL- Team Lead, OM- Operational Manager, CSR- Customer Service Representative)
- Their Team_Name (e.g. CZ CZ TP, EN UA HW, FR TN TWW)


# Data Sources

1. Team_Members.csv
   - 'Email', 'Team_Name', 'Title', 'Slack_Access'

2. Slack_Channels.csv
   - 'Channel Name', then 'TRUE/FALSE' values for each TITLE

3. Slack_Channels_Teams.csv
   - 'Channel name', then 'TRUE/FALSE' values for each TEAM

## How It Works

1. Collegue inputs an email address of a Partner account in question

2. Script finds the user’s:
   - Slack_Access -  value
   - Team
   - Title

3. If Slack access is allowed:
   - It finds all Slack channels that match the user's TITLE
   - It finds all Slack channels that match the user's TEAM_NAME
   - It returns "Channel Name" only where both attributes intersect

Proccess can be repeated as many times as needed.

# Example

A 'CSR' from 'EN TN TWW' may only see where both the 'CSR' column and 'EN TN TWW' column are marked 'TRUE'. This means that even if another team has the same title (CSR), they won’t get access unless its provisioned for a team. 

Suggested examples to check : 

name15.surname15@vinted.com 
name3.surname3@vinted.com ( Same team, same attributem but with access)

Team Lead of same team 
name8.surname8@vinted.com









