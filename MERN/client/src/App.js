import "./App.css"
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Landing from "./components/landing/Landing"
import HomeView from "./views/HomeView"
import Header from "./components/header/Header"
function App() {
    return (
        <Router>
            <Header />
            <Routes>
                <Route exact path="/" element={<Landing />} />
                <Route exact path="/home" element={<HomeView />} />
            </Routes>
        </Router>
    )
}

export default App
