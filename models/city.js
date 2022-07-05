const Joi = require("joi");
const { Model } = require("./helper/index");

module.exports = class City extends Model {
  static get tableName() {
    return "cities";
  }

  static get joiSchema() {
    return Joi.object({
      id: Joi.number().integer().greater(0),
      name: Joi.string().unique().required(),
      region: Joi.string(),
      country: Joi.string().required,
      lat: Joi.number(),
      lon: Joi.number(),
      tz_id: Joi.string(),
      localtime_epoch: Joi.number(),
      localtime: Joi.date(),
      created_at: Joi.date(),
    });
  }

  static get relationMappings() {
    const CurrentStatus = require("./currentStatus");
    return {
      current_status: {
        relation: Model.HasOneRelation,
        modelClass: CurrentStatus,
        join: {
          from: "cities.id",
          to: "current_status.city_id",
        },
      },
    };
  }
  $beforeInsert() {
    const now = new Date();
    this.created_at = now;
  }
};
