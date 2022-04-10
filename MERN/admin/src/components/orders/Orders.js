import { React, useContext, useState, useEffect } from "react"
import { Button, Modal, Spinner } from "react-bootstrap"
import { OrderContext } from "../../contexts/OrderContext"
import { apiUrl } from "../../reduces/constants"
const Orders = () => {
    const [orderDetail, setOrderDetail] = useState()
    const [modalShow, setModalShow] = useState(false)
    const format = (num) => String(num).replace(/(?<!\..*)(\d)(?=(?:\d{3})+(?:\.|$))/g, "$1,")

    const {
        ordersState: { orders, ordersLoading },
        getAllOrder,
    } = useContext(OrderContext)

    useEffect(() => {
        getAllOrder()
    }, [])

    const MyVerticallyCenteredModal = (props) => {
        if (!orderDetail) {
            return (
                <div></div>
            )
        }
        console.log(orderDetail.products)
        return (
            <>
            {(orderDetail) ? ( <Modal {...props} size="lg" aria-labelledby="contained-modal-title-vcenter" centered>
                <Modal.Header closeButton>
                    <Modal.Title id="contained-modal-title-vcenter">OrderID: {orderDetail._id}</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <table style={{ width: "100%" }}>
                        <thead>
                            <tr>
                                <th>Product name</th>
                                <th>Buy quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            {(orderDetail.products).map((product) => (
                                <tr key={product._id} style={{ height: "55px" }}>
                                    <td>{product.productName}</td>
                                    <td>x{product.buyquantity}</td>
                                    <td>{format(product.price)} vnđ</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </Modal.Body>
                <Modal.Footer>
                    <h5 style={{marginLeft: '0', marginRight: 'auto'}}>TotalPrice: {format(orderDetail.totalPrice)} vnđ</h5>
                    <Button onClick={props.onHide}>Close</Button>
                </Modal.Footer>
            </Modal>) : (<div></div>)}
            </>
        )
    }

    let body = null
    if (ordersLoading) {
        body = (
            <div className="d-flex justify-content-center mt-2">
                <Spinner animation="border" variant="info" />
            </div>
        )
    } else if (orders.length === 0) {
        body = <div>Not order yet</div>
    } else {
        body = (
            <>
                <MyVerticallyCenteredModal show={modalShow} onHide={() => setModalShow(false)} />
                <div className="mb-4">
                    <div className="card-body">
                        <table id="datatablesSimple" style={{ width: "100%" }}>
                            <thead>
                                <tr>
                                    <th style={{ textAlign: "center" }}>Order ID</th>
                                    <th>Customer name</th>
                                    <th>Phone</th>
                                    <th>Total Price</th>
                                    <th>Address</th>
                                    <th>Order time newest</th>
                                </tr>
                            </thead>
                            <tbody>
                                {orders.map((allorders) => (
                                    <tr key={allorders._id} style={{ height: "55px" }}>
                                        <td style={{ textAlign: "center" }}>{allorders._id}</td>
                                        <td>{allorders.customerName}</td>
                                        <td>{allorders.customerPhone}</td>
                                        <td>{format(allorders.totalPrice)} vnd</td>
                                        <td>{allorders.customerAddress}</td>
                                        <td>{allorders.createAt}</td>
                                        <td>
                                            <Button
                                                variant="info"
                                                onClick={() => {
                                                    setOrderDetail(allorders)
                                                    setModalShow(true)
                                                }}
                                            >
                                                See detail
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

export default Orders
