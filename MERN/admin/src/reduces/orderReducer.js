import { GET_ORDER_FAILED, GET_ORDER_SUCCESS } from "./constants"
export const orderReducer = (state, action) => {
    const { type, payload } = action

    switch (type) {
        case GET_ORDER_SUCCESS:
            return {
                ...state,
                orders: payload,
                ordersLoading: false,
            }
        case GET_ORDER_FAILED:
            return {
                ...state,
                orders: [],
                ordersLoading: false,
            }
        default:
            return state
    }
}
