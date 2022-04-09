import { React, useContext, useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import Spinner from "react-bootstrap/Spinner"
import { ProductContext } from "../contexts/ProductContext"
import { apiUrl } from "../reducers/contants"
import { CartContext } from "../contexts/CartContext"
import { ADD_TO_CART } from "../reducers/contants"
import AlertMessage from "../components/alert/AlertAddtoCart"
const DetailView = () => {
    const { id } = useParams()
    const {
        productsState: { productDetail, productDetailLoading },
        getProductDetail,
    } = useContext(ProductContext)
    const { dispatch, cartItems } = useContext(CartContext)
    const [alert, setAlert] = useState(null)

    useEffect(() => {
        getProductDetail(id)
    }, [])
    if (productDetailLoading) {
        return (
            <div className="d-flex justify-content-center mt-2">
                <Spinner animation="border" variant="info" />
            </div>
        )
    } else if (productDetail.length === 0) {
        return <div>Not detail for this product</div>
    }
    const addToCart = (productDetail) => {
        const find = cartItems.order.find((e) => e._id === productDetail._id)
        if (find) {
            find.buyquantity += 1
        } else {
            productDetail.buyquantity = 1
            dispatch({ type: ADD_TO_CART, payload: productDetail })
        }
        setAlert({
            type: 'success',
            message: 'Product added to your cart!'
        })
        setTimeout(() => setAlert(null), 1500)
    }
    const format = (num) => String(num).replace(/(?<!\..*)(\d)(?=(?:\d{3})+(?:\.|$))/g, "$1,")
    return (
        <>
            <div className="container my-5">
                <div className="row gx-4 gx-lg-5 ">
                    <div className="col-sm-6 py-5">
                        <img className="card-img-top mb-5 mb-md-0" src={`${apiUrl}${productDetail.image}`} alt="..." />
                    </div>
                    <div className="col-sm-6 py-5">
                        <h3 className="fw-bolder">{productDetail.productName}</h3>
                        <div className="fs-5 mb-5">
                            <span className="text-decoration">{format(productDetail.price)} vnđ</span>
                        </div>
                        <p className="lead">{productDetail.properties}</p>
                        <div className="d-flex mb-5">
                            <button
                                onClick={() => {
                                    addToCart(productDetail)
                                }}
                                className="btn btn-outline-red flex-shrink-0"
                                type="button"
                                style={{ fontWeight: 500 }}
                            >
                                Add to cart
                            </button>
                        </div>
                        <AlertMessage info={alert}/>
                    </div>
                </div>
            </div>
        </>
    )
}

export default DetailView
