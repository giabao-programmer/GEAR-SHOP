import React from "react"
import { Card, Button } from "react-bootstrap"
import { apiUrl } from "../../../reducers/contants"
import { useNavigate } from "react-router-dom"
import { Link } from "react-router-dom"

import "./style.css"
const ProductItem = ({ hotproducts }) => {
    const format = (num) => String(num).replace(/(?<!\..*)(\d)(?=(?:\d{3})+(?:\.|$))/g, "$1,")

    let navigate = useNavigate()

    const detail = () => {
        navigate(`/detail/${hotproducts._id}`)
    }

    return (
        <Card className="text-center" style={{ width: "14rem" }} id={`${hotproducts._id}`}>
            <Card.Img variant="top" src={`${apiUrl}${hotproducts.image}`} />
            <Card.Body>
                <div style={{ height: "75px" }}>
                    <Card.Title>{hotproducts.productName}</Card.Title>
                </div>
                <Card.Text>{format(hotproducts.price)} VND</Card.Text>

                <Link className="btn-item auction-btn mr-2" to={`/detail/${hotproducts._id}`}>
                    <Button variant="info" onClick={detail}>
                        View product
                    </Button>
                </Link>
            </Card.Body>
        </Card>
    )
}

export default ProductItem
