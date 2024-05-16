import { fetchData } from "./httpClient";


export const fetchProducts = async (pageNumber, itemsQuantity) => {
    const fullUrl = `https://localhost:44380/api/products/${pageNumber}/${itemsQuantity}`;
    return await fetchData(fullUrl);
  };
