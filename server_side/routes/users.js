const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const { Trip } = require("../models/trip");
const _ = require("lodash");
const bcrypt = require("bcrypt");
const auth = require("../middleware/auth");

//registration
router.post("/", async (req, res) => {
  const { error } = userValidate(req.body);
  if (error) {
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findOne({ email: req.body.email });
  if (!user) {
    user = new User(_.pick(req.body, ["fullName", "email", "password"]));
    const saltRounds = 10;
    user.password = await bcrypt.hash(user.password, saltRounds);
    await user.save();
    const token = user.generateTokens();
    res
      .header("x-auth-token", token)
      .send(_.pick(user, ["_id", "fullName", "email"]));
    console.log("user add succesfully : user ", user, token);
  } else {
    res.status(404).send("user already exist  ");
  }
});
// const req=express.request.header('x-auth-token',)
//get coonected user profile
router.get("/profile", auth, async (req, res) => {
  try {
    const user = await User.findById(req.user._id).select("-password");
    if (!user) {
      res.send("not found user");
    } else {
      res.send(user);
    }
  } catch (error) {
    res.send(error.message);
  }
});
//get trips
router.get("/trips", auth, async (req, res) => {
  try {
    const user = await User.findById(req.user._id).select("-password");
    if (!user) {
      res.send("not found user");
    } else {
      nb = 0;
      const result = [];
      const trips = user.tripsId;

      trips.forEach(async (id) => {
        const trip = await Trip.findOne({ _id: id }).select("-userId");
        result.push(trip);
        if (++nb === trips.length) {
          res.send(result);
        }
      });
    }
  } catch (error) {
    res.send(error.message);
  }
});
//edit profile
router.post("/update", auth, async (req, res) => {
  try {
    const user = await User.findById(req.user._id).select("-password");
    if (!user) {
      res.send("not found user");
    } else {
      User.findByIdAnd
      User.updateOne(
        { _id: req.user._id },
        {
          $set: {
            fullName: req.body.fullName,
            // email: req.body.email ? req.body.email : user.email,
          },
        }
      );
     
    }
  } catch (error) {
    res.send(error.message);
  }
});

module.exports = router;
