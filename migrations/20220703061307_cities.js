exports.up = function (knex) {
  return knex.schema.createTable("cities", (table) => {
    table.increments().primary();
    table.string("name", 255).unique().notNullable();
    table.string("region", 255);
    table.string("country", 255).notNullable();
    table.decimal("lat", 14, 2);
    table.decimal("lon", 14, 2);
    table.string("tz_id", 255);
    table.bigInteger("localtime_epoch", 55);
    table.timestamp("localtime");
    table.timestamp("created_at").defaultTo(knex.fn.now());
  });
};

exports.down = function (knex) {
  return knex.schema.dropTable("cities");
};
