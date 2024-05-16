import './catalogItem.css';
import { addProductToCart } from '../../reducers/shoppingCartReducer';
import { useDispatch } from 'react-redux';
import { setProductQuantity } from '../../reducers/productReducer';

const CatalogItem = (props) => {
    const { product } = props;
    const dispatch = useDispatch();

    const incrementQuantity = () => {
        const newQuantity = (Number(product.quantity) + 1);
        if (newQuantity <= product.stock) {
            const payload = {
                product,
                quantity: newQuantity
            };
            dispatch(setProductQuantity(payload));
            dispatch(addProductToCart(payload));
        }
    }

    const decrementQuantity = () => {
        const newQuantity = (Number(product.quantity) - 1);
        if (newQuantity >= 0)
        {
            const payload = {
                product,
                quantity: newQuantity
            };
            dispatch(setProductQuantity(payload));
            dispatch(addProductToCart(payload));
        }
    }

    return (
        <div className="catalog-item">
            <div className="catalog-item__product-card">
                <strong>{product.title}</strong>
                <div>
                    <span>Item No: {product.code}</span>
                    <span className="catalog-item__product-card-stock">Stock: {product.stock}</span>
                </div>
                <span>{product.description}</span>
            </div>
            <div className="catalog-item__product-price">
                <span>{product.price}</span>
            </div>
            <div className="catalog-item__product-quantity">
                <button onClick={()=> decrementQuantity()}>-</button>
                <input readOnly value={product.quantity}></input>
                <button onClick={()=> incrementQuantity()}>+</button>
            </div>
            <div className="catalog-item__product-subTotal">
                <strong>{product.subTotal}</strong>
            </div>
        </div>
    );
}

export default CatalogItem;
