import './App.css'
import Catalog from './pages/Catalog/Catalog'
import ShoppingCart from './pages/ShoppingCart/ShoppingCart'
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Layout from './components/Layout/Layout';

function App() {
  return (
      <Router>
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route index element={<Catalog />} />
            <Route path="/shoppingcart" element={<ShoppingCart />} />
          </Route>
        </Routes>
      </Router>
  )
}

export default App
