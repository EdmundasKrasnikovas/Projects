import pandas as pd

members = pd.read_csv('Team_Members.csv')
title_channels = pd.read_csv('Slack_Channels.csv')
team_channels = pd.read_csv('Slack_Channels_Teams.csv')

# Using loop to be able to check multiple emails while using a script, removing possible spaces
while True:
    EMAIL = input("Enter the email address to check for Slack access (or type 'exit' to quit): ").strip()
    if EMAIL.lower() == 'exit':
        print("Have a great day!")
        break
    
    #checking if email is in the members list
    user_row = members[members['Email'] == EMAIL]
    if user_row.empty:
        print(f"User with email {EMAIL} not found")
    else:
        # Getting user data making sure to get the first row
        user_data = user_row.iloc[0]
        title = user_data['Title']
        team = user_data['Team_Name']
        slack_access = user_data['Slack_Access']
        
        print(f"User {EMAIL}")
        print(f"Title: {title}")
        print(f"Team Name: {team}")
        print(f"Slack Access: {slack_access}")
        print()
        
        # Checking if user has Slack access
        if not slack_access:
            print(f"User {EMAIL} does not have Slack access provisioned")
        else:
            # Getting channels where user's TITLE has access 
            title_access = title_channels.loc[title_channels[title] == True, 'Channel Name']
            set_title_channels = set(title_access)
            
            # Getting channels where user's TEAM has access
            team_access = team_channels.loc[team_channels[team] == True, 'Channel name']
            set_team_channels = set(team_access)
            
            # Finding intersection - channels where BOTH title AND team have access
            final_channels = set_title_channels.intersection(set_team_channels)
            
            if final_channels:
                print("Provided channels")
                for channel in final_channels:
                    print(f"  - {channel}")
                print()
                
                # Creating a list for IT to be able to copy and paste into a ticket
                channel_list = ";".join([f"channel {channel}" for channel in final_channels])
                print(f"List for IT: {channel_list}")
    
    print("=" * 50)
    print()
 