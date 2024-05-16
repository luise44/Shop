import { postData } from "./httpClient";

export const createOrder = async (order) => {
    const fullUrl = `api/orders`;
    const a = await postData(fullUrl, order);
    return a;
}
