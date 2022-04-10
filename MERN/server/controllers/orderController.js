const orderModel = require("../models/Order")

const getOrders = async (req, res) => {
    try {
        const orders = await orderModel.find().sort({ createAt: "descending" })
        res.status(200).json({
            success: true,
            orders,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

const newOrder = async (req, res) => {
    const newOrder = new orderModel(req.body)
    try {
        await newOrder.save()
        res.status(200).json({
            success: true,
            message: "Order success",
            newOrder,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

module.exports = { getOrders, newOrder }
