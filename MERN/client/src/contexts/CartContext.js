import { React, useState, createContext, useEffect } from "react"

export const CartContext = createContext()

const CartContextProvider = ({children}) => {
    const [cartItem, setCartItem] = useState([])

    const cartContextData = {
        cartItem,
        setCartItem
    }
    return <CartContext.Provider value={cartContextData}>{children}</CartContext.Provider>
}

export default CartContextProvider
