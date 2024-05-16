# React with .NET 8 Application

This repository contains an application that combines React frontend with vite and .NET 8 backend. Below are instructions on how to install and prepare the environment to run both applications.

## Prerequisites

Make sure you have the following installed:

- Node.js (v14 or higher)
- npm (Node Package Manager)
- .NET SDK 8

## Setting up the React Frontend

1. **Clone the Repository**: 
    ```bash
    git clone https://github.com/luise44/Shop.git
    ```

2. **Navigate to the Frontend Directory**:
    ```bash
    cd \shop\shopping-cart
    ```

3. **Install Dependencies**:
    ```bash
    npm install
    ```

4. **Start the Development Server**:
    ```bash
    npm run dev
    ```

    you will see an output like this indicating where the app is running
    ```bash
         VITE v5.2.11  ready in 247 ms
            ➜  Local:   http://localhost:5173/
            ➜  Network: use --host to expose
            ➜  press h + enter to show help
    ```


## Setting up the .NET 8 Backend

1. **Navigate to the Backend Directory**:
    ```bash
    cd \Shop
    ```

2. **Build the Project**:
    ```bash
    dotnet build
    ```

3. **Navigate to the API Directory**:
    ```bash
    cd \Shop\Shop.Api
    ```

3. **Run the Application**:
    ```bash
    dotnet run
    ```
   you will see an ouput like this indicating where the api is running
    ```bash
    info: Microsoft.Hosting.Lifetime[14]
    Now listening on: http://localhost:5122
    ```

## Setting Up the front End

Is necessary to update the front end api url to be able to get the api data from the fron app
https://github.com/luise44/Shop/blob/b950bae69f39ee5370dcb19b6abde80fdc86c1f0/shopping-cart/src/api/httpClient.js#L1

## Setting Up the back End

Is necessary to update the back end database string connection in order to connect to the database
https://github.com/luise44/Shop/blob/b950bae69f39ee5370dcb19b6abde80fdc86c1f0/Shop.Api/appsettings.json#L10


## Setting Up the Database

You will find a SQL script that can bee used to create the schema and to populate the data



## Using the Application

Once both frontend and backend are running, you can access the application in your web browser.
To create an order you can start on the catalog page and add values to the quantity field, this will add the product to the cart
To create an order yo need to select the products and the customer
