const categoryModel = require("../models/Category")

const getCategories = async (req, res) => {
    try {
        const categories = await categoryModel.find()
        res.status(200).json({
            success: true,
            categories,
        })
    } catch (error) {
        res.status(500).json({ error: error })
    }
}
module.exports = { getCategories }
