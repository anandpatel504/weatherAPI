# WeatherAPI
**Check your current weather**

In this project, I have made a backend and frontend of weatherAPI website using NodeJS and ReactJS.

## Backend Requirements

## Installation process and Execution

First and foremost, If you are using Linux-based-OS, open your terminal and clone the weather app repository (`git clone https://github.com/anandpatel504/weatherAPI.git`) and select the project. then install the dependendencies by writing the following command-
This will install NodeJS version-12 and npm version-6 on your system.

        npm install

Next, make sure you have setuped `postgreSQL` database in your machine.

## Import db SQL file

There is a `weatherData.sql` file already present in the `dbSQL/` folder. You have to import this file to an empty database. For this, make a new database first, and navigate to the dbSQL/ directory and then write the following commands:
Import the schema using `sudo -u postgres psql <db_name> < weatherData.sql`
For checking the data, log into your user, by writing `sudo -u postgres psql` You would be asked for your password. Now, you can use database with all its tables data.

Next, navigate to the folder where, `index.js`file is located. You can start the local server by writing`npm start`on the terminal.
You can always kill your running port by writing,`killall -9 node`on the terminal.
Now, you need to install postman, that helps you to develop APIs and getting responses from it, by writing the following commands on your terminal.

       sudo apt-get install snap
       snap install postman

## Frontend Requirements

In the project directory `weatherApp-Fe/` you can install the dependencies `npm install` , and then you can run:

### `npm start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `npm run build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

**Happy coding :)**