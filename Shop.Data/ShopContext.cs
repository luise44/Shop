using Microsoft.EntityFrameworkCore;
using Shop.Data.Entities;

namespace Shop.Data
{
    public class ShopContext : DbContext
    {
        public ShopContext(DbContextOptions<ShopContext> options) : base(options)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder
                .Entity<OrderDetail>()
                .HasKey(d => new { d.Sequence, d.OrderId });

            builder
                .Entity<ProductCategory>()
                .HasKey(pc => new { pc.ProductId, pc.CategoryId });
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> Orders { get; set; }
    }
}
