import { React, useContext, useEffect } from "react"
import { CategoryContext } from "../../contexts/CategoryContext"
import Spinner from "react-bootstrap/Spinner"
import SingleCategory from "../categories/SingleCategory"
import { ProductContext } from "../../contexts/ProductContext"

const Menu = () => {
    const {
        categoriesState: { categories, categoriesLoading },
        getCategories,
    } = useContext(CategoryContext)
    const {
        getProductsByCate
    } = useContext(ProductContext)
    //start get categories
    useEffect(() => {
        getCategories()
    }, [])
    const handleSelectedCate = async (id) => {
        getProductsByCate(id)
    }
    let body = null
    
    if (categoriesLoading) {
        body = (
            <div className="d-flex justify-content-center mt-2">
                <Spinner animation="border" variant="info" />
            </div>
        )
    } else if (categories.length === 0) {
        body = <div>Cannot get category</div>
    } else {
        body = (
            <>
                <nav className="menu-nav">
                    <ul className="nav-menulist" >
                        {categories.map((category) => (
                            <div key={category._id} onClick={()=> handleSelectedCate(category._id)}>
                                <SingleCategory onClick category={category} />
                            </div>
                        ))}
                    </ul>
                </nav>
            </>
        )
    }
    return <>{body}</>
}

export default Menu
