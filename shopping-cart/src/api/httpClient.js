export const fetchData = async (url) => {
    const rawResponse = await fetch(url);
    const response = await rawResponse.json();
  
    if (rawResponse.status === 200) {
      return response;
    }
  
    throw response;
  };
