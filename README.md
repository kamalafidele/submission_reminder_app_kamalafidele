# Submission Reminder App

This project is a shell-based application that reminds students about pending assignment submissions.

## 📂 Project Structure
The project is structured as follows:

submission_reminder_kamalafidele/ ├── app/ │ └── reminder.sh ├── modules/ │ └── functions.sh ├── assets/ │ └── submissions.txt ├── config/ │ └── config.env ├── startup.sh └── create_environment.sh

### 📌 Files Overview:
- `create_environment.sh` - Sets up the project directory structure.
- `startup.sh` - Starts the application.
- `app/reminder.sh` - Main script for sending reminders.
- `modules/functions.sh` - Functions for handling submissions.
- `config/config.env` - Configuration file for assignment details.
- `assets/submissions.txt` - List of student submissions.

## 🚀 How to Run the Application
Follow these steps to set up and run the application.

### 1️⃣ Clone the Repository  
Run the following command in your terminal:  
```bash
git clone https://github.com/kamalafidele/submission_reminder_app_kamalafidele.git
cd submission_reminder_app_kamalafidele

2️⃣ Run the Setup Script
This will create the necessary directories and files for the application.

chmod +x create_environment.sh
./create_environment.sh

3️⃣ Start the Application
After setting up the environment, start the application with:

chmod +x startup.sh
./startup.sh

🛠️ How It Works
The script reads the submissions.txt file.
It checks which students haven't submitted their assignments.
It prints reminders for those students.

Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!

📌 Notes:
Ensure you have execution permissions for .sh files (chmod +x).
Modify config.env to change assignment details.
Add more student records to submissions.txt to test with different cases.


