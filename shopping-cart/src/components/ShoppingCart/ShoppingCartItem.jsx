import './shoppingCartItem.css';
import { addProductToCart } from '../../reducers/shoppingCartReducer';
import { useDispatch } from 'react-redux';
import { toast } from 'react-toastify';

const ShoppingCartItem = (props) => {
    const { product } =  props;
    const dispatch = useDispatch();

    const setQuantity = (quantity) => {
        if (quantity > product.stock) {
            quantity = product.stock;
            toast.warning("Value can't be bigger than the available stock..!"); 
        }
            
        dispatch(addProductToCart({product , quantity}));
    }

    return (
        <div className="shopping-cart-item">
            <div className="shopping-cart-item__product-card">
                <strong>{product.title}</strong>
                <span>{product.code}</span><span>{product.stock}</span>
                <span>{product.description}</span>
            </div>
            <div className="shopping-cart-item__product-price">
                <span>{product.price}</span>
            </div>
            <div className="shopping-cart-item__product-quantity">
                <input
                    className="shopping-cart-item__product-quantity-input" 
                    value={product.quantity}
                    min={0}
                    max={product.stock}
                    onChange={(e)=> setQuantity(e.currentTarget.value)}>
                </input>
            </div>
            <div className="shopping-cart-item__product-total">
                <span>{product.subTotal}</span>
            </div>
        </div>
    );
}

export default ShoppingCartItem;
