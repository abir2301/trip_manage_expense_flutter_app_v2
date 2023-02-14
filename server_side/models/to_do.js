const mongoose = require("mongoose");
const joi = require("joi");
const jwt = require("jsonwebtoken");
const { required, ref, boolean, bool } = require("joi");
const schema = mongoose.Schema;
const toDoSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    minlength: 2,
    maxlength: 45,
    unique: true,
  },
  isDone: {
    type: Boolean,
    required: false ,
    default: false ,
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

const ToDo = new mongoose.model("ToDo", toDoSchema);
function toDoValidate(toDo) {
  const schema = joi.object({
    name: joi.string().required(),
    date: joi.date().required(),
   
  });

  return schema.validate(toDo);
}
exports.ToDo = ToDo;
exports.toDoValidate = toDoValidate;
