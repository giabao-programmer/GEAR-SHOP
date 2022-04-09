import { React, useContext, useState, useEffect } from "react"
import { Button, Form } from "react-bootstrap"
import { CartContext } from "../../contexts/CartContext"
import axios from "axios"
import { apiUrl } from "../../reducers/contants"
import swal from "sweetalert"
import { useNavigate } from "react-router-dom"
import "./style.css"

const CheckoutForm = () => {
    const [inputs, setInputs] = useState({})
    const [province, setProvince] = useState()
    const [district, setDistrict] = useState()
    const [ward, setWard] = useState()
    useEffect(() => {
        loadProvince()
    }, [])
    const {
        cartItems: { order }, orderdone
    } = useContext(CartContext)
    const format = (num) => String(num).replace(/(?<!\..*)(\d)(?=(?:\d{3})+(?:\.|$))/g, "$1,")
    let total = 0
    if (order.length !== 0) {
        const result = order.map((product) => product.price * product.buyquantity).reduce((a, b) => a + b)
        total = result
    }
    let navigate = useNavigate()
    const afterDone = () => {
        orderdone()
        navigate('/home')
    }
    //handles
    const handleSubmit = async (event) => {
        event.preventDefault()
        const address = {
            province: province.find((x) => x.ProvinceID == inputs.province).ProvinceName,
            district: district.find((x) => x.DistrictID == inputs.district).DistrictName,
            ward: ward.find((x) => x.WardCode === inputs.ward).WardName,
        }
        const combineaddress = inputs.address.concat(", ", address.province, ", ", address.district, ", ", address.ward)
        const response = await axios({
            method: "post",
            url: `${apiUrl}/api/orders/new`,
            data: {
                customerName: inputs.fullName,
                customerPhone: inputs.phoneNumber,
                products: order,
                totalPrice: total,
                customerAddress: combineaddress,
            },
        })
        if (response.data.success) {
            swal({
                title: "ORDER SUCCESS!",
                text: "Click OK to back to menu",
                icon: "success",
                button: "OK",
            }).then(() => {
                afterDone()
            })
        } else {
            console.log(response.data.message)
        }
    }

    const handleChange = (event) => {
        const name = event.target.name
        const value = event.target.value
        setInputs((values) => ({ ...values, [name]: value }))
    }

    const handleProvinceChange = (event) => {
        const name = event.target.name
        const value = event.target.value
        loadDistrict(value)
        setInputs((values) => ({ ...values, [name]: value }))
    }

    const handleDistrictChange = (event) => {
        const name = event.target.name
        const value = event.target.value
        loadWard(value)
        setInputs((values) => ({ ...values, [name]: value }))
    }

    let provinceOption = <option value="none">...</option>
    if (province) {
        provinceOption = province.map((option) => (
            <option value={option.ProvinceID} key={option.ProvinceID}>
                {option.ProvinceName}
            </option>
        ))
    }

    let districtOption
    if (district) {
        districtOption = district.map((option) => (
            <option value={option.DistrictID} key={option.DistrictID}>
                {option.DistrictName}
            </option>
        ))
    }

    let wardOption
    if (ward) {
        wardOption = ward.map((option) => (
            <option value={option.WardCode} key={option.WardCode}>
                {option.WardName}
            </option>
        ))
    }

    const provinceApi = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data"
    const loadProvince = async () => {
        try {
            const response = await axios({
                method: "get",
                url: `${provinceApi}/province`,
                headers: {
                    token: "33103c88-ec46-11eb-9388-d6e0030cbbb7",
                },
            })
            setProvince(response.data.data)
        } catch (error) {
            console.log(error)
        }
    }
    const loadDistrict = async (value) => {
        try {
            const response = await axios({
                method: "get",
                url: `${provinceApi}/district`,
                headers: {
                    token: "33103c88-ec46-11eb-9388-d6e0030cbbb7",
                },
            })
            const districtdata = response.data.data.filter((x) => x.ProvinceID == value)
            setDistrict(districtdata)
        } catch (error) {
            console.log(error)
        }
    }
    const loadWard = async (value) => {
        try {
            const response = await axios({
                method: "get",
                url: `${provinceApi}/ward?district_id=${value}`,
                headers: {
                    token: "33103c88-ec46-11eb-9388-d6e0030cbbb7",
                },
            })
            setWard(response.data.data)
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <div className="container my-md-5">
            <h4 style={{ textAlign: "center" }}>Your information</h4>
            <div className="row py-md-5">
                <div className="col-md-6">
                    <Form onSubmit={handleSubmit}>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Your name</Form.Label>
                            <Form.Control type="text" placeholder="Nguyen Van A..." name="fullName" value={inputs.fullName || ""} onChange={handleChange} required />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Phone number</Form.Label>
                            <Form.Control type="text" placeholder="0123........" name="phoneNumber" value={inputs.phoneNumber || ""} onChange={handleChange} required />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Province</Form.Label>
                            <Form.Select id="Province" name="province" onChange={handleProvinceChange}>
                                <option value="none">Choose Province</option>
                                {provinceOption}
                            </Form.Select>
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>District</Form.Label>
                            <Form.Select id="District" name="district" onChange={handleDistrictChange}>
                                <option value="none">Choose District</option>
                                {districtOption}
                            </Form.Select>
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Ward</Form.Label>
                            <Form.Select id="Ward" name="ward" onChange={handleChange}>
                                <option value="australia">Choose Ward</option>
                                {wardOption}
                            </Form.Select>
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Address</Form.Label>
                            <Form.Control type="text" placeholder="etc: 474 Nguyen Tri Phuong" name="address" value={inputs.address || ""} onChange={handleChange} />
                        </Form.Group>
                        <div className="center">
                            <Button type="submit">Checkout</Button>
                        </div>
                    </Form>
                </div>
                <div className="col-md-6">
                    <table style={{ width: "100%" }}>
                        <tbody>
                            {order.map((product) => (
                                <tr key={product._id}>
                                    <td style={{ width: "70%" }}>{product.productName}</td>
                                    <td style={{ width: "15%" }}>x{product.buyquantity}</td>
                                    <td style={{ width: "15%" }}>{format(product.price * product.buyquantity)}</td>
                                </tr>
                            ))}
                            <tr>
                                <td colSpan={2} style={{ fontWeight: "bold" }}>
                                    Total:{" "}
                                </td>
                                <td style={{ fontWeight: "bold" }}>{format(total)}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    )
}

export default CheckoutForm
