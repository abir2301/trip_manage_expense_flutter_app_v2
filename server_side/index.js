const express = require("express");
const mongoose = require("mongoose");
const users = require ('./routes/users')
const app = express();
const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.get("/", (req, res) => {
  res.send("manage rip expense app ");
});
app.use("/api/users", users );
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
  
