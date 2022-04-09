import { React, useContext } from "react"
import CartItem from "../components/cart/CartItem"
import { CartContext } from "../contexts/CartContext"
import { Link } from "react-router-dom"
const CartView = () => {
    const {
        cartItems: { order },
    } = useContext(CartContext)

    let body = (
        <div className="container body1680px my-md-5 px-md-5">
            <div className="row" style={{ textAlign: "center" }}>
                <h2>Your cart is empty!</h2>
                <div className="center">
                    <Link to="/home" className="btn btn-danger">
                        Back to home
                    </Link>
                </div>
            </div>
        </div>
    )
    if (order.length !== 0) {
        body = (
            <div className="container body1680px my-md-5 px-md-5">
                <div className="row" style={{ textAlign: "center" }}>
                    <table style={{ width: "100%" }}>
                        {order.map((product) => (
                            <CartItem key={product._id} product={product} />
                        ))}
                    </table>
                    <div className="center">
                        <Link className="btn btn-danger" to={'/checkout'}>
                            Checkout
                        </Link>
                    </div>
                </div>
            </div>
        )
    }

    return <>{body}</>
}

export default CartView
