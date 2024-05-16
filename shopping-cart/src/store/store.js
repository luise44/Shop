import { configureStore } from "@reduxjs/toolkit";
import customerReducer from "../reducers/customerReducer";
import productReducer from "../reducers/productReducer";
import shoppingCartReducer from "../reducers/shoppingCartReducer";

const store = configureStore({
    reducer: {
        customer: customerReducer,
        product: productReducer,
        shoppingCart: shoppingCartReducer
    }
})

export default store;
