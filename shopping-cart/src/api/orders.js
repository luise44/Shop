import { postData } from "./httpClient";

export const createOrder = async (order) => {
    const fullUrl = `https://localhost:44380/api/orders`;
    const a = await postData(fullUrl, order);
    return a;
}
