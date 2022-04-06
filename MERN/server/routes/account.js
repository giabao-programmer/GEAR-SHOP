const express = require("express")
const { register, login, checkLoggedin } = require("../controllers/accountController")
const verifyToken = require('../middleware/auth')
const router = express.Router()

router.get("/", verifyToken ,checkLoggedin)

router.post("/register", register)

router.post("/login", login)

module.exports = router