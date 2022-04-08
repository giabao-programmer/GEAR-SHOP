import { PRODUCTS_HOT_LOADED_FAILED, PRODUCTS_HOT_LOADED_SUCCESS, PRODUCTS_BY_CATEGORY_SUCCESS, PRODUCTS_BY_CATEGORY_FAILED, PRODUCTS_DETAIL_SUCCESS, PRODUCTS_DETAIL_FAILED } from "./contants"

export const productReducer = (state, action) => {
    const { type, payload } = action
    switch (type) {
        case PRODUCTS_HOT_LOADED_SUCCESS:
            return {
                ...state,
                products: payload,
                productsLoading: false,
            }
        case PRODUCTS_HOT_LOADED_FAILED:
            return {
                ...state,
                products: [],
                productsLoading: false,
            }
        case PRODUCTS_BY_CATEGORY_SUCCESS:
            return {
                ...state,
                products: payload,
                productsLoading: false,
            }
        case PRODUCTS_BY_CATEGORY_FAILED:
            return {
                ...state,
                products: [],
                productsLoading: false,
            }
        case PRODUCTS_DETAIL_SUCCESS:
            return {
                ...state,
                productDetail: payload,
                productDetailLoading: false,
            }
        case PRODUCTS_DETAIL_FAILED:
            return {
                ...state,
                productDetail: {},
                productDetailLoading: false,
            }
        default:
            return state
    }
}
