const mongoose = require('mongoose')
const Schema = mongoose.Schema

const ProductSchema = new Schema({
    productName: {
        type: String,
        required: true
    },
    category: {
        type: Schema.Types.ObjectId,
        ref: 'categories',
        required: true
    },
    quantity: {
        type: Number,
        required: true
    },
    instock: {
        type: Boolean
    },
    price: {
        type: Number,
        required: true
    },
    properties: {
        type: String
    },
    image: {
        type: String
    },
    hot: {
        type: Boolean,
        default: false
    }
})

module.exports = mongoose.model('products', ProductSchema)