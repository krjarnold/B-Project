# Bonobos Full-Stack Homework- Kaelyn Arnold

###[Live site on Heroku](https://bonobos.herokuapp.com/)

![Bonobos Project](/app/assets/images/bonobos_project.png)

#####Project information
  * This project was build using Ruby on Rails and React.js
  * It is hosted live on Heroku at https://bonobos.herokuapp.com/
  * Requires:
    * Rails version 4.2.6
    * NPM version 3.9.3
    * Node version 6.2.1
    * PostgreSQL (can download here: https://www.postgresql.org/)

#####To set up from Github repository for viewing/editing:
  * Clone repository: https://github.com/krjarnold/B-Project.git
  * Navigate to repository
  * Make sure that PostgreSQL is running
  * Run- bundle exec bundle install
  * Run- npm install
  * In another terminal window run- webpack -w (to keep webpack running)
  * Open another terminal window and run- bundle exec rails server
  * View webpage locally on http://localhost:3000/#/

#####To seed database from CSV file
  * Files are located in lib/seeds (were originally pulled raw from Github full-stack homework repository)
  * File name and path much match original for seeds file to run
  * To run migrations run- rake db:migrate
  * To seed database run- rake db:seed


#####To view the json sent up on api calls from Rails (No React front-end)
  * Go to http://localhost:3000/
  * To view all products with their inventories
    * Go to http://localhost:3000/api/products
  * To view a specific product
    * Go to http://localhost:3000/api/products/1 (or any number at the end between 1-4)
