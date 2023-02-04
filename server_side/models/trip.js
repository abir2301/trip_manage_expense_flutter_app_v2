const mongoose = require("mongoose");
const joi = require("joi");
const jwt = require("jsonwebtoken");
const { required, ref } = require("joi");
const schema = mongoose.Schema;
const tripSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 45,
  },
  desciption: {
    type: String,
    required: true,
    minlength: 3,
    maxlength: 255,
  },
  dateStart: {
    type: Date,
    required: true,
  },
  dateEnd: {
    type: Date,
    required: true,
  },
  budget: {
    type: Number,
    default: 0,
  },
  userId: {
    type: schema.Types.ObjectId,
    ref: "User",
    required: false,
  },
});

const Trip = new mongoose.model("Trip", tripSchema);
function tripValidate(trip) {
  const schema = joi.object({
    name: joi.string().min(3).max(255).required(),
    desciption: joi.string().min(3).max(255).required(),
    dateStart: joi.date().required(),
    dateEnd: joi.date().required(),
  });

  return schema.validate(trip);
}
exports.Trip = Trip;
exports.tripValidate = tripValidate;
