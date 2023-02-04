const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User } = require("../models/user");
const _ = require("lodash");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
//login
router.post("/", async (req, res) => {
  const { error } = validate(req.body);
  if (error) {
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findOne({ email: req.body.email });
  if (!user) {
    res.send("email or password invalid ");
  }
  let pass = await bcrypt.compare(req.body.password, user.password);
  console.log("pass", pass);
  if (!pass) {
    res.send("email or password invalid ");
  } else {
    //res.send(_.pick(user, ["fullName", "email"]));
    const token = user.generateTokens();
    res.send(token);
  }
});
function validate(user) {
  const schema = joi.object({
    email: joi.string().min(3).max(255).required().email(),
    password: joi.string().min(8).max(1024).required(),
  });

  return schema.validate(user);
}

module.exports = router;
