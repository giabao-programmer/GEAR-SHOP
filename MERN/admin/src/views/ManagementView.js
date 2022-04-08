import { React, useContext } from "react"
import { AuthContext } from "../contexts/AuthContext"
import { Navigate } from 'react-router-dom'
const ManagementView = () => {
    const {
        authState: { isAuthenticated },
    } = useContext(AuthContext)

    let body = <div>ManagementView</div>
    if (!isAuthenticated) {
        body = (
            <>
                <Navigate to="/" />
            </>
        )
    }
    return <>{body}</>
}

export default ManagementView
