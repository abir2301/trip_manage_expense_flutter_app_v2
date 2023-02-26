const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const { Category, categoryValidate } = require("../models/category");
const {
  addExpense,
  deleteExpense,
  updateExpense,
  addAmount,
  removeAmount,
} = require("../usecases/expense_usecase");
const { Expense, expenseValidate } = require("../models/expense");
const auth = require("../middleware/auth");
const { Trip } = require("../models/trip");
const _ = require("lodash");
//create new expense

router.post("/:id", auth, async (req, res) => {
  const expenseReq = req.body;
  const { error } = expenseValidate(expenseReq);

  if (error) {
    console.log("errror");
    return res.status(404).send(error.details[0].message);
  }
  let user = await User.findById(req.user._id);
  const trip = await Trip.findById(req.params.id);
  const category = await Category.findOne({ name: req.body.category });
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    if (!trip) {
      return res.send("dont found trip ");
    }

    const expense = await Expense.findOne({ name: expenseReq.name });
    if (expense) {
      res.send("expense already exist ");
    } else {
      if (trip.budget - expenseReq.amount <= 0) {
        res.send("limited budget ");
      } else {
        const expense = new Expense({
          name: req.body.name,
          date: expenseReq.date,
          amount: expenseReq.amount,
        });
        trip.expenses.push(expense._id);
        trip.save();
        expense.userId = user._id;
        if (category) {
          category.expensesId.push(expense._id);
          category.save();
          expense.category = expenseReq.category;
          expense.tripId = trip._id;
          expense.save();
          res.send(
            _.pick(expense, ["_id", "name", "date", "category", "tripId"])
          );
        } else {
          res.send("dont find category ");
        }
      }
    }
  }
});
// //update expense name and date
router.post("/update/:id", auth, async (req, res) => {
  const result = await updateExpense(
    req.params.id,
    req.body.name,
    req.body.date,
    req.user._id
  );
  res.send(result);
});
// improve amount
router.post("/addAmount/:id", auth, async (req, res) => {
  const result = await addAmount(req.params.id, req.body.amount, req.user._id);
  res.send(result);
});
// remove from  amount
router.post("/removeAmount/:id", auth, async (req, res) => {
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send(" user dont authorised ");
  } else {
    try {
      const expense_1 = await Expense.findById(req.params.id);
      if (expense_1.amount >= req.body.amount) {
        const expense = await Expense.updateOne(
          { _id: req.params.id },
          {
            $set: {
              amount: expense_1.amount - req.body.amount,
            },
          }
        );
        res.json({ message: "update amount reducing " });
        console.log(expense);
      } else {
        res.send(" not enougth ");
      }
    } catch (error) {
      res.send(error.message);
    }
  }
});
// //delete  expense
router.delete("/delete/:id", auth, async (req, res) => {
  const result = await deleteExpense(req.params.id, req.user._id);
  res.send(result);
});

module.exports = router;
