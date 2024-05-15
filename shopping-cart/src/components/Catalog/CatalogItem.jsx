import './catalogItem.css';


const CatalogItem = (props) => {
    const { catalogItem } = props;

    return (
        <div className="catalog-item">
            <strong>{catalogItem.title}</strong>
            <span>{catalogItem.code}</span>
            <span>{catalogItem.description}</span>
            <span>{catalogItem.price}</span>
            <span>{catalogItem.stock}</span>
            <button>-</button>
            <input></input>
            <button>+</button>
        </div>
    );
}

export default CatalogItem;
