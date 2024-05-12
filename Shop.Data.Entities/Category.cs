namespace Shop.Data.Entities
{
    public class Category : BaseEntity
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public IList<ProductCategory> ProductCategories { get; set; }
    }
}
