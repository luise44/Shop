import { fetchData } from "./httpClient";


export const findCustomerByName = async (name) => {
    const fullUrl = `api/customers/1/5/${name}`;
    return await fetchData(fullUrl);
  };
