const mongoose = require("mongoose");
const joi = require("joi");
const jwt = require("jsonwebtoken");
const { required, ref } = require("joi");
const schema = mongoose.Schema;
const expenseSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    minlength: 2,
    maxlength: 45,
    unique: true,
  },
  amount: {
    type: Number,
    required: true,
    default: 0,
  },
  date: {
    type: Date,
    required: true,
  },
  tripId: {
    type: schema.Types.ObjectId,
    ref: "Trip",
    required: false,
  },
  category: {
    type: String,
    required: false,
  },
 
});

const Expense = new mongoose.model("Expense", expenseSchema);
function expenseValidate(expense) {
  const schema = joi.object({
    name: joi.string().required(),
    date: joi.date().required(),
    amount: joi.number().required(),
    category: joi.string().min(2).max(255),
  });

  return schema.validate(expense);
}
exports.Expense = Expense;
exports.expenseValidate = expenseValidate;
