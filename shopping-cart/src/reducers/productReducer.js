import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { fetchProducts } from "../api/products";


const initialState = {
    products : []
};

export const getProducts = createAsyncThunk(
    'customer/findCustomers',
    async () => {
        return await fetchProducts();
    }
);

const productSlice = createSlice({
    name: 'product',
    initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder.addCase(getProducts.fulfilled, (state, action) => {
            state.products = action.payload;
        })
    }
});

export default productSlice.reducer;
