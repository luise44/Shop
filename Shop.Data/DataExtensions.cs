using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;

namespace Shop.Data
{
    public static class DataExtensions
    {
        public static IServiceCollection AddShopContext(this IServiceCollection services, string connectionString)
        {
            return services.AddDbContext<ShopContext>(options =>
            {
                options.UseSqlServer(connectionString);
            },
                ServiceLifetime.Scoped
            );
        }
    }
}
