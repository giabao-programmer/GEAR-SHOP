import { React, createContext, useReducer } from "react"
import { apiUrl, DELETE_PRODUCT_FAILED, DELETE_PRODUCT_SUCCESS, GET_PRODUCTS_FAILED, GET_PRODUCTS_SUCCESS, LOCAL_STORAGE_TOKEN, NEW_PRODUCT_FAILED, NEW_PRODUCT_SUCCESS } from "../reduces/constants"
import axios from "axios"
import { productReducer } from "../reduces/productReducer"

export const ProductContext = createContext()

const ProductContextProvider = ({ children }) => {
    const [productsState, dispatch] = useReducer(productReducer, {
        products: [],
        productsLoading: true,
    })
    const getAllProduct = async () => {
        try {
            const response = await axios.get(`${apiUrl}/api/products/`)
            if (response.data.success) {
                dispatch({
                    type: GET_PRODUCTS_SUCCESS,
                    payload: response.data.products,
                })
            } else {
                dispatch({
                    type: GET_PRODUCTS_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }
    const newProductAdd = async (newProduct) => {
        // const formData = new FormData()
        // formData.append("productName", newProduct.productName)
        // formData.append("category", newProduct.category)
        // formData.append("quantity", newProduct.quantity)
        // formData.append("price", newProduct.price)
        // formData.append("properties", newProduct.properties)
        // formData.append("image", newProduct.image)
        try {
            const response = await axios.post(`${apiUrl}/api/products/new`, newProduct)
            if (response.data.success) {
                dispatch({
                    type: NEW_PRODUCT_SUCCESS,
                    payload: response.data.newProduct,
                })
            } else {
                dispatch({
                    type: NEW_PRODUCT_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }
    const deleteProduct = async (productId) => {
        try {
            const response = await axios.delete(`${apiUrl}/api/products/${productId}`)
            if (response.data.success) {
                dispatch({
                    type: DELETE_PRODUCT_SUCCESS,
                    payload: productId,
                })
            } else {
                dispatch({
                    type: DELETE_PRODUCT_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }
    const productContextData = {
        getAllProduct,
        newProductAdd,
        deleteProduct,
        productsState,
        dispatch,
    }
    return <ProductContext.Provider value={productContextData}>{children}</ProductContext.Provider>
}

export default ProductContextProvider
