Masterplan is a rails web application created by Naveen Pai for his senior CS Capstone project at Palo Alto High School. The app prototype can be found at https://thawing-oasis-25877.herokuapp.com/.

Currently, the app's functionality includes:

* User signup and secure login
* Session managment
* Photo upload

How it works:

The application models, which contain business logic and object relationships, can be found in app/models. Similarly, the application controllers, which manage how the user interacts with the data, can be found in app/controllers. The application views, embedded markup, are arranged by their corresponding controller in app/views. Note that csrf tokens are added automatically to form elements by way of embedded ruby markup.

The libraries used can be found in Gemfile. For example, bcrypt is used to handle password hashing for user login. Paperclip is used to assist with photo uploads. 

The structure of the user is defined in app/models/user.rb. Note that certain database fields not stated in the file are created automatically by rails (created_at, id, etc). The photo data model can be found in app/models/photo.rb. An important relationship to note is User has many Photos (and subsequently Photo belongs to User). 

User validation is handled in app/controllers/users_controller.rb, while session handling is managed in app/controllers/sessions_controller.rb. Helpers are defined in app/helpers/sessions_helper.rb to facilitate login/logut. 

The database schema and migration history can be found in the db directory.






