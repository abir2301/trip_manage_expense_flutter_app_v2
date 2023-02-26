const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const { Trip, tripValidate } = require("../models/trip");
const { ToDo } = require("../models/to_do");
const _ = require("lodash");
const bcrypt = require("bcrypt");
const auth = require("../middleware/auth");
const { result } = require("lodash");
const { deleteExpense } = require("../usecases/expense_usecase");

//add new trip
router.post("/", auth, async (req, res) => {
  const { error } = tripValidate(req.body);
  if (error) {
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
   
    const trip = new Trip({
      name: req.body.name,
      desciption: req.body.desciption,
      dateStart: req.body.dateStart,
      dateEnd: req.body.dateEnd,
      budget: req.body.budget,
    });
    trip.userId = user._id;
    trip.save();
    console.log(user);
    const array = user.tripsId;
    array.push(trip._id);
    user.save();
    res.send(trip);
  }
});
//get todos
router.get("/todos/:id", auth, async (req, res) => {
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    const trip = await Trip.findById(req.params.id);
    if (trip) {
      const array = trip.todos;
      console.log(array);
      if (array.length === 0) {
        res.send("no expense yet ");
      }

      let result = [];
      nb = 0;
      array.forEach(async (id) => {
        const todo = await ToDo.findOne({ _id: id }).select("-tripId");
        result.push(todo);
        if (++nb === array.length) {
          res.send(result);
        }
      });
    } else {
      res.send("verify  trip id ");
    }
  }
});
// update  trip
router.post("/:id", auth, async (req, res) => {
  const { error } = tripValidate(req.body);
  if (error) {
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    // res.send(user)
    const trip = await Trip.updateOne(
      { _id: req.params.id },
      {
        $set: {
          name: req.body.name,
          desciption: req.body.desciption,
          dateStart: req.body.dateStart,
          dateEnd: req.body.dateEnd,
          budget: req.body.budget,
        },
      }
    );
    res.json({ message: "updated  trip succesfully ", trip: trip });
  }
});
//delete   trip
router.delete("/:id", auth, async (req, res) => {
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    const trip = await Trip.findByIdAndRemove(req.params.id);
    if (trip) {
      const array = trip.expenses;
      array.forEach(async (id1) => {
        await deleteExpense(id1, req.user._id);
      });
      res.json({ message: "trip  deleted succesfully ", trip: trip });
    } else {
      res.send("not found trip");
    }
  }
});

module.exports = router;
