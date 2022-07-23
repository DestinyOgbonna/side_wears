# building_ui
How to Use
Step 1:

Download or clone this repo by using the link below:

https://github.com/DestinyOgbonna/side_wears.git

Step 2:

Go to projects root and execute the following command in console to get the required dependencies:

flutter pub get 
Step 3:

Hide Generated Files
In-order to hide generated files, navigate to Android Studio -> Preferences -> Editor -> File Types and paste the below lines under ignore files and folders section:

App Features:
Splash
Login
Home
Routing
Theme
Database(Firebase)
Riverpod(State Management)

Folder Structure
Here is the core folder structure which flutter provides.

flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
Here is the folder structure we are using in this project

lib/
|- enums/
|- exports/
|- model/
|- providers/
|- routes
|- screens
|- shared
|- main.dart

Main
This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.




