# Dart-Quiz-Game

a.Group Members:

⋅⋅* Muhammad Firdaus Bin Mahmad Razelan (1717977)
⋅⋅* Modou Lamin Ceesay(1335539)

b. Title of the project
Quiz Game

c. Introduction
About Quiz Game: A Flutter based mobile application meant to test players knowledge especially in the Arts and Science category. The app uses Firebase as a backend server to store a player's profile and their highscore. We aim to set up Quiz Game as an intuitive platform for users to test their knowledge in a fun and wonderful experience. For initial analysis,we have tried some of the quiz-based apps in the market and we realized that most of them were provided with features such as multiplayer,live ranking system and sharing. We come to a conclusion that in order to develop such an application with such features requires ample time in development and due to feasibility in time issues we decided only to include necessary features such as live ranking and user authentication to make the most of Quiz Game.

d. Objectives

The are 4 objectives outlined in Quiz Game:

    Intuitive: To provide up-to-date and user-friendly experience in role-playing games
    Short yet interesting test: 2 Categories are provided, Arts and Science. The questions are designed to be mind-challenging thus sparking interest in users to know more about the field.
    Competitive spirit between users: We provide a live ranking feature in which will display current high score among users of the app. This will inspire users to motivate themselves in becoming the top high scorer of the quiz.
    Spark interest for users to learn: We aim to motivate users to gain knowledge as well as providing a platform for them to test their knowledge.This wheel of learning process are expected put users at competitive edge in terms of gaining benefits from their knowledge

e. Features and functionalities

i. Sign up and login

    User need to sign up first before entering the quiz game
    After the account has been created, the user can then login.

ii. Score and Rankings

    There will be a score recorded for each submission of answers.
    The score will determine user rankings
    The higher the score the higher the rankings

iii. List of Questions (Categorical)

    The list of questions will be sequential.
    Players will be unable to go back to previous questions.
    A total of 5 questions for each category.

iv. Firebase

    Storage for user credentials
    Storage for user’s score and rank
    Storage for questionnaires

f. List of Components

i) Presentational Component(UI and Widgets)
- View
- Text Input
- Button
- Section List
ii) Container Component
- onPress
-Logic err0r checking on login page

iii)Backend
<ol>
    <li>-User Authentication(Firebase Authentication).</li>
    <li>-Firebase’s Cloud Firestore/Real time database for storing questions.</li>
</ol>



iv)Plugins
<ol>
<li>-Pub.dev to install libaries</li>
<li>-Firebase_auth for authentication process </li>
<li>-top-snackbar-flutter</li>
</ol> 


Navigation Diagram:

![alt text](https://github.com/edrazi90/Dart-Quiz-Game/blob/main/NavigationDiagram.jpg "Navigation Map")

Sequence Diagram:
![alt text](https://github.com/edrazi90/Dart-Quiz-Game/blob/main/SequenceDiagram.jpg "sequence")

References:
<ol>
 <li>https://medium.com/flutter-community/flutter-how-to-build-a-quiz-game-596d0f369575</li>
<li>https://github.com/fireship-io/flutter-firebase-quizapp-course</li>
<li>https://vincenttechblog.com/build-a-quiz-app-using-flutter-for-android-and-ios/</li>
</ol>


