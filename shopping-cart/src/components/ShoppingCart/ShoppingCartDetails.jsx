import { useSelector } from "react-redux";
import './shoppingCartDetails.css';
import { processOrder } from "../../reducers/shoppingCartReducer";
import { useDispatch } from "react-redux";
import { toast } from "react-toastify";


const ShoppingCartDetails = () => {
    const { products } = useSelector((state) => state.shoppingCart);
    const totalUnits = products.reduce((accumulator, currentValue) => {
        return accumulator + currentValue.quantity;
    },0);
    const totalOrder = products.reduce((accumulator, currentValue) => {
        return accumulator + (currentValue.quantity * currentValue.subTotal);
    },0);
    const { customerSelected } = useSelector((state)=> state.customer);
    const dispatch = useDispatch();

    const isOrderValid = () => {
        let isValid = true;
        let validationMessage = "";
        if (!products || products.length == 0) {
            isValid = false;
            validationMessage = 'Please add products to the shoppping cart..!'
        } else if (!customerSelected) {
            isValid = false;
            validationMessage = 'Please select a customer..!'
        }

        if (!isValid)
            toast.warning(validationMessage);

        return isValid;
    }

    const onProcessOrder = () => {
        if (isOrderValid()) {
            dispatch(processOrder(customerSelected));
        }
    }

    return (
        <div className="shopping-cart-details">
            <div className="shopping-cart-details__title-container">
                <h3>Shopping cart details</h3>
            </div>
            <div>
                <span>Items ({totalUnits} units)</span>
            </div>
            <div className="shopping-cart-details__total-container">
                <span>Total Order: </span>
                <span>{totalOrder}</span>
            </div>
            <div className="shopping-cart-details__process-order-container">
                <button
                    onClick={() => onProcessOrder()}
                    className="shopping-cart-details__process-order-button"
                >
                    Process Order
                </button>
            </div>
        </div>
    )
}

export default ShoppingCartDetails;
