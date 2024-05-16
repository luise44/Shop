import { fetchData } from "./httpClient";


export const fetchProducts = async (pageNumber, itemsQuantity) => {
    const fullUrl = `api/products/${pageNumber}/${itemsQuantity}`;
    return await fetchData(fullUrl);
  };
