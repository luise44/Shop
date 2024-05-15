import { fetchData } from "./httpClient";


export const findCustomerByName = async (name) => {
    const fullUrl = `https://localhost:44380/api/customers/1/5/${name}`;
    return await fetchData(fullUrl);
  };
