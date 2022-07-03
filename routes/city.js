var express = require("express");
var router = express.Router();
const axios = require("axios");
const CityService = require("../services/city");
const Services = new CityService();

// landing page
router.get("/", (req, res) => {
  res.send({ success: "Welcome to the home page!" });
});

// save WeatherData
router.post("/addWeatherData", async (req, res) => {
  const name = req.query.name;
  axios
    .get(
      `https://api.weatherapi.com/v1/current.json?key=${process.env.API_KEY}&q=${name}`
    )
    .then(async (data) => {
      let location = data.data.location;
      let current_status = data.data.current;
      await Services.saveWeatherData(location, current_status)
        .then((locationData) => {
          res.send(locationData);
        })
        .catch((error) => {
          res.send(error);
        });
    })
    .catch((error) => {
      res.send(error.response.data);
    });
});

// get all locations data;
router.get("/cities", async (req, res) => {
  const allUsers = await Services.findAll();
  res.send(allUsers);
});

// get a city data by name;
router.get("/cityByName", async (req, res) => {
  const name = req.query.name;
  const locationByName = await Services.findByName(name);
  res.send(locationByName);
});

module.exports = router;
