const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const { Category, categoryValidate } = require("../models/category");
const { Expense, expenseValidate } = require("../models/expense");
const auth = require("../middleware/auth");
const { Trip } = require("../models/trip");
const _ = require("lodash");

async function addExpense(idT, name, date, amount, category, userId) {
  const expenseReq = {
    name: name,
    date: date,
    amount: amount,
    category: category,
  };
  const { error } = expenseValidate(expenseReq);

  if (error) {
    console.log("errror");
    return error.details[0].message;
  }
  let user = await User.findById(userId);
  const trip = await Trip.findById(idT);
  const category1 = await Category.findOne({ name: category });
  if (!user) {
    return " user dont authorised ";
  } else {
    if (!trip) {
      return "dont found trip ";
    }

    const expense = await Expense.findOne({ name: name });
    if (expense) {
      return "expense already exist ";
    } else {
      if (trip.budget - expenseReq.amount <= 0) {
        return "limited budget ";
      } else {
        const expense = new Expense({
          name: name,
          date: date,
          amount: amount,
        });
        trip.expenses.push(expense._id);
        trip.save();
        expense.userId = userId;
        if (category) {
          category1.expensesId.push(expense._id);
          category1.save();
          expense.category = category;
          expense.tripId = trip._id;
          expense.save();
          return expense;
        } else {
          return "dont find category ";
        }
      }
    }
  }
}
async function deleteExpense(idE, userId) {
  let user = await User.findById(userId);
  let expense = await Expense.findById(idE);
  if (expense) {
    const trip = await Trip.findById(expense.tripId);
    const  category = await Category.findOne({ name: expense.category });
   
    if (!user) {
      return "user dont authorised ";
    } else {
      try {
        if (trip && category) {
          var exp = await Expense.findByIdAndRemove(idE);
          if (exp) {
            const indexC = category.expensesId.indexOf(idE);
            category.expensesId.splice(indexC, 1);
             category.save();
            //console.log(trip);
            const indexT = trip.expenses.indexOf(idE);

            trip.expenses.splice(indexT, 1);
            trip.save();

            return "delete succesfully expense  ";
          }
        }
      } catch (error) {
        return "error ";
      }
    }
  } else {
    return "invalid input id ";
  }
}
async function updateExpense(idE, name, date, userId) {
  let user = await User.findById(userId);
  if (!user) {
    return " user dont authorised ";
  } else {
    try {
      const expense = await Expense.updateOne(
        { _id: idE },
        {
          $set: {
            name: name,
            date: date,
          },
        }
      );
      return { message: "updated  expense  succesfully " };
      console.log(expense);
    } catch (error) {
      return error.message;
    }
  }
}
async function addAmount(idE, amount, userId) {
  let user = await User.findById(userId);
  if (!user) {
    return " user dont authorised ";
  } else {
    try {
      const expense_1 = await Expense.findById(idE);
      const expense = await Expense.updateOne(
        { _id: idE },
        {
          $set: {
            amount: expense_1.amount + amount,
          },
        }
      );
      return { message: "update amount improving " };
      console.log(expense);
    } catch (error) {
      return error.message;
    }
  }
}
async function removeAmount(idE, amount, userId) {
  let user = await User.findById(userId);
  if (!user) {
    return " user dont authorised ";
  } else {
    try {
      const expense_1 = await Expense.findById(IDBRequest);
      if (expense_1.amount >= amount) {
        const expense = await Expense.updateOne(
          { _id: idE },
          {
            $set: {
              amount: expense_1.amount - amount,
            },
          }
        );
        return { message: "update amount reducing " };
        console.log(expense);
      } else {
        return " not enougth ";
      }
    } catch (error) {
      return error.message;
    }
  }
}
exports.addExpense = addExpense;
exports.deleteExpense = deleteExpense;
exports.updateExpense = updateExpense;
exports.addAmount = addAmount;
exports.removeAmount = removeAmount;
