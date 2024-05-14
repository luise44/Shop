using Shop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Interfaces
{
    public interface IProductRepository : IBaseRepository<Product>
    {
        Task<List<Product>> GetAll(int pageNumber, int pageSize);
    }
}
