const mongoose = require('mongoose')
const Schema =  mongoose.Schema

const OrderSchema = new Schema({
    customerName: {
        type: String,
        required: true
    },
    customerPhone: {
        type: String,
        required: true
    },
    products: [{
        _id: {
            type: String
        },
        productName: {
            type: String
        },
        price: {
            type: String
        },
        buyquantity: {
            type: Number
        }
    }],
    totalPrice: {
        type: Number
    },
    customerAddress: {
        type: String,
        default: 'at shop'
    },
    createAt: {
        type: Date,
        default: Date.now
    }
})

module.exports = mongoose.model('orders', OrderSchema)