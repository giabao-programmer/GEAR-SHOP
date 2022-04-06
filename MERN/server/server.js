require('dotenv').config()
const express = require('express')
const mongoose = require('mongoose')
const app = express()
app.use(express.json())
const PORT = 5000

//required routes
const categoryRoute = require('./routes/category')
const accountRoute = require('./routes/account')
const productRoute = require('./routes/product')

//Mongodb Connection
const connectDB = async () => {
    try {
        await mongoose.connect(`mongodb+srv://${process.env.DB_USERNAME}:${process.env.DB_PASSWORD}@mycluster.zqprw.mongodb.net/gearshop?retryWrites=true&w=majority`)
        console.log('MongoDB connected')
    } catch (error) {
        console.log(error.message)
        process.exit(1)
    }
}
connectDB()
app.listen(PORT, () => console.log(`Server started on PORT: ${PORT}`))

//use API
app.use('/api/account', accountRoute)
app.use('/api/categories', categoryRoute)
app.use('/api/products', productRoute)
