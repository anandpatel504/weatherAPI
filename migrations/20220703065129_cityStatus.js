exports.up = function (knex) {
  return knex.schema.createTable("current_status", (table) => {
    table.increments().primary();
    table.integer("city_id").notNullable().references("id").inTable("cities");
    table.bigInteger("last_updated_epoch", 55);
    table.timestamp("last_updated");
    table.decimal("temp_c", 15);
    table.decimal("temp_f", 14, 2);
    table.bigInteger("is_day");
    table.jsonb("condition");
    table.decimal("wind_mph", 14, 2);
    table.decimal("wind_kph");
    table.decimal("wind_degree");
    table.string("wind_dir");
    table.decimal("pressure_mb");
    table.decimal("pressure_in", 14, 2);
    table.decimal("precip_mm", 14, 2);
    table.decimal("precip_in", 14, 2);
    table.decimal("humidity");
    table.decimal("cloud");
    table.decimal("feelslike_c", 14, 2);
    table.decimal("feelslike_f", 14, 2);
    table.decimal("vis_km", 14, 2);
    table.decimal("vis_miles");
    table.decimal("uv");
    table.decimal("gust_mph", 14, 2);
    table.decimal("gust_kph", 14, 2);
    table.timestamp("created_at").defaultTo(knex.fn.now());
  });
};

exports.down = function (knex) {
  return knex.schema.dropTable("current_status");
};
