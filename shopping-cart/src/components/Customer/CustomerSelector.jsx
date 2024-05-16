import { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { findCustomers, setCustomerSelected } from "../../reducers/customerReducer";
import './customerSelector.css';

const CustomerSelector = () => {
    const [stringSearch, setStringSearch] = useState('');
    const dispatch = useDispatch();
    const { customers, customerSelected } = useSelector((state) => state.customer);

    useEffect(()=>{
        if (stringSearch.length >= 3)
        {
            dispatch(findCustomers(stringSearch));
        }
    }, [stringSearch, dispatch])

    const onCustomerSelected = (customer) => {
        dispatch(setCustomerSelected({customer}));
    }

    return (
        <div className="customer-selector">
            <strong>Find and Select the customer</strong>
            <input value={stringSearch} onChange={e => setStringSearch(e.target.value)}></input>
            <div className="customer-selector__suggestions">
            {
                customers && customers.map((item, index) =>
                    (
                        <div 
                            className="customer-selector__suggestion"
                            key={index}
                            onClick={()=> onCustomerSelected(item)}
                        >
                            <span>{item.name}&nbsp;{item.lastName}</span>
                        </div>
                    )
                )
            }
            </div>
            <div className="customer-selector__customer-selected-container">
                <h3>Customer:</h3>&nbsp;&nbsp;
                {
                    customerSelected && (
                        <>
                            <h3>{customerSelected.name}</h3>
                            &nbsp;
                            <h3>{customerSelected.lastName}</h3>
                        </>
                    )
                }
            </div>
        </div>
    );
}

export default CustomerSelector;