import { React, createContext, useReducer } from "react"
import { apiUrl, GET_ORDER_FAILED, GET_ORDER_SUCCESS,  } from "../reduces/constants"
import axios from "axios"
import { orderReducer } from "../reduces/orderReducer"

export const OrderContext = createContext()

const OrderContextProvider = ({ children }) => {
    const [ordersState, dispatch] = useReducer(orderReducer, {
        orders: [],
        ordersLoading: true,
    })
    const getAllOrder = async () => {
        try {
            const response = await axios.get(`${apiUrl}/api/orders/`)
            if (response.data.success) {
                dispatch({
                    type: GET_ORDER_SUCCESS,
                    payload: response.data.orders,
                })
            } else {
                dispatch({
                    type: GET_ORDER_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }
    
    const orderContextData = {
        getAllOrder,
        ordersState,
        dispatch,
    }
    return <OrderContext.Provider value={orderContextData}>{children}</OrderContext.Provider>
}

export default OrderContextProvider
