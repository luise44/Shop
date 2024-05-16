const baseApiUrl = "https://localhost:44380/";

export const fetchData = async (url) => {
    const rawResponse = await fetch(baseApiUrl + url);
    const response = await rawResponse.json();
  
    if (rawResponse.status === 200) {
      return response;
    }
  
    throw response;
  };


export const postData = async (url, data) => {
  const rawResponse = await fetch(baseApiUrl + url, {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    }
  );

  if (rawResponse.status === 200) {
    try {
      const response = await rawResponse.json();
      return {
        isOk: true,
        response
      };
    } catch {
      return {
        isOk: true
      };
    }
  } else {
    return {
      isOk: false,
      errorMessage: await rawResponse.text()
    };
  }
};
