import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { findCustomerByName } from "../api/customers";


const initialState = {
    customers : []
};

export const findCustomers = createAsyncThunk(
    'customer/findCustomers',
    async (searchString) => {
        return await findCustomerByName(searchString);
    }
);

const customerSlice = createSlice({
    name: 'customer',
    initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder.addCase(findCustomers.fulfilled, (state, action) => {
            state.customers = action.payload;
        })
    }
});


export const { search } = customerSlice.actions;

export default customerSlice.reducer;
