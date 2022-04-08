const productModel = require("../models/Product")

const getProducts = async (req, res) => {
    try {
        const products = await productModel.find().populate("category")
        res.status(200).json({
            success: true,
            products,
        })
    } catch (error) {
        res.status(500).json({ error: error })
    }
}
const getHotProducts = async (req, res) => {
    const hot = true
    try {
        const getHotProducts = await productModel.find({ hot })
        if (!getHotProducts) {
            return res.status(401).json({
                success: false,
                message: "Product not found",
            })
        }
        res.status(200).json({
            success: true,
            getHotProducts,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

const getProductsByCate = async (req, res) => {    
    const {category} = req.params
    try {
        const getProductsByCate = await productModel.find({ category })
        if (!getProductsByCate) {
            return res.status(401).json({
                success: false,
                message: "Product not found",
            })
        }
        res.status(200).json({
            success: true,
            getProductsByCate,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

const newProduct = async (req, res) => {
    const { productName, category, quantity, price, properties, image, hot } = req.body
    if (!productName || !category || !quantity || !price) {
        return res.status(400).json({
            success: false,
            message: "Missing something parameter",
        })
    }
    try {
        const newProduct = new productModel({
            productName,
            category,
            quantity,
            instock: quantity > 0 ? true : false,
            price,
            properties,
            image,
            hot
        })
        await newProduct.save()
        res.status(200).json({
            success: true,
            message: "Product created",
            newProduct,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

const updateProduct = async (req, res) => {
    const { productName, category, quantity, price, properties, image, hot } = req.body
    if (!productName || !category || !quantity || !price) {
        return res.status(400).json({
            success: false,
            message: "Missing something parameter",
        })
    }
    try {
        let updateProduct = {
            productName,
            category,
            quantity,
            price,
            properties: properties || "",
            image: image || "",
            hot: hot || false,
        }
        const productUpdateCondition = { _id: req.params.id }
        const updatedProduct = await productModel.findOneAndUpdate(productUpdateCondition, updateProduct, { new: true })
        if (!updatedProduct) {
            return res.status(401).json({
                success: false,
                message: "Product not found or user not authorize",
            })
        }
        res.status(200).json({
            success: true,
            message: "Updated product",
            updatedProduct,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

const findProduct = async (req, res) => {
    try {
        const findProduct = await productModel.findOne({ _id: req.params.id })
        if (!findProduct) {
            return res.status(401).json({
                success: false,
                message: "Product not found",
            })
        }
        res.status(200).json({
            success: true,
            findProduct,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

const deleteProduct = async (req, res) => {
    try {
        const findProduct = await productModel.findOneAndDelete({ _id: req.params.id })
        if (!findProduct) {
            return res.status(401).json({
                success: false,
                message: "Product not found",
            })
        }
        res.status(200).json({
            success: true,
            message: 'Delete product successful',
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Internal Server Error",
        })
    }
}

module.exports = { getProducts, getHotProducts, getProductsByCate, newProduct, updateProduct, findProduct, deleteProduct }
