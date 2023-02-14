const mongoose = require("mongoose");
const joi = require("joi");
const jwt = require("jsonwebtoken");
const { required, ref, boolean } = require("joi");
const schema = mongoose.Schema;
const tovisitSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    minlength: 2,
    maxlength: 45,
    unique: true,
  },
  isDone: {
    type: boolean,
    required: false ,
    default: false,
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
});

const Tovisit = new mongoose.model("Tovisit", tovisitSchema);
function tovisitValidate(tovisit) {
  const schema = joi.object({
    name: joi.string().required(),
    date: joi.date().required(),
  });

  return schema.validate(tovisit);
}
exports.Tovisit = Tovisit;
exports.tovisitValidate = tovisitValidate;
