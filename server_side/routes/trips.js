const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const { Trip, tripValidate } = require("../models/trip");
const _ = require("lodash");
const bcrypt = require("bcrypt");
const auth = require("../middleware/auth");
//add ne trip
router.post("/", auth, async (req, res) => {
  const { error } = tripValidate(req.body);
  if (error) {
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    // res.send(user)
    const trip = new Trip({
      name: req.body.name,
      desciption: req.body.desciption,
      dateStart: req.body.dateStart,
      dateEnd: req.body.dateEnd,
    });
    trip.userId = user._id;
    trip.save();
    user.tripsId.push(trip._id);
    user.save();
    res.send(trip);
  }
});

module.exports = router;
