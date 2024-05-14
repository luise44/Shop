using Data.Repositories.Interfaces;
using Data.Repositories.Repositories;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Extensions
{
    public static class RepositoryExtensions
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
        {
            return services
                .AddTransient<IProductRepository, ProductRepository>()
                .AddTransient<ICustomerRepository, CustomerRepository>()
                .AddTransient<IOrderRepository, OrderRepository>()
                .AddTransient<ICategoryRepository, CategoryRepository>();
        }
    }
}
