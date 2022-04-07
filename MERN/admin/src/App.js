import "./App.css"
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Landing from "./components/navigate/Landing"
import LoginView from "./views/LoginView"
import "bootstrap/dist/css/bootstrap.min.css"
import AuthContextProvider from "./contexts/AuthContext"
import ManagementView from "./views/ManagementView"

function App() {
    return (
        <AuthContextProvider>
            <Router>
                <Routes>
                    <Route exact path="/" element={<Landing />} />
                    <Route exact path="/login" element={<LoginView />} />
                    <Route exact path="/management" element={<ManagementView />} />
                </Routes>
            </Router>
        </AuthContextProvider>
    )
}

export default App
