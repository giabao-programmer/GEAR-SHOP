import { createContext, useReducer, useEffect } from "react"
import axios from "axios"
import { authReducer } from "../reduces/authReducer"
import { apiUrl, LOCAL_STORAGE_TOKEN, SET_AUTH } from "../reduces/constants"
import setAuthToken from "../utils/setAuthToken"

export const AuthContext = createContext()

const AuthContextProvider = ({ children }) => {
    const [authState, dispatch] = useReducer(authReducer, {
        authLoading: true,
        isAuthenticated: false,
        account: null,
    })

    // Authenticate user
    const loadManager = async () => {
        if (localStorage[LOCAL_STORAGE_TOKEN]) {
            setAuthToken(localStorage[LOCAL_STORAGE_TOKEN])
        }
        try {
            const response = await axios.get(`${apiUrl}/api/account`)
            if (response.data.success) {
                dispatch({
                    type: SET_AUTH,
                    payload: { isAuthenticated: true, account: response.data.account },
                })
            }
        } catch (error) {
            localStorage.removeItem(LOCAL_STORAGE_TOKEN)
            setAuthToken(null)
            dispatch({
                type: SET_AUTH,
                payload: { isAuthenticated: false, user: null },
            })
        }
    }

    useEffect(() => async () => loadManager(), [])

    // Login
    const loginManager = async (userForm) => {
        try {
            const response = await axios.post(`${apiUrl}/api/account/login`, userForm)
            if (response.data.success) localStorage.setItem(LOCAL_STORAGE_TOKEN, response.data.accessToken)
            await loadManager()
            return response.data
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }

    // Logout
    const logoutManager = () => {
        localStorage.removeItem(LOCAL_STORAGE_TOKEN)
        dispatch({
            type: SET_AUTH,
            payload: { isAuthenticated: false, user: null },
        })
    }

    // Context data
    const authContextData = { loginManager, logoutManager, authState, loadManager }

    // Return provider
    return <AuthContext.Provider value={authContextData}>{children}</AuthContext.Provider>
}

export default AuthContextProvider
