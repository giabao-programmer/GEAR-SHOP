import { React, createContext, useReducer } from "react"
import { productReducer } from "../reducers/ProductReducer"
import { apiUrl, PRODUCTS_HOT_LOADED_SUCCESS, PRODUCTS_HOT_LOADED_FAILED, PRODUCTS_BY_CATEGORY_SUCCESS, PRODUCTS_BY_CATEGORY_FAILED, PRODUCTS_DETAIL_SUCCESS, PRODUCTS_DETAIL_FAILED, PRODUCTS_FIND_BY_NAME_SUCCESS, PRODUCTS_FIND_BY_NAME_FAILED } from "../reducers/contants"
import axios from "axios"

export const ProductContext = createContext()
const ProductContextProvider = ({ children }) => {
    const [productsState, dispatch] = useReducer(productReducer, {
        productDetail: {},
        products: [],
        productsLoading: true,
        productDetailLoading: true,
    })

    const getHotProduct = async () => {
        try {
            const response = await axios.get(`${apiUrl}/api/products/hot`)
            if (response.data.success) {
                dispatch({
                    type: PRODUCTS_HOT_LOADED_SUCCESS,
                    payload: response.data.getHotProducts,
                })
            } else {
                dispatch({
                    type: PRODUCTS_HOT_LOADED_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }

    const getProductsByCate = async (category) => {
        try {
            const response = await axios.get(`${apiUrl}/api/products/cate/${category}`)
            if (response.data.success) {
                dispatch({
                    type: PRODUCTS_BY_CATEGORY_SUCCESS,
                    payload: response.data.getProductsByCate,
                })
            } else {
                dispatch({
                    type: PRODUCTS_BY_CATEGORY_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }

    const getProductDetail = async (id) => {
        try {
            
            const response = await axios.get(`${apiUrl}/api/products/${id}`)
            if (response.data.success) {
                dispatch({
                    type: PRODUCTS_DETAIL_SUCCESS,
                    payload: response.data.findProduct,
                })
            } else {
                dispatch({
                    type: PRODUCTS_DETAIL_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }

    const searchProduct = async (name) => {
        console.log(name)
        try {
            
            const response = await axios.get(`${apiUrl}/api/products/search/${name}`)
            console.log(response)
            if (response.data.success) {
                dispatch({
                    type: PRODUCTS_FIND_BY_NAME_SUCCESS,
                    payload: response.data.findProduct,
                })
            } else {
                dispatch({
                    type: PRODUCTS_FIND_BY_NAME_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }
    const productContextData = {
        getHotProduct,
        productsState,
        getProductsByCate,
        getProductDetail,
        searchProduct
    }
    return <ProductContext.Provider value={productContextData}>{children}</ProductContext.Provider>
}

export default ProductContextProvider
