const mongoose = require("mongoose");
const joi = require("joi");
const jwt = require("jsonwebtoken");
const { required, ref } = require("joi");
const schema = mongoose.Schema;
const categorySchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    minlength: 2,
    maxlength: 45,
    unique: true,
  },
  userId: {
    type: schema.Types.ObjectId,
    ref: "User",
    required: false,
  },
  expensesId: {
    type: [{ type: schema.Types.ObjectId, ref: "Expense" }],
    required: false,
  },
});

const Category = new mongoose.model("Category", categorySchema);
function categoryValidate(Category) {
  const schema = joi.object({
    name: joi.string().min(2).max(255).required(),
  });

  return schema.validate(Category);
}
exports.Category = Category;
exports.categoryValidate = categoryValidate;
