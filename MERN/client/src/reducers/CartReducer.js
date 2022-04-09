import { REMOVE_CART, ADD_TO_CART, ORDER_DONE } from "./contants"

export const cartReducer = (state, action) => {
    const { type, payload } = action

    switch (type) {
        case ADD_TO_CART:
            return {
                order: [...state.order, payload],
            }
        case REMOVE_CART:
            const item = state.order.find((item) => item === payload)
            const itemIndex = state.order.indexOf(item)
            return {
                order: [...state.order.splice(itemIndex, 1)]
            }
        case ORDER_DONE:
            return {
                ...state,
                order: []
            }
        default:
            return state
    }
}
