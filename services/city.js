const City = require("../models/city");
const CurrentStatus = require("../models/currentStatus");

module.exports = class CityService {
  // find all cities data
  async findAll(txn) {
    const cities = await City.query(txn).withGraphFetched("crrent_status");
    console.log(cities, "txn cities");
    return cities;
  }

  // find a city data by name
  async findByName(name) {
    try {
      const ciyt = await City.query()
        .throwIfNotFound()
        .where("name", name)
        .withGraphFetched("crrent_status");
      return ciyt;
    } catch (err) {
      return err;
    }
  }

  // save weather data
  async saveWeatherData(location, current_status) {
    try {
      const cityData = await City.query().insertGraph(location);
      const getCityId = await City.query().where("name", cityData.name);
      current_status.city_id = getCityId[0].id;
      const city_current_status = await CurrentStatus.query().insertGraph(
        current_status
      );
      return { city: cityData, current_status: city_current_status };
    } catch (err) {
      return err;
    }
  }
};
