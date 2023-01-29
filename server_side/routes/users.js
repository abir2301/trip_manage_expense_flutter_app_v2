const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const _ = require("lodash");
const bcrypt = require("bcrypt");
router.post("/", async (req, res) => {
  const { error } = userValidate(req.body);
  if (error) {
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findOne({ email: req.body.email });
  if (!user) {
    user = new User(_.pick(req.body, ["fullName", "email", "password"]));
    const saltRounds = 10;
    user.password = await bcrypt.hash(user.password , saltRounds);
    await user.save();
    res.send(_.pick(user, ["fullName", "email"]));
    console.log("user add succesfully : user " , user)
  } else {
    res.status(404).send("user already exist  ");
  }
});

module.exports = router;
