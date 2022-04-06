const express = require("express")
const { getCategories } = require("../controllers/categoryController")

const router = express.Router()

router.get("/", getCategories)

// router.get("/findbycategory", getDrinksByCategory)

// router.get("/finddrink", findDrink)

// router.post("/", upload.array("drinkImage"), createDrink)

module.exports = router
