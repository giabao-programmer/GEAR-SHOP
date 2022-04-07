import { SET_AUTH } from "./constants"
export const authReducer = (state, action) => {
    const { type, payload: { isAuthenticated, account }} = action

    switch(type){
        case SET_AUTH:
            return {
                ...state,
                authLoading: false,
                isAuthenticated,
                account
            }
        default:
            return state
    }
}
