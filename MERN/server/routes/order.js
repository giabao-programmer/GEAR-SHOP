const express = require("express")
const { getOrders, newOrder } = require("../controllers/orderController")

const router = express.Router()

router.get("/", getOrders)

router.post("/new", newOrder)

module.exports = router