import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { fetchProducts } from "../api/products";
import { getCart } from "../utils/localStorage";


const initialState = {
    products : [],
    pageNumber: 1,
    totalPages: 0
};

export const getProducts = createAsyncThunk(
    'customer/findProducts',
    async (pagingOptions) => {
        const { pageNumber, pageSize } = pagingOptions;
        return await fetchProducts(pageNumber, pageSize);
    }
);

const productSlice = createSlice({
    name: 'product',
    initialState,
    reducers: {
        nextPage: (state) => {
            state.pageNumber += 1;
        },
        previousPage: (state) => {
            state.pageNumber -= 1;
        },
        setProductQuantity: (state, action) => {
            const { products } = state;
            const { product, quantity } = action.payload;
            const productToUpdate = products.find((item) => item.id === product.id);
            if (productToUpdate) {
                productToUpdate.quantity = quantity;
                productToUpdate.subTotal = (quantity * productToUpdate.price).toFixed(2);
            }
        }
    },
    extraReducers: (builder) => {
        builder.addCase(getProducts.fulfilled, (state, action) => {
            const localStorageCart = getCart();
            state.products = action.payload.products.map((item) => {
                const localCartItem = localStorageCart.find((x) => x.id === item.id);
                const quantity = localCartItem ? localCartItem.quantity : 0;
                return {...item, quantity: quantity, subTotal: (item.price * quantity).toFixed(2)}
            });
            state.totalPages = action.payload.totalPages;
        })
    }
});

export const { nextPage, previousPage, setProductQuantity } = productSlice.actions;

export default productSlice.reducer;
