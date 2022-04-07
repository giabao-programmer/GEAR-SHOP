import React from "react"
import LoginForm from "../components/auth/LoginForm"
import { AuthContext } from "../contexts/AuthContext"
import { useContext } from "react"
import { useNavigate } from "react-router-dom"
import Spinner from "react-bootstrap/Spinner"

const LoginView = () => {
    const {
        authState: { authLoading, isAuthenticated },
    } = useContext(AuthContext)

    let navigate = useNavigate()

    let body

    if (authLoading) {
        body = (
            <div className="d-flex justify-content-center mt-2">
                <Spinner animation="border" variant="info" />
            </div>
        )
    } else if (isAuthenticated) navigate(`/management`)
    else
        body = (
            <>
                <LoginForm />
            </>
        )
    return (
        <div className="landing">
            <div className="dark-overlay">
                <div className="landing-inner">
                    <h1>Gear Shop Admin</h1>
                    {body}
                </div>
            </div>
        </div>
    )
}

export default LoginView
