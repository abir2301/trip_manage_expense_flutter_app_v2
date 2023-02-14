const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User } = require("../models/user");
const { Category, categoryValidate } = require("../models/category");

const _ = require("lodash");

async function addCategory(req) {
  const { error } = categoryValidate(req.body);
  if (error) {
    return error.details[0].message;
  }
  let user = await User.findById(req.user._id);
  if (!user) {
    return " user dont authorised ";
  } else {
    const category1 = await Category.findOne({ name: req.body.name });
    if (category1) {
      return "category already exist ";
    } else {
      const category = new Category({
        name: req.body.name,
      });
      category.userId = user._id;
      category.save();
      user.categoriesId.push(category._id);
      user.save();
      return category;
    }
  }
}
async function updateCategory(id, name, userId) {
  body = { name: name };
  const { error } = body;
  if (error) {
    return error.details[0].message;
  }
  let user = await User.findById(userId);
  if (!user) {
    return " user dont authorised ";
  } else {
    try {
      const category = await Category.updateOne(
        { _id: id },
        {
          $set: {
            name: name,
          },
        }
      );
      return { message: "updated  category succesfully " };
      console.log(category);
    } catch (error) {
      return error.message;
    }
  }
}
async function deleteCategory(id, userId) {
  let user = await User.findById(userId);
  if (!user) {
    return "user dont authorised ";
  } else {
    try {
      var cat = await Category.findByIdAndRemove(id);
      if (cat) {
        // Category.deleteOne({ name: req.body.name });
        const index = user.categoriesId.indexOf(req.params.id);
        user.categoriesId.splice(index, 1);
        user.save();
        console.log(user.categoriesId.indexOf(req.params.id));
        return ({ message: "delete succesfully ", "category ": cat });
      } else {
        return "not found category ";
      }
    } catch (error) {}
  }
}
exports.deleteCategory = deleteCategory;
exports.addCategory = addCategory;
exports.updateCategory = updateCategory;
