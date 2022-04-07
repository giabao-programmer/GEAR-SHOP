const express = require("express")
const Account = require("../models/Account")
const argon2 = require('argon2');
const router = express.Router()
const jwt = require('jsonwebtoken')


const checkLoggedin = async (req, res) => {
    try {
		const account = await Account.findById(req.accountId).select('-password')
		if (!account)
			return res.status(400).json({ success: false, message: 'User not found' })
		res.json({ success: true, account })
	} catch (error) {
		console.log(error)
		res.status(500).json({ success: false, message: 'Internal server error' })
	}
}

const register = async (req, res) => {
    const { username, password, role } = req.body
    if (!username || !password) {
        return res.status(400).json({
            success: false,
            message: "Missing username or password",
        })
    }
    try {
        const account = await Account.findOne({ username })
        if (account) {
            return res.status(400).json({
                success: false,
                message: 'Username already taken'
            })
        }
        const hashedPassword = await argon2.hash(password)
        const newAccount = new Account({
            username,
            password: hashedPassword,
            role: role || 'SELLER'
        })

        await newAccount.save()

        // Return token
        const accessToken = jwt.sign({accountId: newAccount._id}, process.env.ACCESS_TOKEN_SECRET)
        res.status(200).json({
            success: true,
            message: 'Account created successfully',
            accessToken
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            error: 'Internal Server Error'
        })
    }
}
const login = async (req, res) => {
    const { username, password } = req.body
    if (!username || !password) {
        return res.status(400).json({
            success: false,
            message: "Missing username and/or password",
        })
    }
    try {
        const account = await Account.findOne({ username })
        if (!account) {
            return res.status(400).json({
                success: false,
                message: 'Incorrect username or password'
            })
        }
        const passwordValid = await argon2.verify(account.password, password)
        if (!passwordValid) {
            return res.status(400).json({
                success: false,
                message: 'Incorrect username or password'
            })
        }
        // Return token
        const accessToken = jwt.sign({accountId: account._id}, process.env.ACCESS_TOKEN_SECRET)
        res.status(200).json({
            success: true,
            message: 'Login successfully',
            accessToken
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            error: 'Internal Server Error'
        })
    }
}
module.exports = { register, login, checkLoggedin }
