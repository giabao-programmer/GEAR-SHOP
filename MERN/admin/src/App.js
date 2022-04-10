import "./App.css"
import "./styles.css"
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Landing from "./components/navigate/Landing"
import LoginView from "./views/LoginView"
import "bootstrap/dist/css/bootstrap.min.css"
import AuthContextProvider from "./contexts/AuthContext"
import ManagementView from "./views/ManagementView"
import ProductContextProvider from "./contexts/ProductContext"
import OrderContextProvider from "./contexts/OrderContext"
function App() {
    return (
        <AuthContextProvider>
            <ProductContextProvider>
                <OrderContextProvider>
                    <Router>
                        <Routes>
                            <Route exact path="/" element={<Landing />} />
                            <Route exact path="/login" element={<LoginView />} />
                            <Route exact path="/management/product" element={<ManagementView manage="product" />} />
                            <Route exact path="/management/order" element={<ManagementView manage="order" />} />
                        </Routes>
                    </Router>
                </OrderContextProvider>
            </ProductContextProvider>
        </AuthContextProvider>
    )
}

export default App
