const Joi = require("joi");
const { Model } = require("./helper/index");

module.exports = class CurrentStatus extends Model {
  static get tableName() {
    return "current_status";
  }

  static get joiSchema() {
    return Joi.object({
      id: Joi.number().integer().greater(0),
      city_id: Joi.integer(),
      last_updated_epoch: Joi.number().integer(),
      last_updated: Joi.date(),
      temp_c: Joi.number(),
      temp_f: Joi.number(),
      is_day: Joi.number(),
      condition: Joi.object(),
      wind_mph: Joi.number(),
      wind_kph: Joi.number(),
      wind_degree: Joi.number(),
      wind_dir: Joi.string(),
      pressure_mb: Joi.number(),
      pressure_in: Joi.number(),
      precip_mm: Joi.number(),
      precip_in: Joi.number(),
      humidity: Joi.number(),
      cloud: Joi.number(),
      feelslike_c: Joi.number(),
      feelslike_f: Joi.number(),
      vis_km: Joi.number(),
      vis_miles: Joi.number(),
      uv: Joi.number(),
      gust_mph: Joi.number(),
      gust_kph: Joi.number(),
      created_at: Joi.date(),
    });
  }

  $beforeInsert() {
    const now = new Date();
    this.created_at = now;
  }
};
