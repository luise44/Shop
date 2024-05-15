import { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { findCustomers } from "../../reducers/customerReducer";

const CustomerSelector = () => {
    const [stringSearch, setStringSearch] = useState('');
    const dispatch = useDispatch();
    const customersFound = useSelector((state) => state.customer.customers);

    useEffect(()=>{
        if (stringSearch.length >= 3)
        {
            dispatch(findCustomers(stringSearch));
        }
    }, [stringSearch, dispatch])

    return (
        <>
            <strong>Find and Select the customer</strong>
            <input value={stringSearch} onChange={e => setStringSearch(e.target.value)}></input>
            {
                customersFound && customersFound.map((item, index) =>
                    (
                        <div key={index}>{item.name}</div>
                    )
                )
            }
        </>
    );
}

export default CustomerSelector;