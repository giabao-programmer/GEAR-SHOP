import React, { useContext, useState } from "react"
import { Navbar, Container, Form, FormControl } from "react-bootstrap"
import { Link } from "react-router-dom"
import "./style.css"
import logo from "../../assets/logo.png"
import { CartContext } from "../../contexts/CartContext"
import { ProductContext } from "../../contexts/ProductContext"
const Nav = () => {
    const {
        cartItems: { order },
    } = useContext(CartContext)
    const { searchProduct } = useContext(ProductContext)
    const [name, setName] = useState("")
    const onChangeName = (event) => {
        setName(event.target.value)
    }
    const handleSubmit = async (event) => {
        event.preventDefault()
        searchProduct(name)
    }
    return (
        <>
            <Navbar bg="light" expand="lg">
                <Container>
                    <Link to="/home">
                        <img src={logo} alt="gearshopLogo" width="25" height="25" className="mr-2" />
                    </Link>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav" className="me-auto row">
                        <div className="col-lg-3"></div>
                        <div className="col-lg-5">
                            <Form className="d-flex" onSubmit={handleSubmit}>
                                <FormControl type="search" placeholder="Search" className="me-2 search" aria-label="Search" value={name} onChange={onChangeName} />
                            </Form>
                        </div>
                        <div className="col-lg-4">
                            <Link to="/cart" className="btn cartmenu">
                                Cart
                                <span className="badge bg-dark text-white ms-1 rounded-pill">{order.length}</span>
                            </Link>
                        </div>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </>
    )
}

export default Nav
