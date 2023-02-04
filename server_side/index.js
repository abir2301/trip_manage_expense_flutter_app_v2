const express = require("express");
const mongoose = require("mongoose");
const users = require("./routes/users");
const auth = require("./routes/auth");
const trips = require("./routes/trips");
const app = express();
const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.get("/", (req, res) => {
  res.send("manage rip expense app ");
});
app.use("/api/users", users);
app.use("/api/auth", auth);
app.use("/api/trips", trips);
app.listen(3000, () => {
  console.log("app run on port 3000");
});
mongoose
  .connect("mongodb://localhost/tripExpense")
  .then(() => {
    console.log("db connected ");
  })
  .catch((error) => {
    console.log("error connecting to MongoDB:", error.message);
  });
