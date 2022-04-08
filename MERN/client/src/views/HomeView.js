import React from "react"
import Menu from "../components/menu/Menu"
import ProductsList from "../components/products/productsList/ProductsList"
const HomeView = () => {
    return (
        <>
            <div className="container my-5">
                <div className="row">
                    <div className="col-lg-2 px-5" style={{marginTop: "20px"}}>
                        <Menu />
                    </div>
                    <div className="col-lg-10 px-5">
                        <ProductsList />
                    </div>
                </div>
            </div>
        </>
    )
}

export default HomeView
