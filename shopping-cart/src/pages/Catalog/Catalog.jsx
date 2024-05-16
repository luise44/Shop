import { useEffect } from "react";
import CatalogItem from "../../components/Catalog/CatalogItem"; 
import './catalog.css';
import { useSelector, useDispatch } from "react-redux";
import { getProducts, nextPage, previousPage } from "../../reducers/productReducer";

const Catalog = () => {
    const { products, totalPages, pageNumber } = useSelector((state) => state.product);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(getProducts({ pageNumber, pageSize: 10 }));
    }, [dispatch, pageNumber]);

    return (
        <div>
            <div className="catalog__products-container">
            {
                products && products.map((item) => (
                    <CatalogItem key={item.id} product={item}/>
                ))
            }
            </div>
            <div className="catalog__pagging-container">
                <button
                    disabled={ pageNumber === 1}
                    className="catalog__pagging-container-item"
                    onClick={()=> dispatch(previousPage())}
                >
                    <span>&#8592;</span>
                    <span className="catalog__pagging-container-item-label">Previous</span>
                </button>
                Page {pageNumber} of {totalPages}
                <button
                    disabled={ pageNumber === totalPages}
                    className="catalog__pagging-container-item"
                    onClick={()=> dispatch(nextPage())}
                >
                    <span className="catalog__pagging-container-item-label">Next</span>
                    <span>&#8594;</span>
                </button>
            </div>
        </div>
    );
}

export default Catalog;
