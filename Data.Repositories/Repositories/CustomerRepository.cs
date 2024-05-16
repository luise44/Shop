using Data.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Shop.Data;
using Shop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Repositories
{
    public class CustomerRepository(ShopContext context) :
        BaseRepository<Customer, ShopContext>(context), ICustomerRepository
    {
        private readonly ShopContext _shopContext = context;
        public async Task<List<Customer>> GetCustomersByName(int pageNumber, int pageSize, string searchString)
        {
            return await _shopContext
                .Set<Customer>()
                .Where(x=> x.Name.Contains(searchString) ||
                    x.LastName.Contains(searchString))
                .OrderBy(x => x.Name)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }
    }
}
