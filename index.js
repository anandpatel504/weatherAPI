const express = require("express");
const app = express();
const axios = require("axios");
const morgan = require("morgan");
const cors = require("cors");
const Dotenv = require("dotenv");
Dotenv.config({ path: `${__dirname}/.env` });

app.use(cors());
app.use(morgan("dev"));
app.use(express.json());

// weather API key
// API-key = '6347c5772cc84d4bb6731600220307'
// Base URL: http://api.weatherapi.com/v1

// axios
//   .get(
//     "https://api.weatherapi.com/v1/current.json?key=6347c5772cc84d4bb6731600220307&q=Kolkata"
//   )
//   .then((data) => {
//     console.log(data.data, "hello weather data");
//     var wdata = data.data;
//     console.log(typeof wdata.location["localtime_epoch"], "type hai bhai...");
//   })
//   .catch((error) => {
//     console.log(error);
//   });

const locationRouter = require("./routes/city");

//Routes
app.use(locationRouter);

// PORT
const PORT = process.env.PORT || 2023;

// the PORT listener
app.listen(PORT, () => {
  console.log(`Server is running on ${PORT} PORT`);
});
