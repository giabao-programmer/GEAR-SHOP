import { React, useContext, useEffect, useState } from "react"
import { ProductContext } from "../../contexts/ProductContext"
import Spinner from "react-bootstrap/Spinner"
import { apiUrl } from "../../reduces/constants"
import { Button, Modal } from "react-bootstrap"
const Products = () => {
    const [productId, setProductId] = useState({})
    const [show, setShow] = useState(false)
    const handleClose = () => setShow(false)
    const handleShow = (event) => {
        setShow(true)
        setProductId(event.target.value)
    }
    const format = (num) => String(num).replace(/(?<!\..*)(\d)(?=(?:\d{3})+(?:\.|$))/g, "$1,")

    const {
        productsState: { products, productsLoading },
        getAllProduct,
        deleteProduct,
    } = useContext(ProductContext)

    useEffect(() => {
        getAllProduct()
    }, [])

    const confirmDelete = async (event) => {
        event.preventDefault()
        await deleteProduct(productId)
        setShow(false)
    }

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
                <Modal show={show} onHide={handleClose}>
                    <Modal.Header closeButton>
                        <Modal.Title>Delete item</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>Woohoo, you're deleting this item! You sure?</Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleClose}>
                            Cancel
                        </Button>
                        <Button variant="primary" onClick={confirmDelete}>
                            Delete
                        </Button>
                    </Modal.Footer>
                </Modal>
                <div className="mb-4">
                    <div className="card-body">
                        <table id="datatablesSimple" style={{ width: "100%" }}>
                            <thead>
                                <tr>
                                    <th style={{ textAlign: "center" }}>Product Image</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Instock</th>
                                    <th>Hot</th>
                                </tr>
                            </thead>
                            <tbody>
                                {products.map((allproducts) => (
                                    <tr key={allproducts._id} style={{ height: "55px" }}>
                                        <td style={{ textAlign: "center" }}>
                                            <img src={`${apiUrl}${allproducts.image}`} style={{ width: "35px", height: "35px" }} />
                                        </td>
                                        <td style={{ width: "30%" }}>{allproducts.productName}</td>
                                        <td>{format(allproducts.price)} vnđ</td>
                                        <td>{allproducts.instock === true ? "Instock" : "Out of stock"}</td>
                                        <td>{allproducts.hot === true ? "✔" : "✘"}</td>
                                        <td>
                                            <Button variant="info">Edit</Button>
                                        </td>
                                        <td>
                                            <Button onClick={handleShow} variant="danger" value={allproducts._id}>
                                                Delete
                                            </Button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </>
        )
    }
    return <>{body}</>
}

export default Products
