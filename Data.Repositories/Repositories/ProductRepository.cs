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
    public class ProductRepository(ShopContext context) :
        BaseRepository<Product,ShopContext>(context), IProductRepository
    {
        private readonly ShopContext _shopContext = context;
        public async Task<List<Product>> GetAll(int pageNumber, int pageSize)
        {
            return await _shopContext
                .Set<Product>()
                .OrderBy(x => x.Title)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }
    }
}
