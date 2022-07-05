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
        .withGraphFetched("current_status");
      return ciyt;
    } catch (err) {
      return err;
    }
  }

  // save weather data
  async saveWeatherData(location, current_status) {
    let locationData;
    let currentStatusData;
    console.log(location, "location service\n");
    try {
      console.log(location.name, "location.name\n\n\n");
      const locationData = await City.query().where("name", location.name);
      // console.log(
      //   locationData,
      //   "locationData service ....\n",
      //   locationData[0].id,
      //   "id loca\n\n"
      // );
      if (locationData.length > 0) {
        const cityData = await City.query()
          .update(location)
          .where("name", locationData[0].name);
        current_status.city_id = locationData[0].id;
        const city_current_status = await CurrentStatus.query()
          .update(current_status)
          .where("city_id", locationData[0].id);
        return {
          status: "success",
          message: `${locationData[0].name} city data updated successfully!`,
          city: cityData,
          current_status: city_current_status,
        };
      } else {
        const cityData = await City.query().insertGraph(location);
        const getCityId = await City.query().where("name", cityData.name);
        current_status.city_id = getCityId[0].id;
        const city_current_status = await CurrentStatus.query().insertGraph(
          current_status
        );
        return { city: cityData, current_status: city_current_status };
      }
    } catch (err) {
      console.log(err, "hello my err!!\n\n");
      return err;
    }
  }
};
