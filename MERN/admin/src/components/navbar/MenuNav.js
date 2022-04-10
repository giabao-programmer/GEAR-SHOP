import React from "react"
import { Link } from "react-router-dom"
import Navbar from 'react-bootstrap/Navbar'
import Button from "react-bootstrap/esm/Button"
import Nav from 'react-bootstrap/Nav'
const MenuNav = () => {
    return (
        <Nav className="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <Navbar.Brand className="ps-3" href="/management">GEAR SHOP</Navbar.Brand>
            <Button className="ms-auto me-0 me-md-3 my-2 my-md-0" variant="secondary">
                Logout
            </Button>
        </Nav>
    )
}

export default MenuNav
