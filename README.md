BlogApp README
=====================

Setup and Run the Application
--------------------------------

### Step 1: Clone the Repository

git clone https://github.com/your-username/BlogApp.git

### Step 2: Install Dependencies

bundle install

### Step 3: Database Setup

rails db:create
rails db:migrate

### Step 4: Start the Server

rails server

Open a web browser and navigate to `http://localhost:3000` to access the application.

Testing
------------

To run the tests, use the following command:

bundle exec rspec

Notes
------

* Make sure you have Ruby and Rails installed on your machine.
* This application uses Devise for user authentication and Pundit for authorization.
* The application uses Bootstrap for styling.
* The application has been tested with RSpec.

Troubleshooting
-----------------

If you encounter any issues, check the Rails server logs for errors. You can also try running `rails db:reset` to reset the database.

License
-------

The BlogApp application is licensed under the MIT License.

Author
------

Kanika Matta

Version
-------

1.0

Acknowledgments
---------------

* Ruby on Rails for providing a robust framework for building web applications.
* Devise for providing a simple and secure authentication system.
* Pundit for providing a flexible authorization system.
* Bootstrap for providing a responsive and customizable styling framework.
* RSpec for providing a robust testing framework.
* GitHub for providing a platform for version control and collaboration.