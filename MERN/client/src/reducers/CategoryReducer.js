import { CATE_LOADED_FAILED, CATE_LOADED_SUCCESS } from "./contants"

export const categoryReducer = (state, action) => {
    const { type, payload } = action
    switch (type) {
        case CATE_LOADED_SUCCESS:
            return {
                ...state,
                categories: payload,
                categoriesLoading: false,
            }
        case CATE_LOADED_FAILED:
            return {
                ...state,
                categories: [],
                categoriesLoading: false,
            }
        default:
            return state
    }
}
