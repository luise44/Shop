import CatalogItem from "../../components/Catalog/CatalogItem"; 


const Catalog = () => {

    return (
        <div>
            <input></input>
            {
                Array.from({ length: 4 }).map((_, index) => (
                    <div>
                        <CatalogItem key={index} />
                    </div>
                ))
            }
            <button>Add to Shopping Cart</button>
        </div>
    );
}

export default Catalog;
