import { React, useContext } from "react"
import { FormControl } from "react-bootstrap"
import { Card } from "react-bootstrap"
import { apiUrl } from "../../reducers/contants"
import { CartContext } from "../../contexts/CartContext"
import { useNavigate } from "react-router-dom"
import "./style.css"

const CartItem = ({ product }) => {
    const { cartItems, removeItem } = useContext(CartContext)
    let navigate = useNavigate()
    const priceforeach = product.price * product.buyquantity
    const format = (num) => String(num).replace(/(?<!\..*)(\d)(?=(?:\d{3})+(?:\.|$))/g, "$1,")
    
    //onChange
    const changeQuantity = (event) => {
        const find = cartItems.order.find((e) => e._id === product._id)
        find.buyquantity = event.target.value
        navigate("/cart")
    }
    //onClick
    const removeItemfromCart = () => {
        removeItem(product)
    }


    return (
        <tbody>
            <tr>
                <td style={{ width: "30%" }}>
                    <Card.Img variant="top" className="cartimg" src={`${apiUrl}${product.image}`} alt={product.productName} />
                </td>
                <td style={{ width: "35%" }}>{product.productName}</td>
                <td style={{ width: "5%" }}>
                    <FormControl type="number" className="cart-quantity" value={product.buyquantity} onChange={changeQuantity} min="1" />
                </td>
                <td style={{ width: "15%" }}>{format(priceforeach)}</td>
                <td style={{ width: "15%" }}>
                    <button onClick={removeItemfromCart}>
                        <i className="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
        </tbody>
    )
}

export default CartItem
