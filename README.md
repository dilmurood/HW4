# HW4
 The objective of this assignment is to practice and understand the concept of Networking, SQLite and the concept of creation of models.
# Project Overview:
My project comprises five Dart files: onBoard.dart, GetUserInfo.dart, DisplayUserInfo.dart, UserModel.dart and a helper function within the same file as the CustomListTile.

onBoard.dart:
This file creates an onboarding screen (onBoard) for the app.

build method: Defines the UI layout with a welcome message and a "Skip" button that navigates to GetUserInfo screen when pressed.
_storeOnBoardInfo method: Stores onboarding information using SharedPreferences.

GetUserInfo.dart:
This file defines the main screen (GetUserInfo) for displaying user information.

initState method: Fetches user data from an API using HTTP requests when the widget initializes.
fetchData method: Sends HTTP requests to retrieve user data from a URL and updates the UI accordingly.
build method: Constructs the UI, displaying user data in a list and providing buttons to load more users and navigate to the DisplayUserInfo screen.

CustomListTile Function:
Creates a custom ListTile widget to display user information with an option to add users to a model (currently marked as a TODO).

# Running the Project:
Project Setup:

Ensure Flutter is properly installed on your system.
Set up your project in an IDE like VS Code or Android Studio.
Make sure the required packages (http, shared_preferences, etc.) are added to your pubspec.yaml file.

Run the App:
Connect an emulator or a physical device.
Open a terminal/command prompt in your project directory.
Execute the command flutter run to launch the app on your connected device or emulator.
Understanding Execution:

When the app launches, the onBoard screen is displayed.
Pressing "Skip" navigates to the GetUserInfo screen, fetching user data and displaying it in a list.
The list can be expanded by tapping the "Add" floating action button to load more users.
Pressing the "Save" floating action button navigates to the DisplayUserInfo screen. 
