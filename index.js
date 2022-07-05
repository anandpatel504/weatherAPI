const express = require("express");
const app = express();
const morgan = require("morgan");
const cors = require("cors");
const Dotenv = require("dotenv");
Dotenv.config({ path: `${__dirname}/.env` });

app.use(cors());
app.use(morgan("dev"));
app.use(express.json());

const locationRouter = require("./routes/city");

//Routes
app.use(locationRouter);

// PORT
const PORT = process.env.PORT || 2023;

// the PORT listener
app.listen(PORT, () => {
  console.log(`Server is running on ${PORT} PORT`);
});
