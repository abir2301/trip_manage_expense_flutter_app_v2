const mongoose = require("mongoose");
const joi = require("joi");
const User = mongoose.model(
  "User",
  new mongoose.Schema({
    fullName: {
      type: String,
      required: true,
      minlength: 5,
      maxlength: 45,
    },
    email: {
      type: String,
      required: true,
      unique: true,
      minlength: 3,
      maxlength: 255,
    },
    password: {
      type: String,
      minlength: 8,
      maxlength: 1024,
    },
    tripsId: {
      type: [],
      required: false,
    },
  })
);
function userValidate(user) {
  const schema = joi.object({
    fullName: joi.string().min(3).max(45).required(),
    email: joi.string().min(3).max(255).required().email(),
    password: joi.string().min(8).max(1024).required(),
  });
  
  return schema.validate(user)
}
exports.User = User;
exports.userValidate = userValidate;
