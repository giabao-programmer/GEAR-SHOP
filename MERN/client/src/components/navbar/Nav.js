import React, { useContext } from "react"
import { Navbar, Container, Form, Button, FormControl } from "react-bootstrap"
import { Link } from "react-router-dom"
import "./style.css"
import logo from "../../assets/logo.png"
import { CartContext } from "../../contexts/CartContext"

const Nav = () => {
    const { cartItem } = useContext(CartContext)
    return (
        <>
            <Navbar bg="light" expand="lg">
                <Container>
                    <Navbar.Brand href="/home">
                        <img src={logo} alt="gearshopLogo" width="25" height="25" className="mr-2" />
                    </Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav" className="me-auto row">
                        <div className="col-lg-3"></div>
                        <div className="col-lg-5">
                            <Form className="d-flex">
                                <FormControl type="search" placeholder="Search" className="me-2 search" aria-label="Search" />
                            </Form>
                        </div>
                        <div className="col-lg-4">
                            <Navbar.Brand href="/cart" className="btn cartmenu">
                                Cart
                                <span className="badge bg-dark text-white ms-1 rounded-pill">{cartItem.length}</span>
                            </Navbar.Brand>
                        </div>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </>
    )
}

export default Nav
