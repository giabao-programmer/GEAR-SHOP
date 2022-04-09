import { React, createContext, useReducer } from "react"
import { cartReducer } from "../reducers/CartReducer"
import { ORDER_DONE, REMOVE_CART } from "../reducers/contants"
export const CartContext = createContext()

const CartContextProvider = ({ children }) => {
    const [cartItems, dispatch] = useReducer(cartReducer, {
        order: []
    })
    
    const removeItem = (product) => {
        dispatch({
            type: REMOVE_CART,
            payload: product
        })
    }
    const orderdone = () => {
        dispatch({
            type: ORDER_DONE,
            payload: null
        })
    }
    const cartContextData = {
        cartItems,
        dispatch,
        removeItem,
        orderdone
    }
    return <CartContext.Provider value={cartContextData}>{children}</CartContext.Provider>
}

export default CartContextProvider
