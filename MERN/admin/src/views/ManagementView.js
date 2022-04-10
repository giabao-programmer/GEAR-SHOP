import { React, useContext, useState, useEffect } from "react"
import { AuthContext } from "../contexts/AuthContext"
import { Navigate } from "react-router-dom"
import MenuNav from "../components/navbar/MenuNav"
import MenuSide from "../components/menuside/MenuSide"
import Products from "../components/products/Products"
import { Modal, Form, Button } from "react-bootstrap"
import { apiUrl } from "../reduces/constants"
import axios from "axios"
import Orders from "../components/orders/Orders"
import { ProductContext } from "../contexts/ProductContext"

const ManagementView = ({ manage }) => {
    const [show, setShow] = useState(false)
    const handleClose = () => setShow(false)
    const handleShow = () => setShow(true)

    const [categories, setCategories] = useState([])
    const [newProduct, setNewProduct] = useState({})
    const handleChange = (e) => {
        if(e.type === 'file') {
            setNewProduct({ ...newProduct, [e.name]: e.files[0] })
        }
        else {
            setNewProduct({ ...newProduct, [e.name]: e.value })
        }
    }
    const {
        authState: { isAuthenticated },
    } = useContext(AuthContext)

    const getCategories = async () => {
        try {
            const response = await axios.get(`${apiUrl}/api/categories/`)
            if (response.data.success) {
                setCategories(...categories, response.data.categories)
            }
        } catch (error) {
            if (error.response.data) return error.response.data
            else return { success: false, message: error.message }
        }
    }
    const { newProductAdd } = useContext(ProductContext)

    const createProduct = async (event) => {
        event.preventDefault()
        await newProductAdd(newProduct)
        handleClose()
        setNewProduct()
    }
    useEffect(() => {
        getCategories()
    }, [])
    let body
    if (manage === "product") {
        body = (
            <>
                <>
                    <Modal show={show} onHide={handleClose}>
                        <Modal.Header closeButton>
                            <Modal.Title>New Product</Modal.Title>
                        </Modal.Header>
                        <Modal.Body>
                            <Form onChange={(e) => handleChange(e.target)} onSubmit={createProduct}>
                                <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                    <Form.Label>Product name</Form.Label>
                                    <Form.Control type="text" name="productName" autoFocus required />
                                </Form.Group>
                                <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                    <Form.Label>Category</Form.Label>
                                    <Form.Select aria-label="Default select example" name="category" required>
                                        {categories.map((getcate) => (
                                            <option key={getcate._id} value={getcate._id}>
                                                {getcate.categoryName}
                                            </option>
                                        ))}
                                    </Form.Select>
                                </Form.Group>
                                <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                    <Form.Label>Price</Form.Label>
                                    <Form.Control type="number" min={0} name="price" required />
                                </Form.Group>
                                <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                    <Form.Label>Quantity</Form.Label>
                                    <Form.Control type="number" min={0} name="quantity" required />
                                </Form.Group>
                                <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                    <Form.Label>Properties</Form.Label>
                                    <Form.Control as="textarea" name="properties" rows={3} required />
                                </Form.Group>
                                <Form.Group controlId="formFileSm" className="mb-3">
                                    <Form.Label>Choose image</Form.Label>
                                    <Form.Control type="file" accept="image/*" name="image" required />
                                </Form.Group>
                            </Form>
                        </Modal.Body>
                        <Modal.Footer>
                            <Button variant="secondary" onClick={handleClose}>
                                Cancel
                            </Button>
                            <Button variant="primary" type="submit" onClick={createProduct}>
                                Save Changes
                            </Button>
                        </Modal.Footer>
                    </Modal>

                    <div className="mt-4" style={{ justifyContent: "space-between", display: "flex" }}>
                        <h4>List Product</h4>
                        <Button className="mb-4 btn btn-success" onClick={handleShow}>
                            New product
                        </Button>
                    </div>
                    <Products />
                </>
            </>
        )
    } else if (manage === "order") {
        body = (
            <>
                <Orders />
            </>
        )
    }
    if (!isAuthenticated) {
        body = (
            <>
                <Navigate to="/" />
            </>
        )
    }
    return (
        <>
            <MenuNav />
            <div id="layoutSidenav">
                <MenuSide />
                <div id="layoutSidenav_content" style={{ display: "block" }}>
                    {body}
                </div>
            </div>
        </>
    )
}

export default ManagementView
