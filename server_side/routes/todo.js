const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const { ToDo, toDoValidate } = require("../models/to_do");

const auth = require("../middleware/auth");
const { Trip } = require("../models/trip");
const _ = require("lodash");
//create new todo

router.post("/:id", auth, async (req, res) => {
  const expenseReq = req.body;
  const { error } = toDoValidate(expenseReq);

  if (error) {
    console.log("errror");
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findById(req.user._id);
  const trip = await Trip.findById(req.params.id);

  if (!user) {
    res.send(" user dont authorised ");
  } else {
    if (!trip) {
      return res.send("dont found trip ");
    } else {
      const todo = new ToDo({
        name: req.body.name,
        date: expenseReq.date,
      });
      trip.todos.push(todo._id);
      trip.save();
      todo.tripId = trip._id;
      todo.save();
      res.status(200).send( todo);
    }
  }
});
// // //update todo name and date
router.post("/update/:id", auth, async (req, res) => {
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    try {
      const todo = await ToDo.updateOne(
        { _id: req.params.id },
        {
          $set: {
            name: req.body.name,
            date: req.body.date,
          },
        }
      );
      res.json({ message: "updated  todo  succesfully " });
      console.log(todo);
    } catch (error) {
      res.send(error.message);
    }
  }
});

//delete todo
router.delete("/delete/:id", auth, async (req, res) => {
  let user = await User.findById(req.user._id);
  let todo = await ToDo.findById(req.params.id);
  if (todo) {
    let trip = await Trip.findById(todo.tripId);

    if (!user) {
      res.send("user dont authorised ");
    } else {
      try {
        if (trip) {
          var todo_1 = await ToDo.findByIdAndRemove(req.params.id);
          if (todo_1) {
            const indexC = trip.todos.indexOf(req.params.id);
            trip.todos.splice(indexC, 1);
            trip.save();

            res.json({
              message: "delete succesfully expense  ",
              "todo ": todo,
            });
          }
        } else {
          res.send("error while deleting todo card ");
        }
      } catch (error) {
        res.send("error ");
      }
    }
  } else {
    res.send("invalid input id ");
  }
});
router.post("/isDone/:id", auth, async (req, res) => {
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    try {
      const todo = await ToDo.updateOne(
        { _id: req.params.id },
        {
          $set: {
            isDone: true,
            
          },
        }
      );
      res.json({ message: "todo is done " });
      console.log(todo);
    } catch (error) {
      res.send(error.message);
    }
  }
});
module.exports = router;
