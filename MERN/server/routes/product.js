const express = require("express")
const verifyToken = require('../middleware/auth')

const { getProducts, getHotProducts, getProductsByCate, newProduct, updateProduct, findProduct, deleteProduct } = require('../controllers/productController')


const router = express.Router();

router.get('/', getProducts);

router.get('/hot', getHotProducts);

router.get('/cate/:category', getProductsByCate);

router.get('/:id', findProduct)

router.delete('/:id', verifyToken, deleteProduct)

router.post('/new', verifyToken, newProduct)

router.put('/update/:id', verifyToken, updateProduct)

module.exports = router