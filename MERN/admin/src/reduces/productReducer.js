import { GET_PRODUCTS_SUCCESS, GET_PRODUCTS_FAILED, DELETE_PRODUCT_SUCCESS, DELETE_PRODUCT_FAILED, NEW_PRODUCT_SUCCESS, NEW_PRODUCT_FAILED } from "./constants"
export const productReducer = (state, action) => {
    const { type, payload } = action

    switch (type) {
        case GET_PRODUCTS_SUCCESS:
            return {
                ...state,
                products: payload,
                productsLoading: false,
            }
        case GET_PRODUCTS_FAILED:
            return {
                ...state,
                products: [],
                productsLoading: false,
            }
        case NEW_PRODUCT_SUCCESS:
            return {
                ...state,
                products: [...state.products, payload]
            }
        case NEW_PRODUCT_FAILED:
            return {
                ...state,
                products: [...state.products]
            }
        case DELETE_PRODUCT_SUCCESS:
            return {
                ...state,
                products: state.products.filter(product => product._id !== payload)
            }
        case DELETE_PRODUCT_FAILED:
            return {
                ...state,
            }
        default:
            return state
    }
}
