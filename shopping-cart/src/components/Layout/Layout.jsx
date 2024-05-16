import { Outlet, Link } from "react-router-dom";
import "./layout.css"
import { useSelector } from "react-redux";
import CustomerSelector from "../../components/Customer/CustomerSelector";
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';


const Layout = () => {
    const shoppingCartProducts = useSelector((state => state.shoppingCart.products));
    const shoppingCartTotalItems = shoppingCartProducts.length;

    return (
        <div>
            <header className="layout-header">
                <ul>
                    <li><Link to="/">Catalog</Link></li>
                    <li className="layout__shopping-cart-link-container">
                        <Link to="/shoppingcart">Shopping Cart</Link>
                        <span className="layout__shopping-cart-quantity">{shoppingCartTotalItems}</span>
                    </li>
                </ul>
                <ToastContainer />
            </header>
            <main>
                <div className="layout__customer-container">
                    <CustomerSelector />
                </div>
                <Outlet />
            </main>
        </div>
        
    );
}

export default Layout;
