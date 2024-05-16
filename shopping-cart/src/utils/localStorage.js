const saveCart = (shoppingCart) => {
    const cartJson = JSON.stringify(shoppingCart);
    localStorage.setItem('shoppingCart', cartJson);
}

const getCart = () => {
    const localCart = JSON.parse(localStorage.getItem('shoppingCart'));
    return localCart ? localCart : [];
}

const clearCart = () => {
    localStorage.removeItem('shoppingCart');
}

export { saveCart, getCart, clearCart }
