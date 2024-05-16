import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { findCustomerByName } from "../api/customers";


const initialState = {
    customers : [],
    customerSelected: null
};

export const findCustomers = createAsyncThunk(
    'customer/findCustomers',
    async (searchString) => {
        return {
            customers: await findCustomerByName(searchString)
        }
    }
);

const customerSlice = createSlice({
    name: 'customer',
    initialState,
    reducers: {
        setCustomerSelected: (state, action) => {
            state.customerSelected = action.payload.customer;
            state.customers = [];
        }
    },
    extraReducers: (builder) => {
        builder.addCase(findCustomers.fulfilled, (state, action) => {
            state.customers = action.payload.customers;
        })
    }
});


export const { search, setCustomerSelected } = customerSlice.actions;

export default customerSlice.reducer;
