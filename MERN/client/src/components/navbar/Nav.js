import React from "react"
import { Navbar, Container, Form, Button, FormControl } from "react-bootstrap"
import { Link } from "react-router-dom"
import "./style.css"
const Nav = () => {
    return (
        <>
            <Navbar bg="light" expand="lg">
                <Container>
                    <Navbar.Brand href="/home">Gear Shop</Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav" className="me-auto row">
                        <div className="col-lg-4"></div>
                        <div className="col-lg-6">
                            <Form className="d-flex">
                                <FormControl type="search" placeholder="Search" className="me-2 search" aria-label="Search" />
                            </Form>
                        </div>
                        <div className="col-lg-2">
                            
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </div>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </>
    )
}

export default Nav
