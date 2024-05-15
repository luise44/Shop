import { configureStore } from "@reduxjs/toolkit";
import customerReducer from "../reducers/customerReducer";
import productReducer from "../reducers/productReducer";

const store = configureStore({
    reducer: {
        customer: customerReducer,
        product: productReducer
    }
})

export default store;
