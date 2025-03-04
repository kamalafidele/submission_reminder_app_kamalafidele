#!/bin/bash

# Prompt the user for their name
read -p "Enter your name: " username

# Define the main directory name
main_dir="submission_reminder_${username}"

# Create the main directory and subdirectories
mkdir -p "$main_dir/app" "$main_dir/modules" "$main_dir/assets" "$main_dir/config"

# Create and populate config.env
cat <<EOL > "$main_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create and populate functions.sh
cat <<'EOL' > "$main_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL

# Make functions.sh executable
chmod +x "$main_dir/modules/functions.sh"

# Create and populate reminder.sh
cat <<'EOL' > "$main_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

# Make reminder.sh executable
chmod +x "$main_dir/app/reminder.sh"

# Create and populate submissions.txt
cat <<EOL > "$main_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Alice, Math Homework, not submitted
Bob, Science Project, submitted
Charlie, History Essay, not submitted
David, English Report, submitted
Emma, Physics Lab, not submitted
EOL

# Create and populate startup.sh
cat <<'EOL' > "$main_dir/startup.sh"
#!/bin/bash

echo "Starting the Reminder App..."
bash ./app/reminder.sh
EOL

# Make startup.sh executable
chmod +x "$main_dir/startup.sh"

# Final message
echo "Environment setup complete. Navigate to '$main_dir' and run 'bash startup.sh' to start the application."

