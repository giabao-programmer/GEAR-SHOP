import "./App.css"
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Landing from "./components/landing/Landing"
import HomeView from "./views/HomeView"
import DetailView from "./views/DetailView"
import Header from "./components/header/Header"
import ProductContextProvider from "./contexts/ProductContext"
import CategoryContextProvider from "./contexts/CategoryContext"
import Nav from "./components/navbar/Nav"
import CartContextProvider from "./contexts/CartContext"
function App() {
    return (
        <>
            <Header />
            <CartContextProvider>
                <CategoryContextProvider>
                    <ProductContextProvider>
                        <Router>
                            <Nav />
                            <Routes>
                                <Route exact path="/" element={<Landing />} />
                                <Route exact path="/home" element={<HomeView />} />
                                <Route exact path="/detail/:id" element={<DetailView />} />
                            </Routes>
                        </Router>
                    </ProductContextProvider>
                </CategoryContextProvider>
            </CartContextProvider>
        </>
    )
}

export default App
