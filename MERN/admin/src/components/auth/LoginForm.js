import React from "react"
import Form from "react-bootstrap/Form"
import Button from "react-bootstrap/Button"
import { useContext, useState } from "react"
import { AuthContext } from "../../contexts/AuthContext"
import { useNavigate } from "react-router-dom"
import AlertMessage from '../../components/navigate/AlertMessage'

const LoginForm = () => {
    const { loginManager } = useContext(AuthContext)
    const navigate = useNavigate()
    const [loginForm, setLoginForm] = useState({
        username: "",
        password: "",
    })
    const [alert, setAlert] = useState(null)
    const { username, password } = loginForm
    const onChangeLoginForm = (event) => {
        setLoginForm({
            ...loginForm,
            [event.target.name]: event.target.value,
        })
    }

    const login = async (event) => {
        event.preventDefault()

        try {
            const loginData = await loginManager(loginForm)
            if (loginData.success) {
                navigate('/management')
            }
            else {
                setAlert({
                    type: 'danger',
                    message: loginData.message
                })
                setTimeout(() => setAlert(null), 1500)
            }
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <Form onSubmit={login}>
            <AlertMessage info={alert}/>
            <Form.Group className="mb-3">
                <Form.Control type="text" placeholder="Accountname" name="username" required value={username} onChange={onChangeLoginForm} />
            </Form.Group>
            <Form.Group className="mb-3">
                <Form.Control type="password" placeholder="Password" name="password" required value={password} onChange={onChangeLoginForm} />
            </Form.Group>
            <Button variant="success" type="submit">
                Login
            </Button>
        </Form>
    )
}

export default LoginForm
