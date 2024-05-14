import { Outlet } from "react-router-dom";
import "./layout.css"

const Layout = () => {
    return (
        <div>
            <header className="layout-header">
                <ul>
                    <li><a href="/">Catalog</a></li>
                    <li><a href="/shoppingcart">Shopping Cart</a></li>
                </ul>
            </header>
            <main>
                <Outlet />
            </main>
        </div>

    );
}

export default Layout;
