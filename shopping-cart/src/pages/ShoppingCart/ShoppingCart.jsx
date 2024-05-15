import ShoppingCartDetails from "../../components/ShoppingCart/ShoppingCartDetails";
import ShoppingCartItem from "../../components/ShoppingCart/ShoppingCartItem";

const ShoppingCart = () => {

    return (
        <div>
            <input></input>
            {
                Array.from({ length: 4 }).map((_, index) => (
                    <div  key={index} >
                        <ShoppingCartItem key={index} />
                    </div>
                ))
            }
            <ShoppingCartDetails />
            <button>Add to Shopping Cart</button>
        </div>
    );

}

export default ShoppingCart;
