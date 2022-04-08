import { React, useContext, useEffect } from "react"
import { ProductContext } from "../../../contexts/ProductContext"
import Spinner from "react-bootstrap/Spinner"
import ProductItem from "../productItem/ProductItem"
import "./style.css"

const ProductsList = () => {
    const {
        productsState: { products, productsLoading },
        getHotProduct,
    } = useContext(ProductContext)

    useEffect(() => {
        getHotProduct()
    }, [])

    let body = null
    if (productsLoading) {
        body = (
            <div className="d-flex justify-content-center mt-2">
                <Spinner animation="border" variant="info" />
            </div>
        )
    } else if (products.length === 0) {
        body = <div>Nullllll</div>
    } else {
        body = (
            <>
                {products.map((hotproducts) => (
                    <ProductItem key={hotproducts._id} hotproducts={hotproducts} />
                ))}
            </>
        )
    }
    return <div className="productlist">{body}</div>
}

export default ProductsList
