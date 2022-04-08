import { React, useContext, useEffect } from "react"
import { useParams } from "react-router-dom"
import Spinner from "react-bootstrap/Spinner"
import { ProductContext } from "../contexts/ProductContext"
import { apiUrl } from "../reducers/contants"
import { CartContext } from "../contexts/CartContext"
const DetailView = () => {
    const { id } = useParams()
    const {
        productsState: { productDetail, productDetailLoading },
        getProductDetail,
    } = useContext(ProductContext)
    const { cartItem, setCartItem, setCartLocal } = useContext(CartContext)
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
        if (!cartItem.some((obj) => obj._id === productDetail._id)) {
            productDetail.quantity = 1
            setCartItem([...cartItem, productDetail])
        } else {
            productDetail.quantity++
            setCartItem([...cartItem])
        }
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
                        <div className="d-flex">
                            <button onClick={() => {
                                    addToCart(productDetail)
                                }} className="btn btn-outline-red flex-shrink-0" type="button" style={{ fontWeight: 500 }}>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}

export default DetailView
