const mongoose = require("mongoose");
const joi = require("joi");
const express = require("express");
const router = express.Router();
const { User, userValidate } = require("../models/user");
const { Category, categoryValidate } = require("../models/category");
const { Expense } = require("../models/expense");
const auth = require("../middleware/auth");
const _ = require("lodash");
const { route } = require("./expense");
const {
  addCategory,
  updateCategory,
  deleteCategory,
} = require("../usecases/category_usecases");
const { result } = require("lodash");

//create new category
router.post("/", auth, async (req, res) => {
  const result = await addCategory(req);
  res.send(result.message);
});
//update category
router.post("/update/:id", auth, async (req, res) => {
  const result = await updateCategory(
    req.params.id,
    req.body.name,
    req.user._id
  );
  res.send(result);
});
//delete cat
router.delete("/delete/:id", auth, async (req, res) => {
  const result = await deleteCategory(req.params.id, req.user._id);
  res.send(result);
});
//delete many cat
router.delete("/delete/", auth, async (req, res) => {
  const cat_ids = req.body.array;
  console.log(cat_ids);
  let user = await User.findById(req.user._id);
  if (!user) {
    res.send("user dont authorised ");
  } else {
    try {
      cat_ids.forEach(async (id) => {
        var cat = await Category.findByIdAndRemove(id);
        if (cat) {
          const index = user.categoriesId.indexOf(id);
          user.categoriesId.splice(index, 1);

          // console.log(user.categoriesId.indexOf(id));
          res.json({ message: "delete succesfully ", "category ": cat });
        } else {
          console.log("not found category ");
        }
      });
      user.save();
    } catch (error) {}
  }
});
// get expense par categorie
router.get("/expenses/:id", auth, async (req, res) => {
  try {
    const user = await User.findById(req.user._id).select("-password");
    if (!user) {
      res.send("not found user");
    } else {
      const category = await Category.findById(req.params.id);
      if (category) {
        nb = 0;
        const result = [];
        const categoryExpenses = category.expensesId;

        categoryExpenses.forEach(async (id) => {
          const expense = await Expense.findOne({ _id: id }).select(
            "-category"
          );
          result.push(expense);
          if (++nb === categoryExpenses.length) {
            res.send(result);
          }
        });
      } else {
        res.send("not found category ");
      }
    }
  } catch (error) {
    res.send(error.message);
  }
});

module.exports = router;
