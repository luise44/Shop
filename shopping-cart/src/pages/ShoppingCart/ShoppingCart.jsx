import ShoppingCartDetails from "../../components/ShoppingCart/ShoppingCartDetails";
import ShoppingCartItem from "../../components/ShoppingCart/ShoppingCartItem";
import { useSelector } from "react-redux";

import './shoppingCart.css'; 


const ShoppingCart = () => {
    const { products } = useSelector((state) => state.shoppingCart);

    return (
        <div className="shopping-cart">
            <div className="shopping-cart__products-container">
            {
                products && products.map((item) => (
                    <div key={item.id} >
                        <ShoppingCartItem product={item}/>
                    </div>
                ))
            }
            </div>
            <div className="shopping-cart__details-container">
                <ShoppingCartDetails />
            </div>
        </div>
    );

}

export default ShoppingCart;
