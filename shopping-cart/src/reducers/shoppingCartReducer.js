import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { saveCart, getCart, clearCart } from "../utils/localStorage";
import { createOrder } from "../api/orders";
import { toast } from "react-toastify";


const initialState = {
    products: getCart()
};

export const processOrder = createAsyncThunk(
    'shoppingCart/processOrder',
    async (customerSelected, { getState }) => {
        const { shoppingCart } = getState();
        const order = {
            customerId: customerSelected.id,
            orderDetails: shoppingCart.products.map((item) => {
                return {
                    productId: item.id,
                    quantity: item.quantity
                }
            })
        }

        return {
            response: await createOrder(order)
        };
    }
);

const shoppingCartSlice = createSlice({
    name: 'shoppingCart',
    initialState,
    reducers: {
        addProductToCart: (state, action) => {
            const { products } = state;
            const { product, quantity } = action.payload;
            const productOnCart = products.find((item) => item.id === product.id);
            const subTotal = (quantity * product.price).toFixed(2);
            if (productOnCart) {
                if (quantity == 0) {
                    state.products = state.products.filter((x) => x.id !== productOnCart.id);
                }
                productOnCart.quantity = quantity;
                productOnCart.subTotal = subTotal;
            } else if (quantity) {
                state.products.push({...product,
                    quantity,
                    subTotal});
            }
            saveCart(products);
        }
    },
    extraReducers: (builder) => {
        builder.addCase(processOrder.fulfilled, (state, action) => {
            const { response } = action.payload;
            if (response.isOk) {
                state.products = [];
                clearCart();
                toast.success("Order created succesfully..!")
            } else {
                if (response.errorMessage) {
                    toast.error(response.errorMessage);
                } else {
                    toast.error("There was an error while creating the order..!")
                }
            }
        })
    }

    
});

export const { addProductToCart } = shoppingCartSlice.actions;

export default shoppingCartSlice.reducer;
