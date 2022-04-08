import { React, createContext, useReducer } from "react"
import { categoryReducer } from "../reducers/CategoryReducer"
import axios from "axios"
import { apiUrl } from "../reducers/contants"
import { CATE_LOADED_SUCCESS, CATE_LOADED_FAILED } from "../reducers/contants"

export const CategoryContext = createContext()
const CategoryContextProvider = ({children}) => {
    const [categoriesState, dispatch] = useReducer(categoryReducer, {
        categories: [],
        categoriesLoading: true,
    })
    //get all cates
    const getCategories = async () => {
        try {
            const response = await axios.get(`${apiUrl}/api/categories`)
            if (response.data.success) {
                dispatch({
                    type: CATE_LOADED_SUCCESS,
                    payload: response.data.categories,
                })
            } else {
                dispatch({
                    type: CATE_LOADED_FAILED,
                })
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }
    const categoryContextData = {
        categoriesState,
        getCategories
    }
    return <CategoryContext.Provider value={categoryContextData}>{children}</CategoryContext.Provider>
}

export default CategoryContextProvider
