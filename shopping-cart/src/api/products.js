import { fetchData } from "./httpClient";


export const fetchProducts = async () => {
    const fullUrl = `https://localhost:44380/api/products/1/10`;
    return await fetchData(fullUrl);
  };
