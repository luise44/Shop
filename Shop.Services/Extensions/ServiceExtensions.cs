using Data.Repositories.Extensions;
using Microsoft.Extensions.DependencyInjection;
using Shop.Services.Interfaces;
using Shop.Services.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Extensions
{
    public static class ServiceExtensions
    {
        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            return services
                .AddRepositories()
                .AddTransient<IProductService, ProductService>()
                .AddTransient<ICustomerService, CustomerService>();
        }
    }
}
