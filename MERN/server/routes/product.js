const express = require("express")
const verifyToken = require('../middleware/auth')

const { getProducts, newProduct, updateProduct, findProduct, deleteProduct } = require('../controllers/productController')


const router = express.Router();

router.get('/', getProducts);

router.get('/:id', findProduct)

router.delete('/:id', verifyToken, deleteProduct)

router.post('/new', verifyToken, newProduct)

router.put('/update/:id', verifyToken, updateProduct)

module.exports = router