import { useEffect } from "react";
import CatalogItem from "../../components/Catalog/CatalogItem"; 
import CustomerSelector from "../../components/Customer/CustomerSelector";
import './catalog.css';
import { useSelector, useDispatch } from "react-redux";
import { getProducts } from "../../reducers/productReducer";

const Catalog = () => {
    const products = useSelector((state) => state.product.products);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(getProducts());
    }, [dispatch]);

    return (
        <div>
            <div className="catalog__customer-container">
                <CustomerSelector />
            </div>
            <div className="catalog__products-container">
            {
                products && products.map((item, index) => (
                    <div  key={index} >
                        <CatalogItem key={index} catalogItem={item}/>
                    </div>
                ))
            }
            </div>
            <div className="catalog__pagging-container">
                <button className="catalog__pagging-container-item">
                    <span>&#8592;</span>
                    <span>Previous</span>
                </button>
                <button className="catalog__pagging-container-item">
                    <span>Next</span>
                    <span>&#8594;</span>
                </button>
            </div>
            <button>Add to Shopping Cart</button>
        </div>
    );
}

export default Catalog;
